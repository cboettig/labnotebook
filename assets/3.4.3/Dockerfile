FROM rocker/geospatial:3.4.3
MAINTAINER Carl Boettiger cboettig@ropensci.org 

## selects ccache compilers (once ccache is installed). NB this increases image size!
#ENV PATH=/usr/lib/ccache:$PATH

## Install additional R package dependencies ###
RUN apt-get update && \
  apt-get -y install --no-install-recommends \
  ccache \
  fonts-roboto \
  libgpgme11-dev \
  libsndfile1-dev && \
  install2.r --error \
    printr \
    FKF \
    MDPtoolbox \
    seewave \
    nimble \
    jsonld \
    jsonvalidate \
    ggthemes \
    hrbrthemes \
    Cairo \
    blogdown && \
  R -e "remotes::install_github(c('hadley/pkgdown','hrbrmstr/hrbrthemes'),upgrade = FALSE)" && \
  ## Install hugo via blogdown
  echo '\n options(blogdown.hugo.dir = "/usr/local/lib/")' >> /usr/local/lib/R/etc/Rprofile.site && \
  R -e "blogdown::install_hugo()" && \
  installGithub.r boettiger-lab/pomdpplus boettiger-lab/mdplearning && \
  ## preconfigure me as the git user
  git config --system user.name 'Carl Boettiger' && \
  git config --system user.email 'cboettig@gmail.com'


