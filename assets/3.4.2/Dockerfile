FROM rocker/geospatial:3.4.2
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
  R -e "remotes::install_github('hadley/pkgdown@33673a985029e05a42a3211fc6e8d68814a32caf',upgrade = FALSE)" \
  ## roboto font config for hrbrthemes:
  R -e "library(hrbrthemes); suppressWarnings(hrbrthemes::import_roboto_condensed()); \
    d <-read.csv(extrafont:::fonttable_file(), stringsAsFactors = FALSE); \
    d[grepl('Light', d$FontName), ]$FamilyName <- 'Roboto Condensed Light'; \
    write.csv(d, extrafont:::fonttable_file(), row.names = FALSE)" && \
  ## Install hugo via blogdown
  echo '\n options(blogdown.hugo.dir = "/usr/local/lib/")' >> /usr/local/lib/R/etc/Rprofile.site && \
  R -e "blogdown::install_hugo()" && \
  installGithub.r \
    boettiger-lab/sarsop@0.4.0 \
    boettiger-lab/pomdpplus@0.2.0 \
    boettiger-lab/mdplearning@0.1.0 && \
  ## preconfigure me as the git user
  git config --system user.name 'Carl Boettiger' && \
  git config --system user.email 'cboettig@gmail.com'


