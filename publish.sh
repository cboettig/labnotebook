#!/bin/bash
jekyll 
rsync -az _site/ carlboettiger.info:~/carlboettiger.info/
