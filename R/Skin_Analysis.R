load("Data/skin_final.RDATA")
options(readr.show_col_types = F, dplyr.summarise.inform = F)
librarian::shelf(dplyr, tidyr, stringr, readr, purrr, tictoc, lubridate, gtsummary, survival, survminer, ggpubr, patchwork, labelled)

data = NULL
OS = NULL

data[["OS"]] <- seerfinal %>%
  filter(brain_met_ext != "None" & betablocker_inhibitor %in% c("Betablocker and \ncheckpoint inhibitor", "Checkpoint \ninhibitor only")) %>%
  mutate(surg_size=relevel(as.factor(surg_size), ref="None/Unknown")) 
  select(Agerecodewithsingleages_and_100, sex, racerec, score, radrecode, surgrecode, surg_size, betablocker_inhibitor, survival, vital_status)

OS[["models"]][["All betablocker"]][["kaplan"]] <- survfit(Surv(survival, vital_status) ~ any_betablocker, data = data[["OS"]])

surv_median(OS[["models"]][["All betablocker"]][["kaplan"]])

OS[["models"]][["All betablocker"]][["cox"]] <- coxph(Surv(survival, vital_status) ~ ., data = data[["OS"]]) %>%
  broom::tidy(exponentiate = T, conf.int = T)

OS[["figures"]][["melanoma"]] <- ggsurvplot(OS[["models"]][["All betablocker"]][["kaplan"]],
           data = tmp,
           censor = F,
           conf.int = F,
           pval = T,
           pval.coord = c(75, 0.85),
           surv.median.line = "hv",
           legend.labs = levels(unique(tmp$betablocker_inhibitor)),
           palette =  c("darkblue", "#999999"),
           title = "Melanoma, any intracranial metastasis")$plot +
  labs(x = "Survial time (months)") +
  theme(plot.title = element_text(face = "bold",hjust=0.5,size=13),
        legend.direction = "horizontal")