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
