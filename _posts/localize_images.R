fix <- function(txt){
  paste("(/assets/figures/", txt, ")", sep="")
}

localimages <- function(files){
  require(gsubfn)
  lapply(files, function(file){

       content <- readLines(file)
       content <- gsubfn("\\(http://.*/assets/figures/(.*\\.png)\\)", fix, content)
         writeLines(content, file)
  })
}




files <- system("grep -l 'http://.*/assets/figures/.*\\.png' *.md", intern=TRUE)
localimages(files)

