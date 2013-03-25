#!/bin/bash

## Compile the site
jekyll 

## Copy site to production server
rsync -az _site/ carlboettiger.info:~/carlboettiger.info/

## Copy site to repository for github hosting
rsync -az _site/ ~/Documents/code/cboettig.github.com  

## Need to manually commit new and changed files and push to github
