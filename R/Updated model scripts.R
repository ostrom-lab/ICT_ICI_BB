options(readr.show_col_types = F, dplyr.summarise.inform = F)
librarian::shelf(tidyverse, ggplot2, survminer, survival, labelled)

data <- NULL
OS = NULL


data[["Lung cancer"]] <- readRDS("Lung Data.rds") 
data[["Melanoma"]] <- readRDS("Skin Data.rds")
data[["Brain"]] <- readRDS("Brain Data.rds")

data <- purrr::imap(data, function(dat, cancer) {
  tables <- NULL
  
  if (cancer == "Lung cancer") var_label(dat) <- list(lung_type = "LC subtype")
  
  if (cancer == "Brain") {
  tables[["Betablocker"]] <- dat %>%
      mutate(any_betablocker = factor(any_betablocker, levels = c("No", "Yes"), 
                                      labels = c("No betablocker", "Betablocker"))) 
  } else {
  
  tables[["No brain metastasis with ICI"]] <- dat %>%
    filter(betablocker_inhibitor %in% c("Inhibitor Only", "Both")) %>%
    filter(brain_met == "None") %>%
    select(Agerecodewithsingleages_and_100, sex, racerec, score, radrecode,  chemrecode, surgrecode, any_of(c("lung_type")), betablocker_inhibitor, survival, vital_status, Cause_of_Death_ICD_10) %>%
    mutate(betablocker_inhibitor = factor(case_when(betablocker_inhibitor == "Both" ~ "Betablocker and ICB",
                                                    betablocker_inhibitor == "Inhibitor Only" ~ "ICB only"),
                                          levels = c("ICB only", "Betablocker and ICB")))
  
  tables[["No brain metastasis with no ICI"]] <-  dat %>%
    filter(!betablocker_inhibitor %in% c("Inhibitor Only", "Both")) %>%
    filter(brain_met == "None") %>%
    select(Agerecodewithsingleages_and_100, sex, racerec, score, radrecode,  chemrecode, surgrecode, any_of("lung_type"), betablocker_inhibitor, survival, vital_status, Cause_of_Death_ICD_10) %>%
    mutate(betablocker_inhibitor = factor(case_when(betablocker_inhibitor == "Neither" ~ "No betablocker/No ICB",
                                                    betablocker_inhibitor == "Betablocker Only" ~ "Betablocker only"),
                                          levels = c("No betablocker/No ICB", "Betablocker only")))
  tables[["No brain metastasis all"]] <-  dat%>%
    filter(brain_met == "None") %>%
    select(Agerecodewithsingleages_and_100, sex, racerec, score, radrecode,  chemrecode, surgrecode, any_of("lung_type"), betablocker_inhibitor, survival, vital_status, Cause_of_Death_ICD_10) %>%
    mutate(betablocker_inhibitor = factor(case_when(betablocker_inhibitor == "Both" ~ "Betablocker and ICB",
                                                    betablocker_inhibitor == "Inhibitor Only" ~ "ICB only",
                                                    betablocker_inhibitor == "Neither" ~ "No betablocker/No ICB",
                                                    betablocker_inhibitor == "Betablocker Only" ~ "Betablocker only"),
                                          levels = c("No betablocker/No ICB", "Betablocker only", "ICB only", "Betablocker and ICB")))

  tables[["Brain metastasis with no ICI"]] <-  dat %>%
    filter(!betablocker_inhibitor %in% c("Inhibitor Only", "Both")) %>%
    filter(brain_met == "Yes") %>%
    select(Agerecodewithsingleages_and_100, sex, racerec, score, radrecode,  chemrecode, surgrecode, any_of("lung_type"), betablocker_inhibitor, survival, vital_status, Cause_of_Death_ICD_10) %>%
    mutate(betablocker_inhibitor = factor(case_when(betablocker_inhibitor == "Neither" ~ "No betablocker/No ICB",
                                                    betablocker_inhibitor == "Betablocker Only" ~ "Betablocker only"),
                                          levels = c("No betablocker/No ICB", "Betablocker only")))
  
  tables[["Brain metastasis all"]] <-  dat %>%
    filter(brain_met == "Yes") %>%
    select(Agerecodewithsingleages_and_100, sex, racerec, score, radrecode,  chemrecode, surgrecode, any_of("lung_type"), betablocker_inhibitor, survival, vital_status, Cause_of_Death_ICD_10) %>%
    mutate(betablocker_inhibitor = factor(case_when(betablocker_inhibitor == "Both" ~ "Betablocker and ICB",
                                                    betablocker_inhibitor == "Inhibitor Only" ~ "ICB only",
                                                    betablocker_inhibitor == "Neither" ~ "No betablocker/No ICB",
                                                    betablocker_inhibitor == "Betablocker Only" ~ "Betablocker only"),
                                          levels = c("No betablocker/No ICB", "Betablocker only", "ICB only", "Betablocker and ICB")))
  
  tables[["Brain metastasis with ICI"]] <- dat %>%
    filter(betablocker_inhibitor %in% c("Inhibitor Only", "Both")) %>%
    filter(brain_met == "Yes") %>%
    select(Agerecodewithsingleages_and_100, sex, racerec, score, radrecode,  chemrecode, surgrecode, any_of(c("lung_type")), betablocker_inhibitor, survival, vital_status, Cause_of_Death_ICD_10) %>%
    mutate(betablocker_inhibitor = factor(case_when(betablocker_inhibitor == "Both" ~ "Betablocker and ICB",
                                                    betablocker_inhibitor == "Inhibitor Only" ~ "ICB only"),
                                          levels = c("ICB only", "Betablocker and ICB")))
  }
  return(tables)
})


