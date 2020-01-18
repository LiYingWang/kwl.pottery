# read metric data
kwl_p_ave <- read.csv(here::here("analysis", "data", "raw_data",
                                 "KWL-pottery-metrics-tidy-ave.csv"))

library(tidyverse)
count(kwl_p_ave, period)

# Select metric attributes and tidy data for computing CV
kwl_p_metrics_long <-
  kwl_p_ave %>%
  mutate(dia_rim_body = Dia_Rim_ave/Dia_Body_ave,
         thi_rim_body = Thick_Rim_ave/Thick_Body_ave) %>%
  select(period,
         Dia_Rim_ave,
         Dia_Neck_ave,
         Dia_Body_ave,
         Thick_Rim_ave,
         Thick_Neck_ave,
         Thick_Body_ave,
         dia_rim_body,
         thi_rim_body,
         # H_Rim
  ) %>%
  rename(`Rim diameter (mm)` = Dia_Rim_ave,
         `Neck diameter (mm)` = Dia_Neck_ave,
         `Body diameter (mm)` = Dia_Body_ave,
         `Rim thickness (mm)` = Thick_Rim_ave,
         `Neck thickness (mm)` = Thick_Neck_ave,
         `Body thickness (mm)` = Thick_Body_ave,
         `Ratio of Rim/Body diameter` = dia_rim_body,
         `Ratio of Rim/Body thickness` = thi_rim_body
  ) %>%
  gather(variable, value, -period) %>%
  filter(!is.na(period),
         !is.na(value))

# CV test function
library(cvequality)
mslr_test_set <- function(x, y){
  set.seed(1)
  mslr_test(nr = 1e4, x, y)
}

# filter pre-e and post-e periods
kwl_p_metrics_long_pre_post <-
  kwl_p_metrics_long %>%
  filter(!period == "ch-con")

# filter post-e and chi periods
kwl_p_metrics_long_post_chi <-
  kwl_p_metrics_long %>%
  filter(!period == "pre-e")

# CV test for pre-e and post-e pair
# ? CV test results are different from the results tested for the LYdissertation project
kiwulan_pottery_metrics_cvs_plot_cv_test_MSLRT_pre_post <-
  kwl_p_metrics_long_pre_post %>%
  nest(-variable) %>%  # or nest(period, value) %>%
  mutate(asymptotic_test = map(data, # change from mslr_test to asymptotic_test
                               ~bind_cols(asymptotic_test (
                                 .x$value,
                                 .x$period)))) %>%
  unnest(asymptotic_test)

# compute CV
kwl_p_cvs_pre_post <-
  kwl_p_metrics_long_pre_post %>%
  group_by(period, variable) %>%
  summarise(cvs = raster::cv(value, na.rm = TRUE))

# join p-values to CVs
kwl_p_cvs_and_pvalues_pre_post <-
  kwl_p_cvs_pre_post %>%
  left_join(kiwulan_pottery_metrics_cvs_plot_cv_test_MSLRT_pre_post) %>%
  mutate(significant = ifelse(p_value <= 0.05, 'yes', 'no')) %>%
  mutate(variable = factor(variable, ordered = TRUE)) %>%
  arrange(variable)

# making table for CV
kwl_p_cvs_table_pre_post <-
  kwl_p_cvs_and_pvalues_pre_post %>%
  select(-data, -significant) %>%
  pivot_wider(names_from = period, values_from = cvs) %>%
  mutate(variable = factor(variable, levels = c("Rim thickness (mm)",
                                                "Neck thickness (mm)",
                                                "Body thickness (mm)",
                                                "Ratio of Rim/Body thickness",
                                                "Rim diameter (mm)",
                                                "Neck diameter (mm)",
                                                "Body diameter (mm)",
                                                "Ratio of Rim/Body diameter"))) %>%
  arrange(variable) %>%
  select(variable, `pre-e`, `post-e`, `D_AD`, `p_value`) %>%
  mutate_at(c("pre-e", "post-e", "D_AD", "p_value"), round, 4)

write_csv(kwl_p_cvs_table, here::here("analysis", "data", "raw_data", "Kwl_p_metrics_cv_test.csv"))

knitr::kable(kwl_p_cvs_table)
