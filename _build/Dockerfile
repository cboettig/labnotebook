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

FROM rocker/hadleyverse 
MAINTAINER Carl Boettiger cboettig@ropensci.org 

ENV TERM xterm

## Install basic ruby, javascript, and linux utils we need for the site ##
RUN apt-get update \
  && apt-get install -y \
    bundler \
    node \
    rake \
    rsync \ 
  && apt-get clean \ 
  && rm -rf /var/lib/apt/lists/ \
  && gem install nokogiri -v '1.6.3.1' \ 
  && installGithub.r yihui/servr \
	&& install2.r -r http://cran.rstudio.com git2r \
  && rm -rf /tmp/downloaded_packages 


### Install additional Ruby gems given in the Gemfile ###  
### (bundler likes to be a non-root user in sudoers.) 
### (Docker won't cache layers depending on external files, so this goes last)
ADD Gemfile /data/Gemfile 
ADD Gemfile.lock /data/Gemfile.lock
RUN adduser rstudio sudo \
  && echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers \
  && chown -R rstudio:rstudio /data
USER rstudio
WORKDIR /data
RUN bundle config build.nokogiri --use-system-libraries \ 
  && bundle install \
  && bundle update

## My git name
RUN git config --system user.name Carl Boettiger \
  && git config --system user.email cboettig@gmail.com

## Reset and tidy up
USER root
WORKDIR /
RUN rm -rf /data

### Expose port for jekyll serve ###
EXPOSE 4000


# CMD sudo supervisord
