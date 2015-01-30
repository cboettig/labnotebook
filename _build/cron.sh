#!/bin/bash


# env variables
REPO="cboettig.github.io"
DEPLOY="master"
source /home/cboettig/.notebook-env.sh

## Set working directory
cd /home/cboettig/lab-notebook/cboettig.github.io
git pull https source

## Build site
docker run --rm -ti -v $(pwd):/data \
  -e TWIT_KEY=$TWIT_KEY -e TWIT_SECRET=$TWIT_SECRET -e TWIT_TOK=$TWIT_TOK -e TWIT_TOK_SECRET=$TWIT_TOK_SECRET \
  cboettig/labnotebook Rscript -e 'servr::jekyll(serve=FALSE, script="_build/build.R")'

## Deploy site
  if [ ! -d ../deploy ]
    then cd .. && git clone -b ${DEPLOY} https://cboettig:${GH_TOKEN}@github.com/cboettig/$REPO deploy 
    else 
      cd ../deploy && git pull
      cd ..
  fi
  rsync -a $REPO/_site/ deploy/
  cd deploy && git add -A . && git commit -m 'Site updated from cron' && git push
