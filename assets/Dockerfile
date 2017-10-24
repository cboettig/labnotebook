FROM rocker/geospatial:3.4.2
MAINTAINER Carl Boettiger cboettig@ropensci.org 

ENV PATH=/usr/lib/ccache:$PATH

## Install additional R package dependencies ###
RUN apt-get update && \
  apt-get -y install --no-install-recommends \
  ccache \
  fonts-roboto \
  libgpgme11-dev \
  libsndfile1-dev \
  install2.r --error \
    printr \
    FKF \
    MDPtoolbox \
    seewave \
    nimble \
    jsonld \
    jsonvalidate \
    extrafontdb \
    blogdown && \
  R -e "remotes::install_github(c('hadley/pkgdown', 'hrbrmstr/hrbrthemes'), upgrade = FALSE)" && \
  echo '\n options(blogdown.hugo.dir = "/usr/local/lib/")' >> /usr/local/lib/R/etc/Rprofile.site && \
  R -e "blogdown::install_hugo()" && \
  git config --system user.name 'Carl Boettiger' && \
  git config --system user.email 'cboettig@gmail.com' && \
  installGithub.r boettiger-lab/pomdpplus boettiger-lab/mdplearning


