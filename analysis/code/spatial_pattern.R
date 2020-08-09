library(sf)
library(viridis)
library(tidyverse)

# read in pottery data
pottery_data <- readr::read_csv(here::here("analysis/data/raw_data/KWL_Ceramic_final2018_with_phases.csv"))

# read in the spatial data
AD_zone <- invisible(st_read(here::here("analysis", "data", "raw_data", "AD_zone.shp"), quiet = TRUE))
units_40 <- invisible(read.csv(here::here("analysis", "data", "raw_data", "kwl-list-of-sampling-squares.csv")))

AD_zone_tidy <-
  AD_zone %>%
  mutate(Pit =paste0("P0",Id)) %>%
  inner_join(units_40, by = c("Pit" = "the_sq")) %>%
  select(Pit, geometry)

# tidy pottery data
pottery_count <-
  pottery_data %>%
  select(Site, Context, Pit, Layer, No., phase) %>%
  count(Pit, phase)

# join two dataset to get coordinate
pottery_count_join <-
  pottery_count %>%
  mutate(phase = as.factor(phase)) %>% # seems need this line first
  inner_join(AD_zone_tidy) %>%
  filter(!is.na(phase)) %>%
  mutate(phase = case_when(
    phase %in% "pre-e"~ "Before European Contact",
    phase %in% "post-e" ~ "European Presence",
    phase %in% "ch-con" ~ "Chinese Presence")) %>%
  mutate(phase = factor(phase,
                        level = c("Before European Contact",
                                  "European Presence",
                                  "Chinese Presence")))

# --------------------------------point pattern analysis-------------------------------------------
# get centroid and make a list of three periods
pottery_period_join_cen_all <-
  pottery_count_join %>%
  mutate(lon = jitter(map_dbl(geometry, ~st_point_on_surface(.x)[[1]])),
         lat = jitter(map_dbl(geometry, ~st_point_on_surface(.x)[[2]])))
pottery_period_join_cen <-
  pottery_period_join_cen_all %>%
  group_by(phase) %>%
  group_split() %>%
  set_names(c("Before European Contact",
              "European Presence",
              "Chinese Presence"))

# transform data to PPP format and sp SpatialPoints
library(spatstat)
library(maptools)
library(raster)
# store x and y coords in two vectors, and create two vectors xrange and yrange with dimensions of triangle that contain all points, by period
# use common range for each period
lon_all <- pottery_period_join_cen_all$lon
lat_all <- pottery_period_join_cen_all$lat
xrange <- range(lon_all, na.rm=T)
yrange <- range(lat_all, na.rm=T)
# create a function to apply to each period
density_analysis <- function(x, ...) {
  # create ppp and sp(spacial points) format
  lon_tmp <- x$lon
  lat_tmp <- x$lat
  pottery_point_ppp_tmp <- ppp(lon_tmp, lat_tmp, xrange, yrange)
  pottery_point_sp_tmp <- as(pottery_point_ppp_tmp, "SpatialPoints")
  # kernel density estimation with contour
  kernel_tmp <- density(pottery_point_ppp_tmp)
  kernel_to_plot <-
    graphics::plot(kernel_tmp,
                   main = "",
                   ribbon=TRUE,
                   ribside=c("bottom"))
    graphics::contour(kernel_tmp, add = TRUE)
   #title(..., line = -0.3, adj = 0.4, cex.main = 1.5)
  return(list(pottery_point_ppp = pottery_point_ppp_tmp,
              kernel_to_plot = kernel_to_plot))
}

titles <- names(pottery_period_join_cen)
jpeg(
  here::here("analysis", "figures",
             "plot-kde-maps.jpg"),
  width = 265,
  height = 80,
  units = "mm",
  res = 300)
par(mfrow = c(1, 3),
    oma = c(1,1,1,1) + 0.1,
    mar = c(0,0,1,1) + 0.1)
kernels_for_plotting <-
  map2(pottery_period_join_cen,
       titles,
       ~density_analysis(.x, main = .y))
invisible(dev.off())


#--------------------------hypothesis testing for spatial distribution--------------

# function for hypothesis testing
nndist_hypo_testing <- function(x, n = 1e3L,  ... ) {

  ann_tmp <- mean(nndist(x$pottery_point_ppp, k = 1))
  # object for storing simulated ANN values
  ann_r_tmp <- vector(length = n)
  for (i in 1:n) {
    # Generate random point locations
    rand_tmp <-  rpoint(n = x$pottery_point_ppp$n,
                        win = as.owin(as_Spatial(AD_zone_tidy)))
    ann_r_tmp[i] <-
      mean(nndist(rand_tmp, k = 1))  # Tally the ANN values
  }
  the_plot <-
    hist(
      ann_r_tmp,
      xlab = NULL,
      las = 1,
      breaks = 40,
      col = "bisque",
      xlim = range(ann_tmp, ann_r_tmp),
      ...)
  abline(v = ann_tmp, col = "blue", lwd = 4)
  return(the_plot)
}


jpeg(
  here::here("analysis", "figures",
       "plot-kde-ann-histograms.jpg"),
  width = 90,
  height = 150,
  units = "mm",
  res = 600)
par(mfrow = c(3, 1))
invisible(
  map2(kernels_for_plotting,
       titles,
       ~invisible(nndist_hypo_testing(.x,
                                      main = .y))))
invisible(dev.off())

