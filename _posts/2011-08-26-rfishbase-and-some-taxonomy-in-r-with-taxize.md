---
comments: true
date: 2011-08-26 23:16:22
layout: post
slug: rropensci-and-some-taxonomy-in-r-with-taxize
title: rropensci and some taxonomy in R with taxize
redirects: [/wordpress/archives/2443, /archives/2443]
categories:
- computation
- evolution
tags:
- ropensci
---

## rfishbase


Went through demo of rfishbase with Tomomi.  Improved error handling, added a few data types and a few use cases.

I always forget that I have to drop nulls by indexing, not my return values of sapply.


```R


x[!sapply(x, is.null)]

```


Very annoyed with fishbase id numbers (being discontinuous listings and unable to query xml by anything more intelligent). Querying all fishbase ids 1:30000, I get only 999 fish. hmm. Could this be an R memory issue? No sign of such errors. I also illustrate custom functions for processing output.

**_UPDATE: _**fixed these errors generally. Seemed specific to zero.  Did run with some memory errors; hopefully avoided. See updated post 09-01-11.


```R

require(rfishbase)
# Now let's just grab the entire fishbase database,
fish.data <- getData(1:30000)
length(fish.data)
[1] 999

habitatSearch <- function(keyword, fish.data){
# A function to search for the occurances of a keyword in habitat description
# Args:
#   keyword: pattern to be used by grep
#   fish.data: list of outputs from fishbase(), or from getData()
# Example:
#   data <- getData(1:10)
#   habitatSearch("feshwater", data)
  x <- sapply(fish.data, function(x) grep(keyword, x$habitat) )
  x <- as.integer(x)
}

x <- habitatSearch("reef", fish.data)
reef <- sum(x, na.rm=T)
nonreef <- sum(is.na(x))
percent_reef <- reef/(reef+nonreef)
```


I'd like to be able to query fishbase by something other than fishbase's own id numbers, but might have to make that database myself, since they don't seem to be listed anywhere.


### Taxize


Meanwhile, I'm looking into how we can query between common names and scientific names at different levels using the ROpenSci package taxize from Scott. I've just made a few modifications to handle some xml parsing with xpath expressions and formatting.  Tweaked some functions in taxize.R script-set for grabbing scientific names.  For instance, if I want all Plethodon salamanders in the [Integrated Taxanomic Information System](http://itis.gov) database


```r

require(taxize)
xml <- get_itis_xml("Plethodon ")
out <- parse_itis(xml)
head(out)
                       sci    tsn                                com
1         Plethodon aeneus 208328                               <NA>
2     Plethodon ainsworthi 668315               Catahoula Salamander
3       Plethodon albagula 208278           Western Slimy Salamander
4         Plethodon amplus 668316 Blue Ridge Gray-cheeked Salamander
5 Plethodon angusticlavius 668317                   Ozark Salamander
6         Plethodon asupak 685566               Scott Bar Salamander

```


Note I get common names, scientific names, and tsn id numbers. Using a tsn id number I can query the whole taxonomy, by querying by the given tsn ids:


```r

> classification(685566)
       rank            taxon tsn..length.tsn..
1   Kingdom         Animalia            202423
2    Phylum         Chordata            158852
3 Subphylum       Vertebrata            331030
4     Class         Amphibia            173420
5     Order          Caudata            173584
6    Family   Plethodontidae            173631
7 Subfamily   Plethodontinae            550197
8     Genus        Plethodon            173648
9   Species Plethodon asupak            685566
```


Pretty cool.
