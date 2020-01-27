# some plots generated from momocs
jpgs_imported_coo <- read_rds(here::here("analysis/data/derived_data/jpgs_imported_coo.rds"))

# take a look when all the images stack together
stack(jpgs_imported_coo)

# fit the x and y coordinates separately, that is the blue and red curves in the right hand side plot
coo_oscillo(jpgs_imported_coo[1], "efourier")

# The progressive capture of shape geometry along the number of harmonics can be visualized with:
calibrate_reconstructions_efourier(jpgs_imported_coo,
                                   id = 1,
                                   range = c(1, 2, 4, 8, 14, 20))

# from mshapes directly, nice but the labels spill outside of the plot area, not clear how to fix
# paired comparison for every two periods shown in one plot with 3 * 3 variables
op %>% MSHAPES(~phase) %>% plot_MSHAPES()

# calculates deformations between two configurations and map them with or without isolines.
tps_iso(`Pre-European`, `Post-European`,  shp.lwd = c(2, 2), shp.border = c("red", "blue"),
        amp = 0.5, iso.nb = 10000, iso.levels = 12, legend.text = c("Pre-contact", "Post-contact"),
        palette = col_summer, grid = F)
dev.off()

tps_iso(`Pre-European`, `Chinese`,  shp.lwd = c(2, 2), shp.border = c("red", "blue"),
        amp = 0.5, iso.nb = 10000, iso.levels = 12, legend.text = c("Pre-contact", "Chinese"),
        palette = col_summer, grid = F)
dev.off()

# Mean pottery shapes of three phases
library(Momocs)
library(cowplot)
jpgs_imported_coo <- readr::read_rds(here::here("analysis/data/derived_data/jpgs_imported_coo.rds"))

# default is 13 harmonics that gather 99% of the harmonic power
op <- efourier(jpgs_imported_coo, norm = FALSE, 13)

# mean shape, per group
pot.ms <- MSHAPES(op, 'phase')
mshp <- pot.ms$shp
names(mshp) <- c("chi", "poe", "pre")

`Post-European` <- mshp$poe %T>% coo_plot(border="blue")
`Pre-European` <-  mshp$pre %T>% coo_plot(border="red", plot.new=FALSE)
`Chinese` <-       mshp$chi %T>% coo_plot(border="green", plot.new=FALSE)
legend("topright",
       lwd=1,
       col=c("red", "blue", "green"),
       legend=c( "Pre-European", "Post-European", "Chinese"))
# The average shape of vessels from each phase was visualized by computing the mean of
# the standardized Fourier coefficients within each phase group (Figure 4).
#? How to put the legend out of the plot, tried change the margin using par(), but doesn't work


# contribution-PC-hide
# the contributions of each PC to the shapes
pc_contrib <-  PCcontrib(op.p, nax = 1:3)

# contribution-PCs, fig.cap= "Pottery shape variation based on scores along principal component axes.
# The rows from the top to the bottom represent the first to third principal component respectively.
# Each column shows the reconstructed shape variable according to the score mean ±2 standard deviation (SD) with a 0.5 interval"}
pc_contrib$gg +
  geom_polygon(fill="slategrey", col="black") +
  theme_minimal(base_size = 6)

ggsave(here::here("analysis/figures/pca-contrib.png"))

# PC1 is height of vessel
# PC2 is neck constriction
# PC3 is the degree of flare of neck

# PCA byplot, different visualization
plot(PCA(op), 2, pos.shp="full")
plot(PCA(op), 2, pos.shp="range")
plot(PCA(op), 2, pos.shp="xy")
plot(PCA(op), 2, pos.shp="range_axes")
plot(PCA(op), 2, pos.shp="full_axes")
