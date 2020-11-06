# read data
library(tidyverse)
library(readxl)
thin_section <- read_excel(here::here("analysis", "data", "raw_data", "kwl_petrography.xlsx"), 2)
sherd <- read_excel(here::here("analysis", "data", "raw_data", "kwl_petrography.xlsx"), 1)

# sum the columns of similar minerals
thin_section_combine <-
  thin_section %>%
  mutate(Quartz = `Monocrystalline quartz` + `Polycrystalline quartz`,
         Argillite_all = `Argillite` + `Reddish-brown Argillite`) %>%
  mutate(phase = case_when(
    `phase` == "pre" ~ "pre-European",
    `phase` == "post" ~ "post-European",
    `phase` == "chi" ~ "Chinese",
    TRUE ~ "NA"))

table(thin_section_combine$phase)

# prepare data for pca
thin_section_combine_pca <-
  thin_section_combine %>%
  select(4:5, 8:12, 17:18)

# convex hulls for time periods by argillite and quartz
kwl_th_hulls <-
  thin_section_combine %>%
  filter(!is.na(Quartz), !is.na(Argillite_all)) %>%
  nest(-phase) %>%
  mutate(hulls = map(data, ~.[chull(.$Quartz, .$Argillite_all),])) %>%
  select(phase, hulls) %>%
  unnest(hulls)

library(ggplot2)
argi_quartz <-
  ggplot(thin_section_combine,
         aes(Quartz,
             Argillite_all,
             colour = phase,
             fill = phase)) +
  geom_point() +
  geom_polygon(data = kwl_th_hulls,
               alpha = 0.1,
               color  = NA) +
  labs(y = "Argillite") +
  theme_minimal()

# convex hulls for time periods by argillite and metasandstone
kwl_th_hulls2 <-
  thin_section_combine %>%
  filter(!is.na(Metasandstone), !is.na(Argillite_all)) %>%
  nest(-phase) %>%
  mutate(hulls = map(data, ~.[chull(.$Metasandstone, .$Argillite_all),])) %>%
  select(phase, hulls) %>%
  unnest(hulls)

argi_metasand <-
  ggplot(thin_section_combine,
         aes(Metasandstone,
             Argillite_all,
             colour = phase,
             fill = phase)) +
  geom_point() +
  geom_polygon(data = kwl_th_hulls2,
               alpha = 0.1,
               color  = NA) +
  labs(y = "Argillite") +
  theme_minimal() +
  theme(legend.position = "none")

library(cowplot)
plot_grid(argi_metasand, argi_quartz,
          labels = c('A', 'B'), label_size = 12,
          rel_widths = c(0.7, 1))

ggsave(here::here("analysis/figures/byplot_minerals.png"),
       w = 8, h = 3)

# PCA
pca1 <- prcomp(thin_section_combine_pca, scale. = TRUE)
# sqrt of eigenvalues
pca1$sdev
# loadings
head(pca1$rotation)
# PCs (aka scores)
head(pca1$x)
pca1$phase <- as.factor(thin_section_combine$phase)

# create data frame with scores
scores <- as.data.frame(pca1$x)
# add phase
scores$phase <- as.factor(thin_section_combine$phase)

pca_hulls <-
  scores %>%
  nest(-phase) %>%
  mutate(hulls = map(data, ~.[chull(.$PC1, .$PC2),])) %>%
  select(phase, hulls) %>%
  unnest(hulls)

# plot of PC values
ggplot(data = scores,
       aes(x = PC1, y = PC2, color = phase, fill = phase)) +
  geom_hline(yintercept = 0, color = "gray65") +
  geom_vline(xintercept = 0, color = "gray65") +
  geom_point() +
  # geom_text(aes(label = rownames(scores)), alpha = 0.8, size = 4) +
  geom_polygon(data = pca_hulls,
               alpha = 0.2,
               color  = NA) +
  theme_minimal()

ggsave(here::here("analysis/figures/pca-for-minerals.png"), w = 5, h = 3)

# MANOVA
man_pca <- manova(pca1$x ~ pca1$phase)
sum_man_all <- summary(man_pca, test="Pillai")
summary.aov(man_pca)

# check each pair of phase
pc1_mineral <- pca1$x[,1]
aov1 <-aov(pc1_mineral ~pca1$phase)
TukeyHSD(aov1)
pc2_mineral <- pca1$x[,2]
aov2 <-aov(pc2_mineral ~pca1$phase)
TukeyHSD(aov2)

# get p value
sum_man_all[4]
sum_man_all_df <-
  as.data.frame(sum_man_all[4]) %>%
  mutate_if(is.numeric, round, 4) %>%
  select(-`stats.Df`, -`stats.num.Df`) %>%
  rename(`Pillai's trace` = `stats.Pillai`,
         `Approximate F value` = `stats.approx.F`,
         `degrees of freedom` = `stats.den.Df`,
         `Pr(>F)` = `stats.Pr..F.`)

#  Pillai’s Trace = 0.465, F = 0.775, df = 46,

pval_all <- signif(unname(sum_man_all_df[,'Pr(>F)'][1]), 4)

