#!/bin/bash
jekyll 
rsync -av _site/ carlboettiger.info:~/carlboettiger.info/
