require(dispRity)

# https://rawgit.com/TGuillerme/dispRity/master/inst/gitbook/_book/getting-started-with-disprity.html#simpleanalysis

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
