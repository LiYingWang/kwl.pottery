pottery_data <- readr::read_csv(here("analysis/data/raw_data/KWL_Ceramic_final2018_with_phases.csv"))

pottery_data_tidy <-
  pottery_data %>%
  mutate_at(vars(starts_with(c("Thick", "Diameter"))), as.numeric) %>%
  mutate(Height = as.numeric(Hight))

# correlation between height and body diameter
cor(pottery_data_tidy$Height,
    pottery_data_tidy$Diameter1_Body, use = "pairwise.complete.obs")

# run the code in the paper rmd first
# does the linear regression model work well for all data? Yes
linearMod <- lm(pc1 ~ Diameter1_Body,
                data =jpgs_imported_coo_size_pcs_metric)
plot(linearMod)
summary(linearMod)

# are residuals normally distributed? Yes
qqnorm(jpgs_imported_coo_size_pcs_metric$Diameter1_Body)
