# image: cboettig/labnotebook
# 
# Provides the R+Ruby+Jekyll+javascript environment needed to build my lab notebook sites
# 
# Use: 
#   link the working directory of the site to build. 
#   (`-e` keys only needed if using the twitter plugin)
# 
#     docker run --rm -v $(pwd):/data -w /data \
#     -e TWIT_KEY -e TWIT_SECRET -e TWIT_TOK - e TWIT_TOK_SECRET \
#     cboettig/labnotebook
# 
# Serve locally by running deamonized with auto-assigned port (-dP) by 
# providing a custom CMD to jekyll:
#
#     docker run -dP -v $(pwd)/data cboettig/labnotebook \
#       Rscript -e 'servr::jekyll(port = 4000, host = "0.0.0.0")'

FROM rocker/verse 
MAINTAINER Carl Boettiger cboettig@ropensci.org 

## So that things like `top` and `less` work correctly
ENV TERM xterm

RUN echo "deb http://deb.debian.org/debian testing main" > /etc/apt/sources.list.d/debian-testing.list \
  && echo 'APT::Default-Release "stable";' > /etc/apt/apt.conf.d/default
## Install basic ruby, javascript, and linux utils we need for Jekyll (hadleyverse provides R needs) ##
RUN apt-get update \
  && apt-get install -y -t testing --no-install-recommends ruby-dev bundler \
  && apt-get -y install --no-install-recommends \
    awscli \
    curl \
    nodejs \
    rsync \
  && apt-get clean \ 
  && rm -rf /var/lib/apt/lists/ \
  && gem install nokogiri \
#-v '1.6.3.1' \ 
  && rm -rf /tmp/downloaded_packages \ 
  && echo "options(stringsAsFactors = FALSE)" >> /etc/R/Rprofile.site \
  && mkdir -p /data \
  && wget https://raw.githubusercontent.com/cboettig/cboettig.github.io/source/_build/Gemfile -O /data/Gemfile \
  && adduser rstudio sudo \
  && echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers \
  && chown -R rstudio:rstudio /data \
  && cd /data \ 
# && bundle config build.nokogiri --use-system-libraries \ 
  && bundle install \
  && bundle update \
  && git config --system user.name 'Carl Boettiger' \
  && git config --system user.email 'cboettig@gmail.com' \
  && git config --system credential.helper 'cache --timeout=3600' \
  && git config --system push.default simple \
  && rm -rf /data && gem cleanup

### Expose port for jekyll serve ###
EXPOSE 4000
