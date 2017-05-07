FROM rocker/verse
MAINTAINER Carl Boettiger cboettig@ropensci.org 

## Install additional R package dependencies ###
RUN apt-get update && apt-get -y install --no-install-recommends \
  libopenblas-dev \
  liblapack-dev \
  librsvg2-dev \
  libudunits2-dev \
  libsndfile1-dev \
  libfftw3-dev \
  libv8-3.14-dev \
  libxslt-dev \
  && install2.r --error \
    FKF \
    MDPtoolbox \
    seewave \
    nimble \
    remotes \
  && R -e "remotes::install_github(c('rstudio/blogdown', 'hadley/pkgdown'), upgrade = FALSE)" \
  && echo '\n options(blogdown.hugo.dir = "/usr/local/lib/")' >> /usr/local/lib/R/etc/Rprofile.site \
  && R -e "blogdown::install_hugo()" \
  # Save me from configuring this each time
  && git config --system user.name 'Carl Boettiger' \
  && git config --system user.email 'cboettig@gmail.com'


