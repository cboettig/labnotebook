# docker run -dP -v $(pwd):/data cboettig/labnotebook

FROM rocker/hadleyverse 
MAINTAINER Carl Boettiger cboettig@ropensci.org 

RUN apt-get update \
  && apt-get install -y \
    bundler \
    node \
    rake \
  && apt-get clean \ 
  && rm -rf /var/lib/apt/lists/ \
  && gem install nokogiri -v '1.6.3.1' 

## Install additional R package dependencies
RUN install2.r --error igraph sde \
	&& install2.r --error --repo http://r-nimble.org nimble \
	&& installGithub.r yihui/servr \
	&& rm -rf /tmp/downloaded_packages 

## (Docker won't cache layers depending on external files, so this goes last):
## Install additional Ruby gems. 
ADD Gemfile /data/Gemfile 
ADD Gemfile.lock /data/Gemfile.lock
RUN adduser docker sudo \
  && echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers \
  && chown -R docker:docker /data
## (bundler likes to be a non-root user in sudoers.)
USER docker
WORKDIR /data
RUN bundle config build.nokogiri --use-system-libraries \ 
  && bundle install \
	&& bundle update

EXPOSE 4000

## Just Jekyll
#ENTRYPOINT ["/usr/bin/bundle", "exec", "jekyll"]
#CMD ["serve", "-H", "0.0.0.0"]

## Build knitr+jekyll
CMD Rscript -e 'servr::jekyll(serve = FALSE)'

## Knitr+Jekyll+serve
# CMD Rscript -e 'servr::jekyll(port = 4000, host = "0.0.0.0")'