for(cancer in c("Melanoma", "Lung cancer")){
  for (grp in names(data[[cancer]])) {
    
    tmp = data[[cancer]][[grp]]
    
    var_label(tmp) <- list(Agerecodewithsingleages_and_100 = "Patient Age",
                           sex = "Sex",
                           racerec = "Race/ethnicity",
                           score = "Charslon score",
                           radrecode = "Received radiation",
                           chemrecode = "Received chemotherapy",
                           surgrecode = "Received surgery of primary",
                           betablocker_inhibitor = "Betablocker and checkpoint inhibitor use")

    if(length(unique(tmp$betablocker_inhibitor)) < 2) next
    
    OS[["Overall"]] <- tmp %>%
      select(-c(survival, vital_status)) %>%
      tbl_summary(percent = "column") %>%
      bold_labels()%>%
      as_flex_table()
    
    colors = if(length(unique(tmp$betablocker_inhibitor)) == 4) c("#c9c9c9", "darkred", "darkgreen", "darkblue") else c("#c9c9c9", "darkblue")
    
    OS[["models"]][["All betablocker"]][["kaplan"]][[cancer]][[grp]] <- survfit(Surv(survival, vital_status) ~ betablocker_inhibitor, data = as.data.frame(tmp))
    OS[["Median Survival Months"]] <- tbl_survfit(OS[["models"]][["All betablocker"]][["kaplan"]][[cancer]][[grp]], 
                                                  probs = 0.5, label_header = "**Median Survival**", 
                                                  label = list(betablocker_inhibitor ~ "Betablocker and checkpoint inhibitor use")) %>%
      bold_labels() %>%
      as_flex_table()
    
    OS[["Adjusted Survival"]] <- coxph(Surv(survival, vital_status) ~ ., data = tmp) %>%
      tbl_regression(exponentiate = T, conf.int = T, pvalue_fun = ~scales::pvalue(.x, accuracy = 0.001)) %>%
      bold_p() %>%
      bold_labels() %>%
      as_flex_table()

    if(length(unique(tmp$betablocker_inhibitor)) > 2){
      OS[["Pariwise Survival"]] <- pairwise_survdiff(Surv(survival, vital_status) ~ betablocker_inhibitor, data = as.data.frame(tmp),
                                                     p.adjust.method = "none")$p.value %>%
        as_tibble(rownames = "NA") %>%
        rename(Treatment = "NA") %>%
        mutate_if(is.numeric, scales::pvalue) %>%
        flextable::as_flextable(show_coltype = F)

      flextable::save_as_docx("Overall" = OS[["Overall"]],
                              "Pairwise Log-rank P-values" = OS[["Pariwise Survival"]],
                              "Median Survival Months" = OS[["Median Survival Months"]],
                              "Adjusted Survival Model" = OS[["Adjusted Survival"]],
                              path = sprintf("%s Demographic and Survival Tables (%s).docx", cancer, grp)) }
    else {
      flextable::save_as_docx("Overall" = OS[["Overall"]],
                              "Median Survival Months" = OS[["Median Survival Months"]],
                              "Adjusted Survival Model" = OS[["Adjusted Survival"]],
                              path = sprintf("%s Demographic and Survival Tables (%s).docx", cancer, grp))
    }
    
    OS[["figures"]][["All betablocker"]][[cancer]][[grp]] <- ggsurvplot(OS[["models"]][["All betablocker"]][["kaplan"]][[cancer]][[grp]],
                                                                        data = tmp,
                                                                        censor = F,
                                                                        conf.int = F,
                                                                        pval = T,
                                                                        pval.coord =if(cancer == "Melanoma" & str_detect(grp, "No brain met")) c(90, 0.75) else c(45, 0.75),
                                                                        surv.median.line = "hv",
                                                                        break.x.by = if(cancer == "Melanoma" & str_detect(grp, "No brain met")) 12 else 6,
                                                                        xlim = if(cancer == "Melanoma" & str_detect(grp, "No brain met")) c(0, 120) else c(0, 60),
                                                                        legend.labs = levels(tmp$betablocker_inhibitor),
                                                                        palette = colors)$plot +
      labs(x = "Time (months)") +
      theme(plot.title = element_text(face = "bold"),
            legend.position = "bottom",
            legend.direction = "horizontal")
    ggsave(filename = sprintf("%s KM Survival Figures (%s).pdf", cancer, grp), width = 8, height = 6)
    
  }
}

