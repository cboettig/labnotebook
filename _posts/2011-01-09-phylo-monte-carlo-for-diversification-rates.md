---
comments: true
date: 2011-01-09 13:28:55
layout: post
slug: phylo-monte-carlo-for-diversification-rates
title: Phylo Monte Carlo for diversification rates
redirects: [/wordpress/archives/741, /archives/741]
categories:
- evolution
---

Writing function wrappers for geiger functions to perform  Phylogenetic Monte Carlo.  Any object that has methods defined for update.objecttype (object, data) and simulate.objecttype(data), and loglik.object(object) should be able to use the montecarlotest() function. OUCH almost does this but not quite, since the datatype returned by 'simulate' doesn't match that needed by 'update'. OUCH also uses S4 class styles.

Wrote wrappers for ouch functions such that the ouch models will work with the same montecarlotest() code.  Some care to avoid S3-S4 conflicts.  See gist[ref]Example code above for correct handling.  Basically avoid the S4 setGeneric() for compatibility.[/ref] for notes on this from Duncan.


## Branching Rates


Having some difficulty running basic models.  Notes: birthdeath.tree creates a tree with extinct taxa.  prune.extinct.taxa() seems to fail.  Graham Slater suggests TreeSim package, which works except on wiglaf for some reason, the final example in sim.bd.taxa doesn't run. A couple questions of what it means to be simulating under the right model"



	
  * Should the simulation under the model condition on the number of taxa or the time?

	
  * Should the simulation bother generating trees or just the vector of branching times? (really only a performance question)


Overall phylogenetic monte carlo seems to show that accurately distinguishing between models is very difficult.

[flickr-gallery mode="search" tags="phylogenetics" min_upload_date="2011-01-09 00:00:00" max_upload_date="2011-01-09 23:59:59"]

Creating a table of functions provided by the various phylogenetic methods package in R with notes:

[table id=1 /]


## S3 & S4 classes in R


[gist id="773234"]
