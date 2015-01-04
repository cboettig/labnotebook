#!/bin/bash -i

## Only build the site if the commit hook was a push to the source branch.

if [ "$DRONE_BRANCH" ]
  then 
    if [ "$DRONE_BRANCH" = "source" ]
      then
	## Build the site
	Rscript -e 'servr::jekyll(serve=FALSE)'
	## Deploy site: clone the deploy branch, rsync files, commit, and push
        cd .. && git clone -b master https://cboettig:${GH_TOKEN}@github.com/cboettig/cboettig.github.io deploy 
        rsync -av cboettig.github.io/_site/ deploy/
        cd deploy && git add -A . && git commit -m 'Site updated from drone' && git push
    fi
fi
