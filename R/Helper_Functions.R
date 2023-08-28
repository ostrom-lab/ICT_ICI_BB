################################
# The goal of this query is to do some of easy the data processing steps in SQL first
# because it is more resource efficient for larger datasets.
# This joins data from the SEER, MBSF, and Chronic Conditions file 
# to create a more comprehensive tumor-level summary of the data.
# Each patient should only have one lifetime malignant tumor (sequence == 0), but each tumor may have multiple rows
# depending on how long they were enrolled in medicare (1 row for each enrollment year).
################################
raw_cols = c("patient_id", 
             "sex", 
             "Agerecodewithsingleages_and_100", 
             "state", 
             "county", 
             "Race_recode_W_B_AI_API", 
             "OriginrecodeNHIAHispanicNonHisp", 
             "Census_Tract_2010", 
             "Rural_Urban_Continuum_Code_2013", 
             "UrbanRuralIndicatorCodes2010URI",
             "SEERregistrywithCAandGAaswholes",
             "Sequence_number", 
             "Month_of_diagnosis_recode", 
             "Year_of_diagnosis", 
             "Primary_Site", 
             "Histologic_Type_ICD_O_3", 
             "Behavior_code_ICD_O_3", 
             "Grade", 
             "SEERCombinedSummaryStage2000200",
             "Diagnostic_Confirmation",
             "Type_of_Reporting_Source",
             "Record_number_recode",
             "RX_Summ_Surg_Prim_Site_1998",
             "RX_Summ_Systemic_Surg_Seq", 
             "RX_Summ_Surg_Rad_Seq", 
             "SEERCombinedMetsatDX_brain_2010",
             "SEERCombinedMetsatDX_liver_2010",
             "SEERCombinedMetsat_DX_bone_2010",
             "Mets_at_DX_Distant_LN_2016",
             "Mets_at_DX_Other_2016",
             "CS_mets_at_dx_2004_2015",
             "Radiation", 
             "Radiation_recode", 
             "Chemotherapy_recode_yes_no_unk", 
             "Survival_months", 
             "Survival_months_flag", 
             "Month_of_last_follow_up_recode",
             "Year_of_last_follow_up_recode",
             "Date_of_last_follow_up_flag", 
             "Cause_of_Death_ICD_10", 
             "Date_of_Death_Flag_created", 
             "Vitalstatusrecodestudycutoffuse", 
             "SEER_DateofDeath_Month", 
             "SEER_DateofDeath_Year")

hmo_grabber <- function(x) {
  # 
  # DT2 <- lungraw[, list(data = list(.SD)), by=patient_id]
  # DT2 <- DT2[, hmo_ind := purrr::map_chr(data, ~hmo_grabber(.x))]
  # The HMO Indicators are in a rather inconvenient format.
  # Pivoting to a longer format so it is easier to work with.
  # Then, filter for HMO dates that are in the appropriate range.
  # Finally, if any value is not "0", the patient was enrolled in an HMO
  # at some point during the period of interest
  tmp <- x %>%
    select(date_of_dx, BENE_ENROLLMT_REF_YR, HMO_IND_01:HMO_IND_12) %>%
    pivot_longer(cols = c(HMO_IND_01:HMO_IND_12), names_to = "Month", values_to =  "indicator") %>%
    mutate(Month = gsub("\\D", "", Month),
           hmo_date = as_date(sprintf("%d-%02s-01",BENE_ENROLLMT_REF_YR, Month), format = "%Y-%m-%d"),
           interval = interval(hmo_date, date_of_dx)/months(1)) %>%
    filter(interval <= 6 & interval >= -12)
    # 
    # filter(time_length(date_of_dx - hmo_date, "months") <= 6 &
    #          time_length(hmo_date - date_of_dx, "months") <= 12)
  
  if(any(tmp$indicator != "0")) return(T) else return(F)
}