##### GBM ONLY #####

OS[["models"]][["kaplan"]][["Brain"]] <- survfit(Surv(survival, vital_status) ~ any_betablocker, data = data[["Brain"]])
OS[["models"]][["cox"]][["Brain"]] <- coxph(Surv(survival, vital_status) ~ sex + Agerecodewithsingleages_and_100 + racerec + chemrecode + surgrecode + radrecode + score + any_betablocker, data = data[["Brain"]]) %>%
  broom::tidy(exponentiate = T, conf.int = T)

OS[["figures"]][["Brain"]] <- ggsurvplot(OS[["models"]][["kaplan"]][["Brain"]],
                                        data = tmp,
                                        censor = F,
                                        conf.int = F,
                                        pval = T,
                                        pval.coord = c(45, 0.75),
                                        break.x.by = 6,
                                        xlim = c(0, 60),
                                        legend.labs = levels(fecci_data$any_betablocker),
                                        palette = c("#c9c9c9", "darkblue"))$plot +
  labs(x = "Time (months)") +
  theme(plot.title = element_text(face = "bold"),
        legend.position = "bottom",
        legend.direction = "horizontal")

ggsave(plot = OS[["figures"]][["Brain"]], filename = "GBM KM Survival Figures.pdf", width = 8, height = 6)

##### CAUSE OF DEATH TABLES #####

purrr::imap(data, function(data, cancer){
  data %>%
    filter(vital_status == 1) %>%
    count(Cause_of_Death_ICD_10) %>%
    arrange(-n) %>%
    mutate(COD = case_when(str_detect(Cause_of_Death_ICD_10, "^C") ~ "Neoplasm Death",
                           is.na(Cause_of_Death_ICD_10) ~ "Unknown Cause of Death",
                           T ~ Cause_of_Death_ICD_10)) %>%
    group_by(COD) %>%
    summarise(Total = sum(n)) %>%
    ungroup() %>%
    arrange(-Total) %>%
    mutate(`Percent of Total Deaths` = scales::percent(Total/sum(Total), accuracy = 0.1)) %>%
    writexl::write_xlsx(path = sprintf("%s Causes of Death.xlsx", cancer))
})


