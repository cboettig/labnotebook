#!/bin/bash

set -e
source /home/cboettig/.notebook-env.sh
docker run --rm -v $(pwd):/data -w /data -e TWIT_KEY -e TWIT_SECRET -e TWIT_TOK -e TWIT_TOK_SECRET -e GARB_KEY -e GARB_PASS -e GARB_UA cboettig/labnotebook

if [ ! -d _gh-pages ]; then
	git clone -b master git@github.com:cboettig/cboettig.github.io _gh-pages
else
	cd _gh-pages && git pull origin master && cd ..
fi
rsync -a _site/ _gh-pages/
cd _gh-pages && git add -A . && git commit -m 'Site updated' && git push