scrape_diagnoses <- function(data, pos, code = codes[["diagnoses"]]) {
  
  tmp <-
    data %>% 
      rename(any_of(c(ICD_DGNS_CD0 = "PRNCPAL_DGNS_CD"))) %>%
      select(PATIENT_ID, CLM_FROM_DATE, starts_with("ICD_DGNS")) %>%
      distinct() %>%
      mutate(across(dplyr::starts_with("ICD_DGNS"), ~ifelse(.x == "", NA_character_, .x))) %>%
      pivot_longer(cols = starts_with("ICD_DGNS_CD"),
                   names_prefix = "ICD_DGNS_CD",
                   names_to = "DIAG",
                   values_to = "CD") %>% 
      mutate(CD = ifelse(CD == "", NA_character_, gsub("\\.", "", CD))) %>% 
      drop_na(CD) %>% 
      filter(str_detect(CD, paste0(paste0("^", code$code), collapse = "|")))
  
  dat = lapply(seq_along(unique(code$condition)), function(num) {
           
             cond = unique(code$condition)[[num]]
             cond_codes = filter(code, condition == cond) %>% pull(code)
             matches = tmp %>% filter(str_detect(CD, paste0(paste0("^", cond_codes), collapse = "|"))) %>%
               select(PATIENT_ID, CLM_FROM_DATE, CD) %>% 
               distinct() %>% 
               mutate(CONDITION = cond)
             
             return(matches)
  })
 return(reduce(dat, bind_rows))
}

