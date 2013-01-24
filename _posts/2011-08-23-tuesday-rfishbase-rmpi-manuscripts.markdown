---
comments: true
date: 2011-08-23 15:10:24
layout: post
slug: tuesday-rfishbase-rmpi-manuscripts
title: 'Tuesday: rfishbase, Rmpi, manuscripts, ...'
redirects: [/wordpress/archives/2379, /archives/2379]
categories:
- computation
- evolution
tags:
- fishbase
---

## rfishbase


In answer to Tomomi's question from last week, have basic functionality as an R package on github, [rfishbase](https://github.com/cboettig/rfishbase). Learned some slightly richer XML parsing in the process.


### XML Notes


Had to identify blocks by a child node that specifies the identity, and then find the sibling node that contains the content I needed. Goes something like this:


```xml

<dataObject>
  <dc:identifier>FB-Size-2</dc:identifier>
  <dc:description> Text I need </dc:description>
</dataObject>

```


Which I parsed in R as:


```r

 size_node <- getNodeSet(doc, paste("//dc:identifier[string(.) =
                          'FB-Size-", fish.id, "']/..", sep=""), namespaces)
  size <- xmlValue( size_node[[1]][["description"]] )
```


Note that because we specify the exact node, we get only one return item and we can call size_node[[1]].
Note that fish.id is part of the identifier, and the use of the string(.)= to get the content of the identifier. We use xmlValue to get the description element out, though other ways are possible (such as sapply xmlToList). See code for details.


### RegExp Notes


Also did some regular expressions parsing for size information, which isn't intelligently coded in the XML. Found the [regexplib website](http://regexlib.com/) particularly useful for looking up expressions, for instance, for handling numbers with commas and different units. This [cheat-sheet](http://www.addedbytes.com/download/regular-expressions-cheat-sheet-v2/png/) also helps.

In particular, getting weight units was a bit tricky:


```r

  weight <- gsub(".+published weight: ( (\\d|,)*\\.?\\d*) (g|kg).+", "\\1", size)
  weight <- as.numeric(gsub(",", "", weight)) # remove commas
  if(units=="kg")
    weight <- weight*1000
```



### Implementation and Examples


Error handling is quite necessary as there's lots of missing data. Compute times are a bit slow, but able to create a few smart examples.

Age distribution for ids 2-500, minus those missing. Image will link to code.

![](data:image/png;base64,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)



## Rmpi


A couple difficulties in my earlier shell scripts on carver/hopper. Re-testing these now. SUCCESS. Test script simple.sh is working on Carver.

simple.sh:


```bash

#PBS -l walltime=00:10:00
#PBS -q debug
#PBS -l nodes=2:ppn=8
#PBS -N simple
#PBS -j oe
cd $PBS_O_WORKDIR
module load R/2.12.1
R -f simple.R

```


Test R file:


```r

library("Rmpi")
mpi.spawn.Rslaves(nslaves=15)
slavefn <- function() { print(paste("Hello from", foldNumber)) }
mpi.bcast.cmd(foldNumber <- mpi.comm.rank())
mpi.bcast.Robj2slave(slavefn)
result <- mpi.remote.exec(slavefn())
print(result)
mpi.close.Rslaves()
mpi.quit(save = "no")
```

