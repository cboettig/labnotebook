# image: cboettig/labnotebook
# 
# Provides the R+Ruby+Jekyll+javascript environment needed to build my lab notebook sites
# 
# Use: link the working directory of the site to build: 
# 
#     docker run --rm -v $(pwd):/data -w /data \
#     -e TWIT_KEY -e TWIT_SECRET -e TWIT_TOK - e TWIT_TOK_SECRET \
#     cboettig/labnotebook
# 
# Serve locally by running deamonized with auto-assigned port (-dP) bu
# providing a custom CMD to jekyll:
#
#     docker run -dP ... \
#     Rscript -e 'servr::jekyll(port = 4000, host = "0.0.0.0")'

FROM rocker/hadleyverse 
MAINTAINER Carl Boettiger cboettig@ropensci.org 

## Install basic ruby, javascript, and linux utils we need for the site ##
RUN apt-get update \
  && apt-get install -y \
    bundler \
    node \
    rake \
    rsync \ 
  && apt-get clean \ 
  && rm -rf /var/lib/apt/lists/ \
  && gem install nokogiri -v '1.6.3.1' 

## Install additional R package dependencies ###
RUN install2.r --error igraph sde \
	&& install2.r --error --repo http://r-nimble.org nimble \
	&& installGithub.r yihui/servr \
	&& rm -rf /tmp/downloaded_packages 


### Install additional Ruby gems given in the Gemfile ###  
### (bundler likes to be a non-root user in sudoers.) 
### (Docker won't cache layers depending on external files, so this goes last)
ADD Gemfile /data/Gemfile 
ADD Gemfile.lock /data/Gemfile.lock
RUN adduser docker sudo \
  && echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers \
  && chown -R docker:docker /data
USER docker
WORKDIR /data
RUN bundle config build.nokogiri --use-system-libraries \ 
  && bundle install \
  && bundle update

### Expose port for server mode, but only knit+build by default ###
EXPOSE 4000
CMD Rscript -e 'servr::jekyll(serve = FALSE)'


