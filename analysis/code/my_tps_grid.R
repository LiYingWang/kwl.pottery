my_tps_grid <- function (fr, to, amp = 1, over = 1.2, grid.size = 15, grid.col = "grey80",
          poly = TRUE, shp = TRUE, shp.col = rep(NA, 2), shp.border = col_qual(2),
          shp.lwd = c(1, 1), shp.lty = c(1, 1), legend = TRUE, legend.text,
          ...)
{
  fr.n <- substitute(fr)
  to.n <- substitute(to)
  if (!missing(amp)) {
    to <- to + (to - fr) * amp
  }
  grid0 <- .grid.sample(fr, to, nside = round(grid.size), over = over)
  grid1 <- tps2d(grid0, fr, to)
  dim.grid <- c(length(unique(grid0[, 1])), length(unique(grid0[,
                                                                2])))
  op <- par(mar = rep(0, 4))
  on.exit(par(op))
  plot(NA, xlim = range(grid1[, 1]) * over, ylim = range(grid1[,
                                                               2]) * over, asp = 1, ann = FALSE, axes = FALSE, mar = rep(0,
                                                                                                                         4))
  for (i in 1:dim.grid[2]) {
    lines(grid1[(1:dim.grid[1]) + (i - 1) * dim.grid[1],
                ], col = grid.col)
  }
  for (i in 1:dim.grid[1]) {
    lines(grid1[(1:dim.grid[2]) * dim.grid[1] - i + 1, ],
          col = grid.col)
  }
  if (shp) {
    points <- ifelse(poly, FALSE, TRUE)
    coo_draw(fr, border = shp.border[1], col = NA, lwd = shp.lwd[1],
             lty = shp.lty[1], points = points, first.point = FALSE,
             centroid = FALSE, ...)
    coo_draw(to, border = shp.border[2], col = NA, lwd = shp.lwd[2],
             lty = shp.lty[2], points = points, first.point = FALSE,
             centroid = FALSE, ...)
    if (legend | !missing(legend.text)) {
      if (missing(legend.text))
        legend.text <- c(fr.n, to.n)
      legend("center", legend = stringr::str_remove_all(legend.text, "`"), col = shp.border,
             lwd = shp.lwd, bty = "n", cex = .45)
    }
  }
}
