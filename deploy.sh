#!/bin/bash
set -e
git config user.name cboettig
git config user.email cboettig@server.com

if [ ! -d _gh-pages ]; then
	git clone -b master https://cboettig:${GH_TOKEN}@github.com:cboettig/cboettig.github.io _gh-pages
else
	cd _gh-pages && git pull origin master && cd ..
fi
rsync -a _site/ _gh-pages/
cd _gh-pages && git add -A . && git commit -m 'Site updated' && git push
