---
comments: true
date: 2011-09-02 12:59:35
layout: post
title: 'rfishbase demo: Are there more Goby or Labrid species on reefs?'
redirects: [/wordpress/archives/2529, /archives/2529]
categories:
- evolution
tags:
- ropensci
---

I have updated the package to 0.0-3 alpha, having all the target functionality now.  Improved error handling, downloading of data, processing.  Get the source or windows binary [here](https://github.com/cboettig/rfishbase). I now download the full database and cache it locally for faster querying.  Just about any kind of manipulation is then possible and fast.  

For instance, here's a quick demo based on a question from Peter Wainwright: "are there more gobys or labrids on reefs?"


    
    
    > require(rfishbase)
    Loading required package: rfishbase
    > ## Download and parse data for first 40 ids (36 fish)
    > #fish.data <- getData(1:40)
    > 
    > ## Or just load the cached copy of the full fishbase data:
    > data(fishbase)
    > fish.data <- all.fishbase 
    > labrid <- familySearch("Labridae", fish.data)
    > goby <- familySearch("Gobiidae", fish.data)
    > 
    > # get all those that are reefs 
    > labrid.reef <- habitatSearch("reef", fish.data[labrid])
    > # How many species are reef labrids:
    > sum(labrid.reef) #same as: length(fish.data[labrid][labrid.reef])
    [1] 415
    > 
    > # How many reef gobies:
    > sum (habitatSearch("reef", fish.data[goby]) )
    [1] 399
    > 
    


More Labrids! Peter tells me that once you add the parrotfish, labrids are the clear winner. Just as we can search habitat keywords, we could do the same for diet, distribution, etc.  We also have access to the size data, etc, as shown in the [wainwrightlab](http://fishlab.ucdavis.edu/?p=395) demo. This has been streamlined using the getSize() function in the new version.  


This uses some very simple functions I've added to the package in the [R/analysis.R](https://github.com/cboettig/rfishbase/blob/2f642553e4d0ab3b632a0fea64150aca98a02594/R/analysis.R) script.  They are meant to be examples rather than comprehensive, since it will be easier for an experienced user of R to write their own commands or functions than to anticipate all possible kinds of queries.  This should give a clear starting point.  Other potentially common queries may be given their own functions in the future.  

While one can always run against the cached copy of the database now included in the package, it may be necessary to update this regularly as the online database is updated.  This synchrony is of course the primary functionality of the rfishbase package.  In principle all 30,715 or so entries of fishbase can be downloaded with getData(1:70000).  In practice this may need to be broken into chunks to be successful, given server limitations, memory limitations, etc.  The demo script downloadFishbase.R is one example of how this might be done.  



