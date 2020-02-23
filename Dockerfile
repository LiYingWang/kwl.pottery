# get the base image, the rocker/verse has R, RStudio and pandoc
FROM rocker/geospatial:3.6.2

# required
MAINTAINER Li-Ying Wang <liying15@uw.edu>

COPY . /kwl.pottery


# go into the repo directory
RUN . /etc/environment \
  # build this compendium package
  && R -e "remotes::install_deps('/kwl.pottery', dep=TRUE)" \
  # install non-CRAN pkgs
  && R -e "remotes::install_github('benmarwick/wordcountaddin', type = 'source', dependencies=TRUE)" \
  && R -e "remotes::install_github('benmarwick/rrtools', type = 'source', dependencies=TRUE)" \
  # render the manuscript into a docx, you'll need to edit this if you've
  # customised the location and name of your main Rmd file
  && R -e "rmarkdown::render('/kwl.pottery/analysis/paper/paper.Rmd')"



