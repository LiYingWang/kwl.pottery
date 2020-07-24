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

# assign landmarks and GPA
jpgs_imported_coo_land <-
  jpgs_imported %>%
  Out(., fac = phases_isect)  %>%
  # Centring, scaling and sampling pseudo-landmarks
  coo_center %>%
  coo_scale %>%
  coo_sample(., 50) %>%
  # Procrustes superimposition for pseudo-landmarks
  fgProcrustes

# geomorph data frame
geomorph_df <- geomorph.data.frame(shape = jpgs_imported_coo_land$coo,
                                   size = jpgs_imported_coo_size_pcs_metric$jpgs_imported_coo_size,
                                   phase = jpgs_imported_coo_size_pcs_metric$y)

# modeling shape according
fit.shapephase <-
  procD.lm(shape ~ phase,
           data = geomorph_df,
           print.progress = FALSE,
           iter = 9999)

# morphological disparity
morphol.disparity(fit.shapephase,
                  groups = jpgs_imported_coo_size_pcs_metric$y,
                  data = geomorph_df,
                  print.progress = FALSE,
                  iter = 9999)


