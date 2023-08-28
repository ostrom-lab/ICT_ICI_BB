load("Data/lung_final.RDATA")
options(readr.show_col_types = F, dplyr.summarise.inform = F)
librarian::shelf(dplyr, tidyr, stringr, readr, purrr, tictoc, lubridate, gtsummary, survival, survminer, ggpubr, patchwork, labelled)

data = NULL
OS = NULL

data[["OS"]] <- seerfinal %>%
  filter(brain_met_ext != "None" & betablocker_inhibitor %in% c("Betablocker and \ncheckpoint inhibitor", "Checkpoint \ninhibitor only")) %>%
  select(Agerecodewithsingleages_and_100, sex, racerec, score, radrecode, surgrecode, betablocker_inhibitor, lung_type, survival, vital_status) %>%
  mutate(betablocker_inhibitor = factor(betablocker_inhibitor, levels = c("Checkpoint \ninhibitor only", "Betablocker and \ncheckpoint inhibitor")))

for (type in c("NSCLC and SCLC", "NSCLC")){

    tmp <- if (type != "NSCLC and SCLC") {
      as.data.frame(data[["OS"]]) %>%
        filter(lung_type == type) %>%
        select(-c(lung_type))
    } else {
      as.data.frame(data[["OS"]]) 
    }
  
    OS[["models"]][["All betablocker"]][["kaplan"]][[type]] <- survfit(Surv(survival, vital_status) ~ betablocker_inhibitor, data = tmp)
   
    surv_median(OS[["models"]][["All betablocker"]][["kaplan"]][[type]])
    
    OS[["models"]][["All betablocker"]][["cox"]][[type]] <- coxph(Surv(survival, vital_status) ~ ., data = tmp) %>%
      broom::tidy(exponentiate = T, conf.int = T)
    
    
    OS[["figures"]][["All betablocker"]][[type]] <- ggsurvplot(OS[["models"]][["All betablocker"]][["kaplan"]][[type]],
                                                 data = tmp,
                                                 censor = F,
                                                 conf.int = T,
                                                 pval = T,
                                                 pval.coord = c(50, 0.5),
                                                 surv.median.line = "hv",
                                                 legend.labs = levels(tmp$betablocker_inhibitor),
                                                 title = "LC, any intracranial metastasis",
                                                 palette =  c("darkblue", "#999999"))$plot +
      labs(x = "Survival time (months)") +
      theme(plot.title = element_text(face = "bold"),
            legend.position = c(0.5, 0.85),
            legend.direction = "horizontal")

}