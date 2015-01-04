#!/bin/bash -i
set -e

if [ "$DRONE_BRANCH" ]
  then 
    if [ "$DRONE_BRANCH" = "source" ]
      then
        sudo apt-get update && sudo apt-get install -y rsync
        git config --global user.name cboettg
        git config --global user.email cboettig@server.com
        git clone -b source https://github.com/cboettig/cboettig.github.io ../source
        cd ../source && Rscript -e 'servr::jekyll(serve=FALSE)'
        cd .. && git clone -b master https://cboettig:${GH_TOKEN}@github.com/cboettig/cboettig.github.io deploy 
        rsync -av source/_site/ deploy/
        cd deploy
        git status
        git add -A . && git commit -m 'Site updated' && git push
    fi
fi
