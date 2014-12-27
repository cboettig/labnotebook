FROM ubuntu:14.04

ENV DEBIAN_FRONTEND noninteractive
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8

RUN locale-gen en_US.UTF-8 && dpkg-reconfigure locales

RUN apt-get update && apt-get -y install \
    bundler \
    git \
    libxml2-dev \
    libxslt1-dev \
    libcurl4-openssl-dev \
    make \
    pandoc \
    pandoc-citeproc \
    ruby1.9.1 \
    ruby1.9.1-dev \
    software-properties-common \ 
    && gem install nokogiri -v '1.6.3.1'


ADD . /labnotebook
WORKDIR /labnotebook

## Configure bundler and install gems listed in the Gemfile

RUN bundle config --global LANG en_US.UTF-8 \
    && bundle config --global LC_ALL en_US.UTF-8 \
    && bundle config build.nokogiri --use-system-libraries \ 
    && bundle install && bundle update


## Build environment for compiling Bootstrap >= 3.0.0 (Node.js / SASS environment)

RUN add-apt-repository ppa:chris-lea/node.js \
    && apt-get update && apt-get -y install \
       python \
       python-software-properties \
       g++ \
       make \
       nodejs 

RUN npm install -g grunt-cli
WORKDIR /labnotebook/assets/_bootstrap-3.1.1
RUN npm install
RUN make


WORKDIR /labnotebook
EXPOSE 4000

CMD bundle exec jekyll serve

#CMD bundle exec rake site:deploy
