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

ADD Gemfile /data/Gemfile 
ADD Gemfile.lock /data/Gemfile.lock

RUN adduser docker sudo \
  && echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers \
  && chown -R docker:docker /data

USER docker
WORKDIR /data

## Configure bundler and install gems listed in the Gemfile
RUN bundle config build.nokogiri --use-system-libraries \ 
  && bundle install \
	&& bundle update

EXPOSE 4000

ENTRYPOINT ["/usr/bin/bundle", "exec", "jekyll"]
CMD ["serve", "-H", "0.0.0.0"]

