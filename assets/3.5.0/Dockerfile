FROM rocker/geospatial:3.5.0
MAINTAINER Carl Boettiger cboettig@ropensci.org

## selects ccache compilers (once ccache is installed). NB this increases image size!
#ENV PATH=/usr/lib/ccache:$PATH

## Install additional R package dependencies ###
RUN apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get -y install --no-install-recommends \
  ccache \
  fonts-roboto \
  libgpgme11-dev \
  libsndfile1-dev \
  librdf-storage-virtuoso \
  virtuoso-server \
  awscli \
  pdftk && \
  install2.r --error \
    anytime \
    printr \
    MDPtoolbox \
    seewave \
    nimble \
    jsonld \
    jsonvalidate \
    ggthemes \
    hrbrthemes \
    Cairo \
    blogdown \
    rdflib \
    usethis \
    fs \
    pkgdown \
    greta && \
  ## Install hugo via blogdown
  echo '\n options(blogdown.hugo.dir = "/usr/local/lib/")' >> /usr/local/lib/R/etc/Rprofile.site && \
  R -e "blogdown::install_hugo()" && \
  installGithub.r \
	cran/FKF@0.1.3 \
    boettiger-lab/sarsop@0.4.0 \
    boettiger-lab/pomdpplus@0.2.0 \
    boettiger-lab/mdplearning@0.1.0 && \
  ## preconfigure me as the git user
  git config --system user.name 'Carl Boettiger' && \
  git config --system user.email 'cboettig@gmail.com'


