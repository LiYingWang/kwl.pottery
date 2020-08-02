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


library(ggrepel)
byplot_cv_pc_metric_diameter <-
  size_pcs_cv_join %>%
  rename(body = Diameter1_Body, neck =Diameter1_Neck, rim = Diameter1_Rim) %>%
  select(body, neck, rim, cv_pc1, phase) %>%
  pivot_longer(-c(cv_pc1, y, phase), names_to = "diameter", values_to = "width") %>%
  ggplot(aes(x = width, y = cv_pc1, color = diameter)) +
  geom_point() +
  annotate("text", x = c(126, 120, 145), y = c(32, 30, 16),
           label = c("Pre-European", "Post-European", "Chinese")) +
  labs(x = "diameter (mm)",
       y = "CV of PC1 (%)") +
  scale_color_viridis(discrete = TRUE, option = "D") +
  scale_fill_viridis(discrete = TRUE) +
  theme_bw() +
  theme(axis.text.x = element_text(size = rel(0.9)),
        axis.text.y = element_text(size = rel(0.9)))
```
