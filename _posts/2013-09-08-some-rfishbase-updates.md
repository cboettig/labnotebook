---
layout: post
category: ecology
tags: 
- ropensci

---


Ever since writing the `rfishbase` package I've been frustrated by the
lack of a proper API from Fishbase.org that would allow access to that
wealth of information that is not exposed in the "Summary XML" files
from which `rfishbase` extracts its content.  Since writing the paper 
in Journal of Fish Biology, I continue to receive user requests asking
if or how such-and-such a data element might be extracted.  Usually this
involves a disappointing boiler-plate reply about how the package is 
limited to the "Summary XML" data and that improved query potential must
wait for a proper API from Fishbase.org at some unspecified time.  

I have been in touch with many of the folks at Fishbase.org at various
times looking for ways to address these issues.  They have been
in general keenly supportive of the idea, but I gather that they are
largely overworked and under-resourced and as such, implementation of
any of these steps has been very slow.  Last October another rfishbase
user contacted me, who works full time as a software developer.  I put
him in touch with the UBC team, and he is willing to volunteer the hours
and expertise the FishBase development team lacks to help transform the
database into a full API.  I think this is a very promising development
and a nice example of a community effort, but still faces the same 
fundamental challenges in getting things rolling. So, so far, no 
`rfishbase` version 2.  (Actually in our semantic versioning it would
be the less romantic version 0.3 or 0.4 or so, depending on how many CRAN 
submits we do before then and provided we don't break any backwards compatibility)...


One of the more frequent requests involves accessing quantitative trophic level
estimates provided for many species on the "Ecology" page, linked from the "Summary page".
The only way to access this data is by scraping the HTML.

Previously I've been reluctant to scrape the HTML directly for several reasons:

- It is generally unrealiable/unverifiable.  Without any metadata (rdfa or 
microdata/microformats could have helped...) in the HTML to signpost that we
have the correct value, we are generally counting arbitrary header, div and span
elements, followed by some Regular Expression matching, to find the element we want.  
This is error-prone and easily broken by any changes in the html pages either over time
or between pages for different species. 

- Second, it puts a much greater load on the fishbase servers.  Often we cannot even start 
by querying the page we want, (e.g. since URLs involve things like stock-ids that the end user will not 
know and I haven't located a look-up table), so a single call may follow links through 
several pages before parsing the data it needs.  Repeating such queries over many fish programmatically
can create a rather substantial burst of traffic that could slow or crash the servers.  

- It's slow.  Making all the queries takes time, even for a computer.  (Though caching, as we already do
in rfishbase, could take care of much this).  

- It is potentially time consuming and annoying to code the scaping.


Okay, the last is just me being lazy.  Since this particular query about trophic level was a
common email request, and as the data was available from the "Ecology" page of a species
in the form of an HTML Table, (and hence somewhat less fragile to robustly identify...),
I thought I'd give it a try.  

Here's my approach (or see [source code]()). We would follow the same query structure as `getSize` did [^1],
and execute several steps:  

[^1]: taking the `fish.data` list as 
an argument -- potentially a weird choice but oh well, that's what I did when I first wrote the rfishbase
API so may as well keep it. A more natural choice taking scientific names as arguments directly, instead
of needing to start with a which_fish query, should be added one day to the entire package API.  

1. Visit the Summary page of the requested fish
2. Find it's Ecology page
3. Find the Trophic level table 
4. parse the table.  

In code, that looks like this: 

```r
getTrophicLevel <- function(fish.data = NULL,
                            path = NULL,
                            as_table=FALSE, 
                            from = c("diet composition", "individual food items"), 
                            unfished = FALSE,
                            justSE = FALSE,
                            justReference = FALSE){

  ids <- getIds(fish.data = fish.data, path=path)
  out <- sapply(ids, function(id){
    summaryPage <- getSummary(id)
    ecologyPage <- getEcology(summaryPage)
    tab <- readTrophicLevel(ecologyPage)
    if(as_table)
      tab
    else
      parseTrophicLevel(tab, from=from, unfished=unfished,justSE=justSE, justReference=justReference)
    })
  out
}
```

Which has a whole bunch of options just to let the user control the format of the output / target value, since there are different numbers.  

Each of the steps corresponds to it's own function:


```r
getIds <- function(fish.data=NULL, path=NULL){
  if(is.null(fish.data))
    fish.data <- loadCache(path=path)
  ids <- sapply(fish.data, `[[`, 'id')
  species.names <- sapply(fish.data, `[[`, 'ScientificName')
  names(ids) <- gsub(" ", "_", species.names) # use underscores instead of spaces
  ids
}


getSummary <- function(id){ 
  # Grab and parse page matching id
  url <- paste0("http://www.fishbase.org/summary/speciessummary.php?id=", id)
  summaryPage <- htmlParse(url) 
}

getEcology <- function(summaryPage){
  link <- xpathApply(summaryPage, "//*[contains(@href, '/Ecology/FishEcologySummary.php')][1]", xmlAttrs)[[1]][["href"]]
  ecologyPage <- htmlParse(paste0("http://www.fishbase.org/", gsub("\\.\\./", "", link)))
}


readTrophicLevel <- function(ecologyPage){ 
  tab <- readHTMLTable(ecologyPage)[[6]]
}
```

which are all nice and short and potentially self-explanatory.  Extracting values from the table we isolate
is done rather crudely at the moment and could no doubt be improved, but this is what I came up with:

```r
parseTrophicLevel <- function(tab, 
                              from = c("diet composition", "individual food items"), 
                              unfished = FALSE,
                              justSE = FALSE,
                              justReference = FALSE){
  from <- match.arg(from)
  if(justReference)
    out <- as.character(tab[3,2])
  else{
    col <- 2
    adj <- 0
    if(unfished)
      col <- 4
    if(justSE)
      adj <- 1
    if(from == "diet composition")
      out <- as.numeric(as.character(tab[2,col+adj]))
    else if(from == "individual food items")
      out <- as.numeric(as.character(tab[4,col+adj]))
  }
  out 
}

```

Most of these are internal functions of course, only the top `getTrophicLevel` is user-facing.  
The use is straight forward: 

```r
require(rfishbase)
data(fishbase)

getTrophicLevel(fish.data[1:10])
```

or any of the various optional configurations, e.g.

```r
getTrophicLevel(fish.data[1:10], as_table=TRUE)
```

(which gives a list of tables matching these fish).  



The astute reader might notice that with `EcologyPage` etc we have access to a lot more (tabular) data in this approach, which could be extended beyond that page as well, following the same template shown here.  Just a matter of time and the other limitations discussed above.   


So anyway, if you need the getTrophicLevel, it's available now on the [Github version](https://github.com/ropensci/rfishbase/issues/12) and should be on CRAN in the near future.  Meanwhile, I'd certainly welcome other requests (or better yet, forks and pull requests implementing additional data fields along these same lines).  




