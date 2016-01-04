#!/bin/bash

source ~/.credentials/twitter/cboettig.sh

docker run -e TWIT_KEY=$TWIT_KEY \
           -e TWIT_SECRET=$TWIT_SECRET \
           -e TWIT_TOK=$TWIT_TOK \
           -e TWIT_TOK_SECRET=$TWIT_TOK_SECRET \
           -d -p 4000:4000 \
           -v $(pwd):/home/rstudio/data \
           -w /home/rstudio/data cboettig/labnotebook \
           jekyll serve -H 0.0.0.0
#           R -e 'servr::jekyll(script="_build/build.R", serve=TRUE, host="0.0.0.0", port=4000)'