scrape_treatments <- function(data, pos, code = codes[["treatment"]], type = "claims"){
  
  code = code %>%
    mutate(name = ifelse(grepl("chemotherapy_|inhibitor_|betablocker_", treatment, ignore.case = T), 
                         gsub("chemotherapy_|inhibitor_|betablocker_", "", treatment),
                         NA_character_))
  
  HCPCS <- NULL
  NDC <- NULL
  ICD <- NULL
  
  if(type == "claims") {

  icd = data %>% 
    select(PATIENT_ID, CLM_FROM_DATE, starts_with("ICD_PRCDR_CD")) %>% 
    distinct() %>%
    mutate(across(dplyr::starts_with("ICD_PRCDR"), ~ifelse(.x %in% c("", "NA"), NA_character_, as.character(.x)))) %>% 
    pivot_longer(cols = starts_with("ICD_PRCDR_CD"),
                 names_prefix = "ICD_PRCDR_CD",
                 names_to = "PRCDR",
                 values_to = "CD") %>% 
    mutate(CD = ifelse(CD == "", NA_character_, CD)) %>% 
    drop_na(CD) %>%
    filter(CD %in% code$code[which(code$type %in% c("ICD9", "ICD10"))])
  
  other = data %>% 
    select(PATIENT_ID, CLM_FROM_DATE, HCPCS_CD, REV_CNTR_IDE_NDC_UPC_NUM, LINE_NDC_CD) %>%
    mutate(REV_CNTR_IDE_NDC_UPC_NUM = substr(REV_CNTR_IDE_NDC_UPC_NUM, 1, 9),
           LINE_NDC_CD = substr(LINE_NDC_CD, 1, 9)) %>%
    filter(HCPCS_CD %in% code$code[which(code$type %in% c("HCPCS", "CPT"))] |
           REV_CNTR_IDE_NDC_UPC_NUM %in% code$code[which(code$type == "NDC")] |
           LINE_NDC_CD %in% code$code[which(code$type == "NDC")]) %>%
    distinct()
  
for (x in unique(code$treatment)) {
  
    trt_codes = code[which(code$treatment == x),]
    
    if(any(trt_codes$type %in%  c("ICD9", "ICD10"))) {
      
      ICD[[x]] <- icd %>% 
        filter(CD %in% trt_codes$code[which(trt_codes$type %in% c("ICD9", "ICD10"))]) %>%
        select(PATIENT_ID, CLM_FROM_DATE , CD) %>% 
        mutate(TREATMENT = x)
    }     
    
    if(any(trt_codes$type %in% c("HCPCS", "CPT"))) {
      
      HCPCS[[x]] <- other %>% 
        filter(HCPCS_CD  %in% trt_codes$code[which(trt_codes$type %in% c("HCPCS", "CPT"))]) %>%
        select(PATIENT_ID, CLM_FROM_DATE , HCPCS_CD) %>%
        rename(CD = HCPCS_CD) %>% 
        mutate(TREATMENT = x)
    }
    # if(any(trt_codes$type == "NDC")) {
    #   
    #   NDC[[x]] <- other %>%
    #     filter(LINE_NDC_CD %in% trt_codes$code[which(trt_codes$type == "NDC")]) %>%
    #     select(PATIENT_ID, CLM_FROM_DATE, LINE_NDC_CD) %>%
    #     rename(CD = LINE_NDC_CD) %>%
    #     bind_rows(other %>%
    #         filter(REV_CNTR_IDE_NDC_UPC_NUM %in% trt_codes$code[which(trt_codes$type == "NDC")]) %>%
    #         select(PATIENT_ID, CLM_FROM_DATE, REV_CNTR_IDE_NDC_UPC_NUM) %>%
    #         rename(CD = REV_CNTR_IDE_NDC_UPC_NUM)) %>%
    #     mutate(TREATMENT = x)
    # 
    # }
}
  return(bind_rows(reduce(ICD, bind_rows) %>% mutate(CD = as.character(CD)),
                   reduce(HCPCS, bind_rows) %>% mutate(CD = as.character(CD))
                   # , reduce(NDC, bind_rows) %>% mutate(CD = as.character(CD))
                   ) %>% 
           mutate(CLM_FROM_DATE  = as_date(CLM_FROM_DATE , format = "%m/%d/%Y")))
  
  } else if (type == "DME") {
    
    dme = data %>% 
      select(PATIENT_ID, CLM_FROM_DATE, HCPCS_CD, LINE_NDC_CD) %>%
      mutate(LINE_NDC_CD = substr(LINE_NDC_CD, 1, 9)) %>%
      filter(HCPCS_CD %in% code$code[which(code$type %in% c("HCPCS", "CPT"))] |
             LINE_NDC_CD %in% code$code[which(code$type == "NDC")])
    
    for (x in unique(code$treatment)) {
      trt_codes = code[which(code$treatment == x),]
      
      if(any(trt_codes$type %in% c("HCPCS", "CPT"))) {
        HCPCS[[x]] <- dme %>% 
          filter(HCPCS_CD %in% trt_codes$code[which(trt_codes$type %in% c("HCPCS", "CPT"))]) %>%
          select(PATIENT_ID, CLM_FROM_DATE , HCPCS_CD) %>% rename(CD = HCPCS_CD) %>% mutate(TREATMENT = x)
      }
      
      if(any(trt_codes$type == "NDC")) {
        NDC[[x]] <- dme %>%
          filter(LINE_NDC_CD %in% trt_codes$code[which(trt_codes$type == "NDC")]) %>%
          select(PATIENT_ID, CLM_FROM_DATE , LINE_NDC_CD) %>% rename(CD = LINE_NDC_CD) %>% mutate(TREATMENT = x)
      }
    }
    return(bind_rows(reduce(NDC, bind_rows),
                     reduce(HCPCS, bind_rows)))
    
  } else if (type == "PDE") {
    
    pde = data %>% 
      select(PATIENT_ID, CLM_FROM_DATE, PROD_SRVC_ID, GNN) %>%
      mutate(PROD_SRVC_ID = substr(PROD_SRVC_ID, 1, 9)) %>%
      filter(PROD_SRVC_ID %in% code$code[which(code$type == "NDC")] | 
             str_detect(tolower(GNN), paste0(na.omit(unique(code$name)), collapse = "|"))) %>%
      drop_na(PROD_SRVC_ID)
    
    for (x in unique(code$treatment)) {

      trt_codes = code[which(code$treatment == x),]
      name = na.omit(unique(trt_codes$name))
      
      if(any(trt_codes$type == "NDC")) {
        
        if (length(name>0)) {
          
          NDC[[x]] <- pde %>% 
            filter(PROD_SRVC_ID %in% trt_codes$code[which(trt_codes$type == "NDC")] |
                   str_detect(tolower(GNN), name)) %>%
            select(PATIENT_ID, CLM_FROM_DATE, PROD_SRVC_ID) %>% 
            rename(CD = PROD_SRVC_ID) %>%
            mutate(TREATMENT = x)
          
        } else {
          
          NDC[[x]] <- pde %>% 
            filter(PROD_SRVC_ID %in% trt_codes$code[which(trt_codes$type == "NDC")]) %>%
            select(PATIENT_ID, CLM_FROM_DATE , PROD_SRVC_ID) %>% 
            rename(CD = PROD_SRVC_ID) %>%
            mutate(TREATMENT = x)
        }
        }
      }
    }
    return(reduce(NDC, bind_rows))
  }


