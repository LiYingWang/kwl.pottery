# read metric data

kwl_p_ave <- read.csv(here::here("analysis", "data", "raw_data",
                                 "KWL-pottery-metrics-tidy-ave.csv"))

# Select metric attributes for computing CV
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

library(cvequality)
mslr_test_set <- function(x, y){
  set.seed(1)
  mslr_test(nr = 1e4, x, y)
}

# CV test
kiwulan_pottery_metrics_cvs_plot_cv_test_MSLRT <-
  kwl_p_metrics_long %>%
  nest(-variable) %>%  # or nest(period, value) %>%
  mutate(mslr_test = map(data,
                         ~bind_cols(mslr_test_set(
                           .x$value,
                           .x$period)))) %>%
  unnest(mslr_test)

# transform the data
kwl_p_cvs <-
  kwl_p_metrics_long %>%
  group_by(period, variable) %>%
  summarise(cvs = raster::cv(value, na.rm = TRUE))

# join p-values to CVs
kwl_p_cvs_and_pvalues <-
  kwl_p_cvs %>%
  left_join(kiwulan_pottery_metrics_cvs_plot_cv_test_MSLRT) %>%
  mutate(significant = ifelse(p_value <= 0.05, 'yes', 'no')) %>%
  mutate(variable = factor(variable, ordered = TRUE)) %>%
  arrange(variable)

# making table for CV
kwl_p_cvs_table <-
  kwl_p_cvs %>%
  pivot_wider(names_from = period, values_from = cvs) %>%
  mutate(variable = factor(variable, levels = c("Rim thickness (mm)",
                                                "Neck thickness (mm)",
                                                "Body thickness (mm)",
                                                "Ratio of Rim/Body thickness",
                                                "Rim diameter (mm)",
                                                "Neck diameter (mm)",
                                                "Body diameter (mm)",
                                                "Ratio of Rim/Body diameter"))) %>%
  arrange(variable)
kable(kwl_p_cvs_table)
