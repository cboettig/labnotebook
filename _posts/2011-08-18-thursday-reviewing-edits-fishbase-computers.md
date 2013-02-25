---
comments: true
date: 2011-08-18 15:03:16
layout: post
slug: thursday-reviewing-edits-ropensci-computers
title: 'Thursday: reviewing edits, ropensci, computers.'
redirects: [/wordpress/archives/2370, /archives/2370]
categories:
- evolution
tags:
- ropensci
---

## Graham & Peter meeting


Going over review and figuring out how to address issues.  Plan: Will write our line-by-line responses under the reviewer comments in the Google Doc.  Peter and I will implement remaining changes on the .tex file, then we'll compose the reply letter from the notes under the comments and include the latex-diff.

Brief topic notes from today's meeting:



	
  * set up different take on layout: lambda, AIC, power

	
  * parameter estimates on over-parameterized

	
  * opten implicit nulls

	
  * eb bootstrapping is power analysis

	
  * rules of thumb only so good, simulate easy.

	
  * delta = aic + k

	
  * intro on aic use for finding "good enough models" not inferring process

	
  * we do stepwise B&K approach (as our recommended approach)




## FishBASE interface


Tomomi had an interesting query re FishBASE today - she'd like to be able to sweep through the database and extract certain information such as genus, maximum published weight, etc.  While there doesn't seem to be a documented API per se. the[ individual reference pages](http://fishbase.us/Summary/SpeciesSummary.php?ID=2) include a link to an [XML summary sheet](http://fishbase.sinica.edu.tw/maintenance/FB/showXML.php?identifier=FB-2&ProviderDbase=03), where at least some of this information is intelligently tagged.  So we can easily set up some R functions with the help of XML and xpath to start grabbing the relevant information.


## MPI Computing


Looks like a hardware failure may have been responsible for my crashed MPI job on farm cluster.  Waiting to hear more from admin.  Likewise waiting on NERSC help on the batch R process on compute nodes.  step by step....

