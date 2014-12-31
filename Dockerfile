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
	&& install2.r --error --repo http://yihui.name/xran servr \
	&& rm -rf /tmp/downloaded_packages 

## bundler likes to be a non-root user in sudoers.  Also handy generally.
RUN adduser docker sudo \
  && echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers \
  && chown -R docker:docker /data
USER docker
WORKDIR /data

## Install additional Ruby gems
## Configure bundler and install gems listed in the Gemfile
ADD Gemfile /data/Gemfile 
RUN bundle config build.nokogiri --use-system-libraries \ 
  && bundle install 

EXPOSE 4000
#ENTRYPOINT ["/usr/bin/bundle", "exec", "jekyll"]
#CMD ["serve", "-H", "0.0.0.0"]

CMD Rscript -e 'servr::jekyll(port = 4000, host = "0.0.0.0")'
