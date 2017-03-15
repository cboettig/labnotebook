#!/bin/bash

REPO="cboettig.github.io"
SOURCE="source"
DEPLOY="master"
YEAR="2015"

git config --global user.name "Carl Boettiger"
git config --global user.email "cboettig@gmail.com"


rm -rf ../deploy
git clone -b ${DEPLOY} https://cboettig:${GH_TOKEN}@github.com/cboettig/$REPO ../deploy 
assets/files/update_cv_pdf.sh

## hack to fix reverse ordering on vita
sed -i 's/<ol/<ol reversed/' _site/vita.html

rsync -a _site/ ../deploy/

## hack to update feed to current year
cd ../deploy \
    && wget -q http://carlboettiger.info/${YEAR}/blog.xml -O blog.xml \
    && wget -q http://carlboettiger.info/${YEAR}/atom.xml -O atom.xml \
    && wget -q http://carlboettiger.info/${YEAR}/R.xml -O R.xml \
    && git add -A . \
    && git commit -a -m 'Site updated from circleci' || echo "no changes to commit" \
    && git push


