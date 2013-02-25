files <- system("ls *.md", intern=TRUE)
require(gsubfn)
lapply(files, function(file){
  content <- readLines(file)
  yaml <- grep("^---$", content)
  content[yaml[1]:yaml[2]] <- gsubfn("treebase", "ropensci", content[yaml[1]:yaml[2]])
  content[yaml[1]:yaml[2]] <- gsubfn("fishbase", "ropensci", content[yaml[1]:yaml[2]])
  writeLines(content, file)
})



