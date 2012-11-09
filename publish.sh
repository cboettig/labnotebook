#!/bin/bash
jekyll --auto 
rsync -avz _site/ carlboettiger.info:~/carlboettiger.info/
