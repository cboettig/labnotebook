#!/bin/bash

## Compile the site
jekyll 

## Copy site to production server
#rsync -az _site/ carlboettiger.info:~/carlboettiger.info/

## Copy site to repository for github hosting
rsync -az _site/ ~/Documents/code/cboettig.github.com  
cd ~/Documents/code/cboettig.github.com  
git add *
git commit -a -m "update site"
git push
cd - 

# echo "Please cd to ~/Documents/code/cboettig.github.com and commit and push changes"  

echo "Site updated"

## Need to manually commit new and changed files and push to github
