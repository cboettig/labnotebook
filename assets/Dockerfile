FROM rocker/geospatial:latest
MAINTAINER Carl Boettiger cboettig@ropensci.org 

ENV PATH=/usr/lib/ccache:$PATH

## Install additional R package dependencies ###
RUN apt-get update && \
  apt-get -y install --no-install-recommends \
  ccache \
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
  R -e "remotes::install_github(c('rstudio/blogdown', 'hadley/pkgdown'), upgrade = FALSE)" && \
  echo '\n options(blogdown.hugo.dir = "/usr/local/lib/")' >> /usr/local/lib/R/etc/Rprofile.site && \
  R -e "blogdown::install_hugo()" && \
  git config --system user.name 'Carl Boettiger' && \
  git config --system user.email 'cboettig@gmail.com' && \
  installGithub.r boettiger-lab/pomdpplus boettiger-lab/mdplearning


