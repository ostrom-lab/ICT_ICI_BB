
# Inclusion/Exclusion Criteria:
# Overall -- 
# 1. Age >= 65
# 2. Patients never had ESRD
# 3. Original enrollment reason was not ESRD or Disability
# 4. No HMO participation
# 5. Only 1 primary diagnosis of any cancer (sequence == 0 for malignant tumors or 60 for non-malignant tumors)
# 6. Drop unknown race, sex, follow-up, and date of death

options(readr.show_col_types = F, dplyr.summarise.inform = F)
librarian::shelf(dplyr, tidyr, stringr, readr, purrr, tictoc, lubridate, data.table, dtplyr, 
                 gtsummary, survival, survminer, ggpubr, patchwork, labelled)
splits <- 20
set.seed(1)

source("R/Helper Functions.R")

sources <- c("lung", "brain", "skin")

if (any(!file.exists(sprintf("Data/%s_raw.rds", sources)))) {
  for(site in seq_along(sources[which(!file.exists( sprintf("Data/%s_raw.rds", sources)))])){
    # SEER data file
    raw <- fread(sprintf("Data/%s.csv", sources[[site]]), select = raw_cols) %>%
      filter(if(sources[[site]] == "lung") {
          Histologic_Type_ICD_O_3 %between% c(8010, 8589) &
          str_detect(Primary_Site, "^C34") &
          Behavior_code_ICD_O_3 == 3} 
        else if (sources[[site]] == "brain") {
          Histologic_Type_ICD_O_3 %in% c(9440, 9441, 9442, 9445) &
          str_detect(Primary_Site, "^C71") &
          Behavior_code_ICD_O_3 == 3}         
        else if (sources[[site]] == "skin") {
          Histologic_Type_ICD_O_3 %between% c(8720, 8790) &
          str_detect(Primary_Site, "^C44") &
          Behavior_code_ICD_O_3 == 3}) %>%
      collect()
    
    # MBSF file for HMO enrollment, ESRD, and entitlement reason
    mbsf <- fread("Data/mbsfabcd.csv", 
                  select = c("patient_id", "BENE_DEATH_DT", "BENE_ENROLLMT_REF_YR",
                             "ENTLMT_RSN_ORIG", "ESRD_IND", sprintf("HMO_IND_%02d", 1:12))) %>%
      collect()
    mbsf <- mbsf[patient_id %in% raw$patient_id]
    
    ids <- raw %>%
      select(patient_id, Agerecodewithsingleages_and_100, Year_of_diagnosis, Month_of_diagnosis_recode) %>%
      left_join(collect(select(mbsf, -BENE_DEATH_DT))) %>%
      group_by(patient_id) %>%
      # First round of filtering
      # 2. Patients never had ESRD
      # 3. Original enrollment reason was not ESRD or Disability
      filter(BENE_ENROLLMT_REF_YR >= (Year_of_diagnosis - 1) & BENE_ENROLLMT_REF_YR <= (Year_of_diagnosis + 1)) %>% as_tibble()
    
    #Flowchart #1: Starting number of patients
    flowchart <- length(unique(ids$patient_id))
    
    ids <- ids %>%
      mutate(date_of_dx = as_date(sprintf("%d-%02d-01",Year_of_diagnosis, Month_of_diagnosis_recode), format = "%Y-%m-%d")) %>%
      group_by(patient_id) %>%
      # Ever had ESRD (0 == "No"; "Y" == "Yes")
      filter(all(ESRD_IND == 0) &
               # 65+ years old
               all(Agerecodewithsingleages_and_100 >= 65) &
               # Originally enrolled in medicare due to old age
               all(ENTLMT_RSN_ORIG == 0)) 
    
    #Flowchart #2: Age>=65, No ESRD, enrolled due to age
    flowchart <- c(flowchart, length(unique(ids$patient_id)))
    
    ids <- ids %>%
      nest() %>%
      ungroup() %>%
      mutate(hmo_ind = purrr::map_lgl(data, ~hmo_grabber(.x))) %>%
      filter(hmo_ind == F) %>%
      unnest(data) 
    
    # Flowchart #3: People who enrolled in HMO
    flowchart <- c(flowchart, length(unique(ids$patient_id)))
    
    # Flowchart #4: Get final numbers at end when you combine data and finish filtering.
    
    # For date of death, if needed. Prefer survival coded by SEER whenever possible.
    rawseer <- raw %>% 
      filter(patient_id %in% ids$patient_id) %>%
      left_join(collect(distinct((mbsf), patient_id, BENE_DEATH_DT) %>% drop_na())) %>%
      mutate(date_of_dx = as_date(sprintf("%d-%02d-01",Year_of_diagnosis, Month_of_diagnosis_recode), format = "%Y-%m-%d"))
    
    saveRDS(flowchart, file = sprintf("Data/%s_flowchart.rds", sources[[site]]))
    saveRDS(rawseer, file = sprintf("Data/%s_raw.rds", sources[[site]]))
    write_csv(ids, sprintf("Data/%s_raw.csv", sources[[site]]))
    rm(raw, rawseer, ids, mbsf)
  } 
}

