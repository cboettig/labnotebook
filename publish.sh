#!/bin/bash
jekyll 
rsync -avz _site/ carlboettiger.info:~/carlboettiger.info/
