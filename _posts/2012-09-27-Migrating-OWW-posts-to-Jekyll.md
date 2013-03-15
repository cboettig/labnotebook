---
layout: post
category: open-science
tags: 
- notebook-technology
- Jekyll
- code-tricks

---


This Open Lab Notebook started on a public MediaWiki-based site, [OpenWetWare](http://openwetware.org) (OWW), which was created with the ambitious vision of having a single wiki for biological sciences (or at least, synthetic microbiology, since such the wiki grew out of a collection of such labs).  Users could have their own pages that served as a personal website or lab group site, contribute pages on specific protocols, host course websites, and most interestingly, were encouraged to create open lab notebooks using specially designed templates for the purpose.  From January through October of 2010, I kept all my notes in two separate OWW notebooks: one for entries on my [Comparative Phylogenetics](http://openwetware.org/wiki/User:Carl_Boettiger/Notebook/Comparative_Phylogenetics) research, and a seperate one for entries in [Stochastic Population Dynamics](http://openwetware.org/wiki/User:Carl_Boettiger/Notebook/Stochastic_Population_Dynamics). Each notebook had a cover page and then entries by day, linked by the calendar box on the cover page.  This was a neat idea an excellent introduction into the world of open lab notebooks.  

In September of 2010 I began to leave the OpenWetWare platform to start my own lab notebook based on a privately hosted copy Wordpress. The benefits of being on a shared community platform were minimized by the relatively small number of active users mostly belonging to a different field.  Downtime on the site and a lack of any easy way to access my content off-line or back up content also made me increasingly nervous, while the difficulty in adding additional tools or functionality (such as RSS feeds to new entries, personal tags, improved search) collectively spurred my decision to move to Wordpress. At the time I had knew of no easy way to migrate my OWW posts, so I allowed them to remain where they were while I continued further notes in my newly minted Wordpress installation.  

In April of 2012 I began to experiment with the static-blogging engine, Jekyll. My adoption of markdown, facilitated by my discovery of pandoc and the advent of `knitr`, together with my complete submersion into a Github-based workflow led me to first consider Jekyll.  Wordpress was slow and heavy, both for creating entries in the online editor (though I did start pushing markdown-based entries to Wordpress through it's API and the associated R package).  Though Jekyll has a slightly steeper learning curve to start, once you have the basics down complicated things aren't any harder than easy ones, whereas on Wordpress the basics are trivial but complex customization becomes a full-time web-developer challenge.  In Jekyll, it was rather easy to migrate all my old entries from the previous platforms onto the new one.

In the [previous post](http://www.carlboettiger.info/2012/09/19/migrating-from-wordpress-to-jekyll.html) I describe exporting my Wordpress-based entries using a python script from Thomas Frossman. To export my OpenWetWare entries I relied on the rather excellent MediaWiki API. While I began by grabbing the content of each post in MediaWiki syntax, I soon realized it was easier to grab the content already parsed as HTML (using a different API call) and then parse the HTML into markdown using Pandoc. (Pandoc's developmental version does have experimental support for reading MediaWiki syntax now).  I then added a few substitutions to standardize my tags and categories.  Here's my R call to the MediaWiki API (see [wiki_get.R](https://github.com/cboettig/sandbox/blob/1efa80e913006051083544275f6af9b5ab9ccb0a/wiki_get.R)):

```r
wiki_parse <- function(page, baseurl, format="json", ...){
  require(httr)
  action = "parse"
  addr <- paste(baseurl, "/api.php?format=", format, "&action=", action, "&page=", page, sep="")
  config <- c(add_headers("User-Agent" = "rwiki"), ...)
  out <- GET(addr, config=config)
  parsed_content(out)
}
```

I create a few helper functions for parsing the html into markdown, and also extracting and adding the metadata into Jekyll's YAML headers (see [export_oww.R](https://github.com/cboettig/sandbox/blob/1efa80e913006051083544275f6af9b5ab9ccb0a/export_oww.R))

```r
require(httr)
require(gsubfn)

oww_to_md <- function(pages, user="Carl_Boettiger",  baseurl = "http://openwetware.org"){
  # Store filenames (with dates) and categories for each page, for reference later
  filenames <- get_filenames(pages)
  categories <- get_categories(pages)
  ## Use the API function to extract the content
  parsed <- export_oww(pages, user, baseurl)
  ## Add the baseurl back into all the links
  htmls <- add_baseurl(parsed)
  ## Create YAML header text
  headers <- add_header_txt(parsed, categories)
  ## Use pandoc to convert the html to markdown
  mds <- html_to_md(htmls, filenames) 
  ## Delete the OWW header info we don't want in the markdown
  mds <- clean_md(mds)
  ## Stick headers onto markdown files and name them according to filenames
  write_mds(mds, headers, filenames) 
}

get_filenames <- function(pages){
  lapply(pages, function(p){
    p <- gsub(" ", "_", p)
    filename <- gsub("/", "-", p)
    filename <- gsub("(.*)-(\\d+-\\d+-\\d+)", "\\2-\\1", filename)
  })
}

#' Take a list of page titles to a user's OWW notebooks and export them as Jekyll markdown entries.  
get_categories <- function(pages){
  lapply(pages, function(p){
    p <- gsub("_", " ", p)
    filename <- gsub("/", "-", p)
    category <- gsub("(.*)-(\\d+-\\d+-\\d+)", "\\1", filename)
  })
}


#' Take a list of page titles to a user's OWW notebooks and export them as Jekyll markdown entries.  
export_oww <- function(pages, user="Carl_Boettiger",  baseurl=  "http://openwetware.org"){
  lapply(pages, function(p){
    p <- gsub(" ", "_", p)
    page <- paste("User:", user, "/Notebook/", p, sep="")
    out <- wiki_parse(page, baseurl=baseurl)
  })
}

add_baseurl <- function(parsed,  baseurl = "http://openwetware.org"){
  lapply(parsed, function(out){
    html <- out$parse$text[[1]]
    html <- gsubfn("src=\"/images/", paste("src=\"", 
                   baseurl,"/images/", sep=""), html)
    html <- gsubfn("href=\"/wiki/", paste("src=\"", 
                   baseurl,"/wiki/", 
                    sep=""), html)
  })
}

add_header_txt <- function(parsed, mycategories){
  sapply(1:length(parsed), function(i){
    out <- parsed[[i]]
    category <- mycategories[[i]]
    if(length(out$parse$categories)>0){
      categories <- sapply(out$parse$categories, function(x) x$`*`)
      gsub("_", " ", categories)
      ## Standarize some of my tags, called "categories" on OWW
      tags <- paste("tags: ", "[", 
                          paste0(categories, collapse = ", "),
                          "]", sep="")  
    } else {
      tags <- ""
    }
    
    header <- c("---", 
                "layout: post",
                tags, 
                paste("categories: ", category),
                "---\n\n")
  })
}


html_to_md <- function(htmls, filenames){
  lapply(1:length(htmls), function(html){
    writeLines(htmls[[i]], paste(filenames[i], ".html", sep=""))
    md <- system(paste("pandoc ", filenames[i], ".html -w markdown", 
                       sep=""), intern=TRUE)
  })
}


clean_md <- function(mds){
  lapply(mds, function(md){
    ## Remove OWW header
    md <- gsub("!\\[image\\]\\(http://openwetware.org/images/f/f8/Owwnotebook_icon.png\\)", "", md)
    md <- gsub("!\\[image\\]\\(http://openwetware.org/images/9/94/Report.png\\)",  "", md)
    md <- gsub("Main project", "", md)
    md <- gsub("page\\\\", "", md)
    md <- gsub("!\\[image\\]\\(http://openwetware.org/images/c/c3/Resultset_previous.png\\)",  "", md)
    md <- gsub("Previous$",  "", md)
    md <- gsub("^entry Next$", "", md)
    md <- gsub("!\\[image\\]\\(http://openwetware.org/images/5/5c/Resultset_next.png\\)", "", md)
    md <- gsub("^entry$", "", md)
    md <- gsub("^Stochastic Population Dynamics", "", md)
    md <- gsub("^Comparative Phylogenetics$", "", md)
    md <- gsub("^Teaching$", "", md)
  })
}



write_md <- function(mds, headers, filenames){
  lapply(1:length(mds), function(i){
    writeLines(c(headers[[i]], mds[[i]]), paste(filenames[i], ".markdown", sep="")) 
  })
}
```


If or when I change platform again, it should be even easier. With all my posts in markdown, I can easily move them into an ebook or pdf using Pandoc (currently requires stripping the YAML headers first, though it would be great if Pandoc eventually supported metadata headers in YAML).  Github renders the markdown of each post automatically, so the content of most posts can be read directly from the Github repository, [cboettig/labnotebook](https://github.com/cboettig/labnotebook/tree/master/_posts).   


## Misc tricks


The unix `rename` utility comes in handy:

```
rename 's/Comparative_Phylogenetics/Comparative-Phylogenetics-Notebook-(from-OWW)/' *Comparative_Phylogenetics.markdown
rename 's/Stochastic_Population_Dynamics/Stochastic-Population-Dynamics-Notebook-(from-OWW)/' *Stochastic_Population_Dynamics.markdown
```

And a vim mapping to flip through 100s of source files quickly: 

```
:map <F2> :N<CR>
:map <F3> :n<CR>
```
