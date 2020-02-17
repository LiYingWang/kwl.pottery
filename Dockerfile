# get the base image, the rocker/verse has R, RStudio and pandoc
FROM rocker/geospatial:3.6.0

# required
MAINTAINER Your Name <your_email@somewhere.com>

COPY . /kwl.pottery


# go into the repo directory
RUN . /etc/environment \
  # Install linux depedendencies here
  # e.g. need this for sf
  && sudo apt-get update \
  &&  sudo DEBIAN_FRONTEND=noninteractive apt-get install libudunits2-dev gdal-bin libcurl4-openssl-dev libgdal-dev libproj-dev libssl-dev xorg libx11-dev libglu1-mesa-dev libfreetype6-dev -y \
  # build this compendium package
  && R -e "options(repos = 'http://cran.rstudio.com/')" \
  && R -e "remotes::install_deps('/kwl.pottery', dep=TRUE)" \
  && R -e "remotes::install_github('benmarwick/wordcountaddin', type = 'source', dependencies=TRUE, repos='http://cran.rstudio.com/')" \
  && R -e "remotes::install_github('benmarwick/rrtools', type = 'source', dependencies=TRUE, repos='http://cran.rstudio.com/')" \
  # render the manuscript into a docx, you'll need to edit this if you've
  # customised the location and name of your main Rmd file
  && R -e "rmarkdown::render('/kwl.pottery/analysis/paper/paper.Rmd')"



