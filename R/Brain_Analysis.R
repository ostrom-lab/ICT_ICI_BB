load("Data/brain_final.RDATA")
options(readr.show_col_types = F, dplyr.summarise.inform = F)
librarian::shelf(dplyr, tidyr, stringr, readr, purrr, tictoc, lubridate, gtsummary, survival, survminer, ggpubr, patchwork, labelled)

data = NULL
OS = NULL

data[["OS"]] <- seerfinal %>%
  select(Agerecodewithsingleages_and_100, sex, racerec, score, radrecode, surgrecode, chemrecode, any_betablocker, survival, vital_status) %>%
  mutate(any_betablocker = factor(any_betablocker, levels = c("No", "Yes")))

OS[["models"]][["All betablocker"]][["kaplan"]] <- survfit(Surv(survival, vital_status) ~ any_betablocker, data = data[["OS"]])

surv_median(OS[["models"]][["All betablocker"]][["kaplan"]])

OS[["models"]][["All betablocker"]][["cox"]] <- coxph(Surv(survival, vital_status) ~ ., data = data[["OS"]]) %>%
  broom::tidy(exponentiate = T, conf.int = T)

OS[["figures"]][["All betablocker"]] <- ggsurvplot(OS[["models"]][["All betablocker"]][["kaplan"]],
                                             data = data[["OS"]],
                                             censor = F,
                                             conf.int = T,
                                             pval = T,
                                             pval.coord = c(50, 0.5),
                                             surv.median.line = "hv",
                                             legend.labs = c("No betablocker", "Betablocker"),
                                             palette =  c("darkblue", "#999999"))$plot +
  labs(x = "Survival time (months)") +
  theme(plot.title = element_text(face = "bold"),
        legend.position = c(0.5, 0.85),
        legend.direction = "horizontal")