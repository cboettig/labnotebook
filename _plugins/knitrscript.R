#!/usr/bin/Rscript
library("knitr")
library("yaml")

## process the command line arguments -
##  - args are separate strings containing each arg=value pair
args <- commandArgs(TRUE)[-1]        ## grab arguments


## Example arguments arranged as this character vector
## args <- c("root.dir=", "fig.show=hold", "fig.path=../docs-gh-pages/figures/",
##           "fig.width=10", "fig.height=7", "dev=svg", "warning=false")

## writeLines("args after capture")
## writeLines("<pre>")
## print(args)
## writeLines("</pre>")

## Handle the arguments
spl <- strsplit(args, "=")       ## split each arg=val pair into arg name & value
nams <- sapply(spl, `[`, 1)      ## extract argument names
vals <- sapply(spl, `[`, 2)      ## extract argument values
ind <- grepl("[0-9]+", vals)     ## index the numeric values
VALS <- as.list(vals)
VALS[ind] <- as.numeric(vals[ind])  ## convert numeric strings to numeric values
## handle logical values
logi <- vals %in% c("false", "true", "FALSE", "TRUE")
if (any(logi)) {
    VALS[logi] <- as.logical(vals[logi])
}
## Missing values for argument pairs like `"root.dir="` some through
## strsplit() as NA, so handle
nas <- is.na(vals)
VALS[nas] <- list(NULL)
## remaining must be characters
take <- !(ind | logi | nas) ## select argument values not numeric or logicals
## add `' '` around string values
VALS[take] <- paste("'", vals[take], "'", sep = "")

## Other handling
lose <- which(nams == "root.dir")   ## temp: drop the root.dir argument

## writeLines("Argument names and values")
## writeLines("<pre>")
## print(args)
## print(nams)
## print(vals)
## writeLines("</pre>")

## process argument value pairs back into a single string with R code...
call <- paste("list(", paste(nams[-lose], VALS[-lose], sep = "=",
                             collapse = ", "), ")", sep = "")
## ... which we then parse and evaluate to create a list containing named components for each
## argument name and the object in each component is the respective argument value
## writeLines("<pre>")
## print(call)
## writeLines("</pre>")

args <- eval(parse(text = call))

## writeLines("<pre>")
## print(args)
## writeLines("</pre>")

tmp <- do.call(opts_chunk$set, args) ## use this list as arguments to chunk options function
## writeLines("<pre>")
## print(opts_chunk$get())
## writeLines("</pre>")



## Read _config.yml or _config.yaml
config <- vector("list")
if(file.exists("_config.yml")){
  config <- yaml.load_file("_config.yml") 
} else if(file.exists("_config.yaml")){
  config <- yaml.load_file("_config.yaml") 
} else {
  config$baseurl <- "/docs/"
}


# Set opts_knit based on the config file
opts_knit$set(base.url = paste0(config$baseurl, "/"),
              base.dir = ".", verbose = FALSE,
              self.contained = FALSE, root.dir = NULL) 
              

## hardcoded knitr package options - until we work out how best to have both package &
## chunk options supplied via command line argument
#opts_knit$set(base.url="/docs/", base.dir=".", root.dir=NULL, self.contained=FALSE, verbose=FALSE)


## knit the document being processed; takes inpu from stdin and outputs to stdout
tmp <- knit(text = readLines(file("stdin")), output=stdout(), quiet=TRUE)

## note that objects `tmp` are just to stop objects returned by function that doesn't need
## to be assigned (do.call, knitr) spitting NULLs into the stdout stream.
