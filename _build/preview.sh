#!/bin/bash

docker run -d -p 4000:4000 -v $(pwd):/home/rstudio/data -w /home/rstudio/data cboettig/labnotebook R -e 'servr::jekyll(script="_build/build.R", serve=TRUE, host="0.0.0.0", port=4000)'