if (any(!file.exists(sprintf("Data/%s_processing_workspace.RDATA", sources[[site]])))) {
  for(site in seq_along(sources[which(!file.exists(sprintf("Data/%s_processing_workspace.RDATA", sources)))])){
    load(sprintf("Data/%s_raw.csv", sources[[site]]))
    
    codes <- NULL
    ids <- NULL
    
    # Diagnosis codes
    
    codes[["diagnoses"]] <- read_csv(sprintf("Files/mets_codes.csv", baseloc)) %>% 
      rename(condition = site) 
    
    # Treatment codes
    
    codes[["treatment"]] <- 
      read_csv("Files/treatmentpattern_codes.csv") %>%
      mutate(type = gsub("[^[:alnum:][:space:]]", "", type),
             code = gsub("[^[:alnum:][:space:]]", "", code)) %>%
      bind_rows(read_csv("Files/immunotherapy_codes.csv") %>% 
                  filter(type == "NDC") %>% 
                  separate(code, c("first", "second", "third"), sep = "-") %>%
                  mutate(first = stringr::str_pad(first, width = 5, "left", pad = "0"),
                         second = stringr::str_pad(second, width = 4, "left", pad = "0"),
                         code = paste0(first,second),
                         treatment = paste0("inhibitor_", str_to_lower(treatment))) %>%
                  select(-c(first:third)))  %>%
      bind_rows(read_csv("Files/immunotherapy_codes.csv") %>% 
                  filter(type != "NDC") %>% 
                  mutate(treatment = paste0("inhibitor_", str_to_lower(treatment)))) %>%
      bind_rows(read_csv("Files/betablocker_codes.csv") %>% 
                  separate(code, c("first", "second", "third"), sep = "-") %>%
                  select(treatment, first:third) %>%
                  mutate(treatment = paste0("betablocker_", str_to_lower(treatment)),
                         first = stringr::str_pad(first, width = 5, "left", pad = "0"),
                         second = stringr::str_pad(second, width = 4, "left", pad = "0"),
                         code = paste0(first,second),
                         type  = "NDC") %>%
                  select(-c(first:third))) %>%
      bind_rows(read_csv("Files/treatcodes.csv") %>%
                  mutate(across(c(type, code), ~gsub("[^[:alnum:][:space:]]", "", .x)))) %>%
      mutate(code = ifelse(type == "NDC", substr(code, 1, 9), code)) 
    
    # "Data/%sclaims.csv" file has claims compiled from all relevant Medicare files. See SAS input statement for more info.
    
    diags <- read_csv_chunked(sprintf("Data/%sclaims.csv", sources[[site]]), callback = DataFrameCallback$new(scrape_diagnoses), chunk_size = 5E6) %>% 
      distinct()
    
    ##### PRIOR TREATMENT HISTORY #####
    ##### Requires using all files #####
    # Treatments codes can be found in Table 1 of the SAP.
    # For the purposes of combing through the data, I'm combining 
    # the treatment patterns with the immune checkpoint inhibitors
    # so it can be done simultaneously.
    # NDC Codes can be found in PDE and DME, and some claims
    # HCPCS/CPT Codes can be found in claims file
    # ICD9/10 Codes can be found in claims file
    
    treatments <- NULL

    treatments[["DME"]] <- scrape_treatments(data = fread(sprintf("Data/%sdme.csv", sources[[site]])),  code = codes[["treatment"]], type = "DME")
    treatments[["PDE"]] <- scrape_treatments(data = fread(sprintf("Data/%pde.csv", sources[[site]])) %>%  rename(CLM_FROM_DATE = SVC_FROM_DT), code = codes[["treatment"]], type = "PDE")
    treatments[["claims"]] <- read_delim_chunked(sprintf("Data/%sclaims.csv", sources[[site]]), callback = DataFrameCallback$new(scrape_treatments), delim = ",",  chunk_size = 3E6)
    
    treatments <- reduce(treatments, bind_rows)
    
    ##### BETA BLOCKER USAGE #####
    ##### Requires using PDE and DME files
    # Prior use of medication will be defined by >=2 dispensing of medications
    # These will be identified within the (PDE) and DME files.
    # This will return dates for each betablocker
    
    ids[["betablocker"]] <- lazy_dt(treatments) %>% 
      filter(str_detect(TREATMENT, "betablocker")) %>%
      arrange(PATIENT_ID, TREATMENT) %>%
      mutate(CLM_FROM_DATE = as_date(CLM_FROM_DATE, format = "%m/%d/%Y")) %>%
      group_by(PATIENT_ID, CD, TREATMENT) %>%
      summarise(min = min(CLM_FROM_DATE),
                max = max(CLM_FROM_DATE)) %>%
      ungroup() %>%
      # at least two codes separated by at least 2 weeks
      filter(interval(min,max)/weeks(2)>=1) %>%
      left_join(rawseer, by = "PATIENT_ID") %>%
      # After diagnosis
      filter(interval(CLM_FROM_DATE, date_of_dx)/months(1) >= 0) %>%
      group_by(PATIENT_ID, TREATMENT) %>%
      summarise(min = min(min)) %>%
      ungroup() %>%
      pivot_wider(id_cols = PATIENT_ID, names_from = TREATMENT, values_from = min) %>%
      as_tibble() %>%
      mutate(any_betablocker = "Yes") %>%
      rowwise() %>%
      mutate(first_betablocker = c_across(!starts_with(c("any_", "PATIENT_ID")), ~{pmin(.x)}))
    
    # Now doing the immune checkpoint inhibitors
    # Only need a single claim at any point. Take start date as date of first claim.
    ids[["inhibitor"]] <- lazy_dt(treatments) %>%
      filter(str_detect(TREATMENT, "inhibitor")) %>%
      group_by(PATIENT_ID, TREATMENT) %>%
      summarise(min = min(CLM_FROM_DATE)) %>%
      ungroup() %>%
      pivot_wider(id_cols = PATIENT_ID, names_from = TREATMENT, values_from = min)%>%
      as_tibble()  %>%
      mutate(any_inhibitor = "Yes")  %>%
      rowwise() %>%
      mutate(first_inhibitor = c_across(!starts_with(c("any_", "PATIENT_ID")), ~{pmin(.x)}))
    
    # All treatments except immune checkpoint inhibitors  
    # Radiation therapy and chemotherapy will be defined by 
    # >=2 claims for the same code separated by at least one week. 
    
    ids[["treatment"]] <- lazy_dt(treatments) %>%
      filter(!str_detect(TREATMENT, "betablocker|inhibitor")) %>%
      group_by(PATIENT_ID, CD, TREATMENT) %>%
      summarise(MIN = min(CLM_FROM_DATE),
                MAX = max(CLM_FROM_DATE)) %>%
      ungroup() %>%
      # # Two codes separated by at least 2 weeks
      filter(!(str_detect(TREATMENT, "radiation|radiotherapy|chemotherapy") & interval(MIN, MAX)/weeks(1) < 1)) %>% 
      group_by(PATIENT_ID, TREATMENT) %>%
      summarise(MAX = max(MAX)) %>%
      ungroup() %>%
      pivot_wider(id_cols = PATIENT_ID, names_from = TREATMENT, values_from = MAX) %>%
      as_tibble()
    
    ##### MET IDENTIFICATION #####
    # Brain Metastases
    # Patients with BM will be defined as those with a diagnosis code 
    # for BM and at least one procedure code for a brain or head diagnostic test within 60 days 
    # of the BM diagnosis (CPT codes 70450-70470, 70551-70553, 78607-78608).
    # These diagnoses and procedures will be identified using the MEDPAR, NCH, 
    # and OUTSAF files
    
    if(sources[[site]] != "brain") {
      ids[["mets"]] <- diags %>% 
        filter(CONDITION == "Brain") %>%
        mutate(CLM_FROM_DATE = as_date(CLM_FROM_DATE, format = "%m/%d/%Y")) %>%
        select(PATIENT_ID, CLM_FROM_DATE) %>%
        group_by(PATIENT_ID) %>%
        nest() %>%
        inner_join(treatments %>% filter(TREATMENT == "diagnostic_imaging") %>%
                     select(PATIENT_ID, CLM_FROM_DATE) %>%
                     group_by(PATIENT_ID) %>%
                     nest(), by = "PATIENT_ID") %>%
        ungroup() %>%
        mutate(metastasis = purrr::map2(data.x, data.y, ~any(map_lgl(.y$CLM_FROM_DATE, function(y) any(abs(time_length(.x$CLM_FROM_DATE - y, "days")) <= 60)))),
               metastasis_date = purrr::map(data.x, ~min(.x$CLM_FROM_DATE))) %>%
        select(-dplyr::starts_with("data")) %>%
        unnest(dplyr::everything()) %>%
        filter(metastasis == T) %>%
        mutate(metastasis = "Brain")
    }
    save(ids, codes, diags, treatments, file = sprintf("Data/%s_processing_workspace.RDATA", sources[[site]]))
  } 
}

