#!/bin/bash
cd /home/cboettig/lab-notebook/cboettig.github.io
source /home/cboettig/.notebook-env.sh
docker run --rm -ti -v $(pwd):/data \
  -e TWIT_KEY=TWIT_KEY -e  TWIT_SECRET=TWIT_SECRET -e TWIT_TOK=TWIT_TOK -e TWIT_TOK_SECRET=TWIT_TOK_SECRET \
  cboettig/labnotebook Rscript -e 'servr::jekyll(serve=FALSE, script="_build/build.R")'
rsync -a _site/ _gh-pages/
cd _gh-pages && git add -A . && git commit -m 'cron update'
