#!/bin/bash

SOURCE="source"
if [ "$DRONE_BRANCH" ]
  then 
    if [ "$DRONE_BRANCH" = "$SOURCE" ]
      then 
        Rscript -e 'servr::jekyll(serve=FALSE, script="_build.R")'
    fi
fi
