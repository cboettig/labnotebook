#!/bin/bash


## Make sure github hosting repo is up-to-date before we write to it
cd ~/Documents/code/cboettig.github.com  
git pull -s ours
cd - 

## Compile the site
jekyll build -d ~/Documents/code/cboettig.github.com  ## Preferable to rsync?


## Upload the site to github 
##rsync -az _site/ ~/Documents/code/cboettig.github.com  
cd ~/Documents/code/cboettig.github.com  
git add *
git commit -a -m "update site"
git push
echo "Site updated on Github server"

