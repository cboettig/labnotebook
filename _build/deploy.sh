#!/bin/bash

REPO="cboettig.github.io"
SOURCE="source"
DEPLOY="master"
YEAR="2015"

git clone -b ${DEPLOY} https://cboettig:${GH_TOKEN}@github.com/cboettig/$REPO ../deploy 
rsync -a _site/ ../deploy/
cd ../deploy \
    && wget -q http://carlboettiger.info/${YEAR}/blog.xml -O blog.xml \
    && wget -q http://carlboettiger.info/${YEAR}/atom.xml -O atom.xml \
    && wget -q http://carlboettiger.info/${YEAR}/R.xml -O R.xml \
    && git add -A . \
    && git commit -m 'Site updated from circleci' \
    && git push


