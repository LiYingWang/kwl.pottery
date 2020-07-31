require(geomorph)
require(dispRity)

## Loading the plethodon dataset
data(plethodon)

str(plethodon)

## Performing a Procrustes transform on the landmarks
procrustes <- gpagen(plethodon$land, PrinAxes = FALSE,
                     print.progress = FALSE)

## Ordinating this data
geomorph.ordination(procrustes)[1:5,1:5]

## Using a geomorph.data.frame
geomorph_df <- geomorph.data.frame(procrustes,
                                   species = plethodon$species,
                                   site = plethodon$site)

## Ordinating this data and making a dispRity object
geomorph.ordination(geomorph_df)

# https://rawgit.com/TGuillerme/dispRity/master/inst/gitbook/_book/getting-started-with-disprity.html#what-sort-of-data-does-disprity-work-with
plethodon$species

species_list <-
  list("Jord" = which(plethodon$species == "Jord" )     ,
       "Teyah" = which(plethodon$species == "Teyah" )
  )

phases_list <-
  list("Pre-European" = which(op.p$phase == "Pre-European"),
       "Post-European" = which(op.p$phase == "Post-European"),
       "Chinese" = which(op.p$phase == "Chinese"))

disparity_data <-
  dispRity.per.group(op.p$x,
                     group = phases_list,
                     metric = c(sum, variances))

summary(disparity_data)
plot(disparity_data)
test.dispRity(disparity_data, test = wilcox.test,
              correction = "bonferroni", details = TRUE)


