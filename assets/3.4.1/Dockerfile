FROM rocker/geospatial:3.4.1
MAINTAINER Carl Boettiger cboettig@ropensci.org 

## Install additional R package dependencies ###
RUN apt-get update && \
  apt-get -y install --no-install-recommends \
  libgpgme11-dev \
  liblapack-dev \
  librdf0-dev \
  librsvg2-dev \
  libsndfile1-dev \
  libfftw3-dev \
  libxslt-dev && \
  install2.r --error \
    FKF \
    MDPtoolbox \
    seewave \
    nimble \
    jsonld \
    jsonvalidate && \
  R -e "remotes::install_github(c('rstudio/blogdown@v0.1', 'hadley/pkgdown@c8726f9242b2b67f572c16422c83cdc8160c7628'), upgrade = FALSE)" && \
  echo '\n options(blogdown.hugo.dir = "/usr/local/lib/")' >> /usr/local/lib/R/etc/Rprofile.site && \
  R -e "blogdown::install_hugo()" && \
  git config --system user.name 'Carl Boettiger' && \
  git config --system user.email 'cboettig@gmail.com' && \
  installGithub.r boettiger-lab/pomdpplus boettiger-lab/mdplearning


