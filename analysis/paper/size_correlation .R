pottery_data <- readr::read_csv(here("analysis/data/raw_data/KWL_Ceramic_final2018_with_phases.csv"))

pottery_data_tidy <-
  pottery_data %>%
  mutate_at(vars(starts_with(c("Thick", "Diameter"))), as.numeric) %>%
  mutate(Height = as.numeric(Hight))

cor(pottery_data_tidy$Height,
    pottery_data_tidy$Diameter1_Body, use = "pairwise.complete.obs")
