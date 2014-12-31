#!/bin/bash
if [ ! -d _gh-pages ]; then
	git clone -b gh-pages git@github.com:cboettig/labnotebook.git _gh-pages
# Control will enter here if $DIRECTORY exists.
else
	cd _gh-pages && git pull origin gh-pages && cd ..
fi
rsync -a _site/ _gh-pages/
cd _gh-pages && git add -A . && git commit -m 'Site updated' && git push

