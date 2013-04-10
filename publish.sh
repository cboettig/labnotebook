#!/bin/bash

## Compile the site
jekyll 

## Copy site to repository for github hosting
rsync -az _site/ ~/Documents/code/cboettig.github.com  
cd ~/Documents/code/cboettig.github.com  
git add *
git commit -a -m "update site"
git push
cd - 
echo "Site updated on Github server"

# echo "Please cd to ~/Documents/code/cboettig.github.com and commit and push changes"  
## Need to manually commit new and changed files and push to github