if (any(!file.exists(sprintf("Data/%s_final.rds", sources)))) {
  start <- sources[which(!file.exists(paste0("Data/", sources)))]
  for(site in seq_along(sources)){
    
    seerfinal <- lungraw %>% 
      ungroup() %>%
      left_join(ids[["mets"]]) %>%
      left_join(ids[["treatment"]]) %>%
      left_join(ids[["betablocker"]]) %>%
      left_join(ids[["inhibitor"]]) %>%
      left_join(read_csv("Data\\tract.csv") %>%
                  filter(filetype == "03") %>%
                  select(state, county, tract, ctmed) %>%
                  mutate(across(state:county, as.numeric)),
                by = c("Census_Tract_2010" = "tract",
                       "state" = "state",
                       "county" = "county")) %>%
      left_join(read_csv(sprintf("%s_comorbidities.csv", sources[[site]]), col_select = c(PATIENT_ID, CHARLSON)) %>% rename(score = CHARLSON)) 
    
    # Site-specific surgery stuff
    if(sources[[site]] == "skin") {
      seerfinal <- seerfinal %>%
        mutate(seer_surgery = case_when( RX_Summ_Surg_Prim_Site_1998 == 0 ~ "None",
                                         RX_Summ_Surg_Prim_Site_1998 %in% c(10:14,60,90) ~ "Other Surgery",
                                         RX_Summ_Surg_Prim_Site_1998 %in% as.character(20:26) ~ "Local excision, NOS",
                                         RX_Summ_Surg_Prim_Site_1998 %in% as.character(30:36) ~ "Biopsy with gross excision",
                                         RX_Summ_Surg_Prim_Site_1998 %in% as.character(45:47) ~ "Wide excision or reexcision",
                                         RX_Summ_Surg_Prim_Site_1998 == "99" ~ "Unknown",
                                         T ~ "Unknown"))%>%
        mutate(across(c(dplyr::starts_with(c("Destruction", "Excision", "Mohs"))),
                      function(x) case_when(is.na(x) ~ "No",
                                            T ~ "Yes"))) %>%
        rename(Destruction_a="Destruction_<10sqcm",
               Destruction_b="Destruction_>10sqcm",                             
               Destruction_c="Destruction_Benign_<15lesions",
               Destruction_d="Destruction_Benign_>14lesions",
               Destruction_e="Destruction_malignant_<3.1cm",                   
               Destruction_f="Destruction_malignant_>3.0cm",
               Destruction_g="Destruction_premalignant_<1lesion", 
               Destruction_h="Destruction_premalignant_first",
               Excision_a="Excision_Benign_<3.0",
               Excision_b="Excision_Benign_<3.1cm", 
               Excision_c="Excision_malignant_<3.1cm",                      
               Excision_d= "Excision_malignant_>3.0cm")%>%
        mutate(Destruction=case_when(Destruction_a == "Yes"~"Yes",
                                     Destruction_b == "Yes"~"Yes",                             
                                     Destruction_c == "Yes"~"Yes",
                                     Destruction_d== "Yes"~"Yes",
                                     Destruction_e== "Yes"~"Yes",                   
                                     Destruction_f== "Yes"~"Yes",
                                     Destruction_g == "Yes"~"Yes", 
                                     Destruction_h  == "Yes"~"Yes",
                                     T~"No"),
               Excision=case_when( Excision_a== "Yes"~"Yes",
                                   Excision_b == "Yes"~"Yes", 
                                   Excision_c  == "Yes"~"Yes",                      
                                   Excision_d== "Yes"~"Yes",
                                   T~"No"),
               claims_surgery  = case_when(Destruction=="Yes"&Excision=="No"&Mohs=="No"~"Destruction",
                                           Destruction=="No"&Excision=="Yes"&Mohs=="No"~"Excision",
                                           Destruction=="No"&Excision=="No"&Mohs=="Yes"~"Mohs",
                                           Destruction=="Yes"&Excision=="Yes"&Mohs=="No"~"Combination",
                                           Destruction=="Yes"&Excision=="No"&Mohs=="Yes"~"Combination",
                                           Destruction=="No"&Excision=="Yes"&Mohs=="Yes"~"Combination",
                                           T ~ "None"),
               surgrecode = case_when(!seer_surgery %in% c("Unknown", "None")  ~ "Yes",
                                      seer_surgery == "Unknown" & claims_surgery != "None" ~ "Yes",
                                      seer_surgery == "Unknown" & claims_surgery == "None" ~ "None",
                                      T ~ "None"),
               surg_size=case_when(Excision_b=="Yes"~"<3.1 cm",
                                   Excision_c=="Yes"~"<3.1 cm",
                                   Excision_d=="Yes"~">3.0 cm",
                                   Excision_a=="Yes"~">3.0 cm",
                                   T~"None/Unknown"),)
      
    } else if (sources[[site]] == "lung"){
      seerfinal <- seerfinal %>%
        mutate(seer_surgery = case_when(RX_Summ_Surg_Prim_Site_1998 == 0 ~ "None",
                                        RX_Summ_Surg_Prim_Site_1998 %in% 20:25 ~ "Resection <1 lobe",
                                        RX_Summ_Surg_Prim_Site_1998 %in% c(30, 33, 45:48) ~ "Lobectomy/Bilobectomy",
                                        RX_Summ_Surg_Prim_Site_1998 %in% c(55, 56, 65, 66, 70) ~ "Pneumonectomy",
                                        RX_Summ_Surg_Prim_Site_1998 %in% c(12:19, 80, 90) ~ "Surgery, NOS",
                                        RX_Summ_Surg_Prim_Site_1998 == 99 ~ "Unknown",
                                        T ~ "Unknown"),
               claims_surgery = case_when(!is.na(lung_pneumonectomy) ~ "Pneumonectomy",
                                          !is.na(lung_lobectomy) ~ "Lobectomy/Bilobectomy",
                                          !is.na(lung_resection) ~ "Resection <1 lobe",
                                          T ~ "None"),
               surgrecode = case_when(!seer_surgery %in% c("Unknown", "None")  ~ "Yes", 
                                      seer_surgery == "Unknown" & claims_surgery != "None" ~ "Yes",
                                      seer_surgery == "Unknown" & claims_surgery == "None" ~ "None",
                                      T ~ "None"),
               lung_type = case_when(Histologic_Type_ICD_O_3 %in% c(8000:8001, 8003:8040, 8046:8579) ~ "NSCLC",
                                     Histologic_Type_ICD_O_3 %in% c(8002, 8041:8045) ~ "SCLC",
                                     T ~ "Other"))
    } else if (sources[[site]] == "brain") {
      seerfinal <- seerfinal %>%
        mutate(claims_surgery = case_when(time_length(biopsy - date_of_dx, "months") >= 0 ~ "Biopsy",
                                          time_length(neurosurgical_resection - date_of_dx, "months") >= 0 ~ "Neurosurgical resection",
                                          time_length(surgical_pathology - date_of_dx, "months") >= 0 ~ "Surgical pathology",
                                          T ~ "None"),
               seer_surgery = case_when(RX_Summ_Surg_Prim_Site_1998 == 0 ~ "None",
                                        RX_Summ_Surg_Prim_Site_1998 == 10 ~ "Distruction",
                                        RX_Summ_Surg_Prim_Site_1998 %in% c(20:30,40,55) ~ "Resection",
                                        RX_Summ_Surg_Prim_Site_1998 %in% c(12:19, 80, 90) ~ "Surgery, NOS",
                                        RX_Summ_Surg_Prim_Site_1998 == 99 ~ "Unknown",
                                        T ~ "Unknown"),
               surgrecode = case_when(!seer_surgery %in% c("Unknown", "None")  ~ "Yes",
                                      seer_surgery == "Unknown" & claims_surgery != "None" ~ "Yes",
                                      seer_surgery == "Unknown" & claims_surgery == "None" ~ "None",
                                      T ~ "None"))
    }
    seerfinal <- seerfinal %>%
      mutate(date_of_death = as_date(ifelse(!is.na(BENE_DEATH_DT), BENE_DEATH_DT, sprintf("%s%s01", SEER_DateofDeath_Year, SEER_DateofDeath_Month)), format = "%Y%m%d"),
             date_of_followup = as_date(sprintf("%d%02d01", Year_of_last_follow_up_recode, Month_of_last_follow_up_recode), format ="%Y%m%d"),
             racerec = case_when( OriginrecodeNHIAHispanicNonHisp == 1 ~ "Hispanic",
                                  Race_recode_W_B_AI_API == 1 ~ "NH White",
                                  Race_recode_W_B_AI_API == 2 ~ "NH Black",
                                  Race_recode_W_B_AI_API %in% 3:4 ~ "NH Other"),
             racerec = factor(racerec, levels = c("NH White", "Hispanic", "NH Black", "NH Other")),
             racerec2 = case_when( OriginrecodeNHIAHispanicNonHisp == 1 ~ "Hispanic",
                                   Race_recode_W_B_AI_API == 1 ~ "NH White",
                                   Race_recode_W_B_AI_API == 2 ~ "NH Black",
                                   Race_recode_W_B_AI_API == 3 ~ "NH AI/AN",
                                   Race_recode_W_B_AI_API == 4 ~ "NH API"),
             racerec2 = factor(racerec2, levels = c("NH White", "Hispanic", "NH Black", "NH AI/AN", "NH API")),
             sex = factor(sex, levels = c(1,2), labels = c("M", "F")),
             vital_status = ifelse(is.na(Vitalstatusrecodestudycutoffuse), as.numeric(!is.na(date_of_death)) , Vitalstatusrecodestudycutoffuse),
             # Some are missing survival information, if so calculate from known date of death.
             # Not quite as accurate but still works.
             survival = case_when(vital_status == 1 & !is.na(Survival_months) & Survival_months != 9999 ~ as.numeric(Survival_months),
                                  vital_status == 1 ~ interval(date_of_dx, date_of_death)/months(1),
                                  vital_status == 0 & !is.na(date_of_followup) ~ interval(date_of_dx, date_of_followup)/months(1)),
             seer_radiation = case_when(Radiation %in% c(1:6) ~ "Yes",
                                        Radiation %in% c(0,7) ~ "None",
                                        T ~ "Unknown"),
             claims_radiation = case_when(!is.na(radiation_therapy) | !is.na(stereotactic_radiosurgery) ~ "Yes",
                                          T ~ "None"),
             radrecode = case_when(seer_radiation == "Yes" ~ seer_radiation,
                                   seer_radiation == "Unknown" ~ claims_radiation,
                                   T ~ "None"),
             seer_chemotherapy = ifelse(seer_chemotherapy == 1, "Yes", "None/Unknown"),
             claims_chemotherapy = case_when(interval(date_of_dx, chemotherapy_services)/days(1) >= 0 ~ "Yes",
                                             T ~ "None"),
             chemrecode = case_when(seer_chemotherapy == "Yes" ~ seer_chemotherapy,
                                    claims_chemotherapy == "Yes" ~ claims_chemotherapy,
                                    T ~ "None"),
             seer_met_dx_brain = case_when(SEERCombinedMetsatDX_brain_2010 == 1 ~ "Synchronous Brain Met",
                                           SEERCombinedMetsatDX_brain_2010 == 0 & stage != "Distant site involved" ~ "None"),
             # Synchronous if earliest claim was within 31 days of diagnosis.
             brain_met_ext = case_when(!is.na(seer_met_dx_brain) ~ seer_met_dx_brain,
                                       abs(interval(date_of_dx, metastasis_date)/months(1)) <= 1 &
                                         metastasis %in% c("Brain only", "Brain and Other") ~ "Synchronous Brain Met",
                                       interval(date_of_dx, metastasis_date)/months(1) > 1 &
                                         metastasis %in% c("Brain only", "Brain and Other") ~ "Asynchronous Brain Met",
                                       T ~ "None"),
             brain_met_ext = factor(brain_met_ext, levels = c("None", "Synchronous Brain Met", "Asynchronous Brain Met")),
             brain_met = relevel(as.factor(ifelse(brain_met_ext == "None", "None", "Yes")), ref = "None"),
             brain_met_date = case_when(brain_met_ext == "Synchronous Brain Met" ~ date_of_dx,
                                        brain_met_ext == "Asynchronous Brain Met" ~ metastasis_date,
                                        T ~ NA_Date_),
             score = case_when(score %in% c(0:2) ~ as.character(score),
                               score >= 3 ~ "3+",
                               T ~ "0"),
             any_betablocker = factor(ifelse(is.na(any_betablocker), "No", any_betablocker), levels = c("No", "Yes")),
             any_inhibitor = factor(ifelse(is.na(any_inhibitor), "No", any_betablocker)), levels = c("No", "Yes"),
             betablocker_inhibitor = case_when(any_betablocker == "Yes" & any_inhibitor == "Yes" ~ "Betablocker and \ncheckpoint inhibitor",
                                               any_betablocker == "No" & any_inhibitor == "Yes" ~ "Checkpoint \ninhibitor only",
                                               any_betablocker == "Yes" & any_inhibitor == "No" ~ "Betablocker only",
                                               any_betablocker == "No" & any_inhibitor == "No" ~ "Neither"),
             # We don't want people who received immune checkpoint inhibitors before brain met, so recode as no inhibitor
             betablocker_inhibitor = ifelse(first_inhibitor < brain_met_date, "Betablocker only", betablocker_inhibitor)) %>%
      # Make sure last betablocker claim is after first inhibitor claim for concurrency.
      filter(!is.na(racerec) & !is.na(sex) & !is.na(stage) &  (!is.na(date_of_followup) | !is.na(date_of_death)) & if(sources[[site]] == "lung") {lung_typ != "Other"}) %>%
      mutate(across(c(radrecode, surgrecode, chemrecode), ~relevel(as.factor(.x), ref = "None")),
             across(dplyr::starts_with("chemotherapy"), ~ifelse(is.na(.x), "No", "Yes")))
    saveRDS(seerfinal, sprintf("Data/%s_final.rds", sources))
  }
  save.image(sprintf("%s_Image_%s.RDATA", sources[[site]], Sys.Date()))
}








