# read data
library(readxl)
thin_section <- read_excel(here::here("analysis", "data", "raw_data", "kwl_petrography.xlsx"), 2)
sherd <- read_excel(here::here("analysis", "data", "raw_data", "kwl_petrography.xlsx"), 1)

# sum the columns of similar minerals
thin_section_combine <-
  thin_section %>%
  mutate(Quartz = `Monocrystalline quartz` + `Polycrystalline quartz`,
         Argillite_all = `Argillite` + `Reddish-brown Argillite`)

# prepare data for pca
thin_section_combine_pca <-
  thin_section_combine %>%
  select(4:5, 8:12, 17:18)

# PCA
pca1 <- prcomp(thin_section_combine_pca, scale. = TRUE)
# sqrt of eigenvalues
pca1$sdev
# loadings
head(pca1$rotation)
# PCs (aka scores)
head(pca1$x)

library(ggplot2)
# create data frame with scores
scores <- as.data.frame(pca1$x)

# plot of observations
ggplot(data = scores, aes(x = PC1, y = PC2, label = rownames(scores))) +
  geom_hline(yintercept = 0, colour = "gray65") +
  geom_vline(xintercept = 0, colour = "gray65") +
  geom_text(colour = "tomato", alpha = 0.8, size = 4) +
  ggtitle("PCA plot of thin sections - Mineral")


# convex hulls for time periods by argillite and quartz
kwl_th_hulls <-
  thin_section_combine %>%
  filter(!is.na(Quartz), !is.na(Argillite_all)) %>%
  nest(-phase) %>%
  mutate(hulls = map(data, ~.[chull(.$Quartz, .$Argillite_all),])) %>%
  select(phase, hulls) %>%
  unnest(hulls)

ggplot(thin_section_combine,
       aes(Quartz,
           Argillite_all,
           colour = phase,
           fill = phase)) +
  geom_point() +
  geom_polygon(data = kwl_th_hulls,
               alpha = 0.1,
               color  = NA) +
  theme_minimal()

# convex hulls for time periods by argillite and metasandstone
kwl_th_hulls2 <-
  thin_section_combine %>%
  filter(!is.na(Metasandstone), !is.na(Argillite_all)) %>%
  nest(-phase) %>%
  mutate(hulls = map(data, ~.[chull(.$Metasandstone, .$Argillite_all),])) %>%
  select(phase, hulls) %>%
  unnest(hulls)

ggplot(thin_section_combine,
       aes(Metasandstone,
           Argillite_all,
           colour = phase,
           fill = phase)) +
  geom_point() +
  geom_polygon(data = kwl_th_hulls2,
               alpha = 0.1,
               color  = NA) +
  theme_minimal()
