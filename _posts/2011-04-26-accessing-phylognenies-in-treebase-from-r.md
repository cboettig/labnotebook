---
comments: true
date: 2011-04-26 14:10:22
layout: post
slug: accessing-phylognenies-in-ropensci-from-r
title: Accessing phylognenies in TreeBASE from R
redirects: [/wordpress/archives/1502, /archives/1502]
categories:
- evolution
tags:
- ropensci
---

I've recently (([25 April](http://www.carlboettiger.info/archives/1496), [8 April](http://www.carlboettiger.info/archives/1382))) begun a project to see if I can search for and load phylogenies from [TreeBASE](http://www.treebase.org/) directly into R. Thanks to the rather brilliant API in place (documented on the [treeBASE wiki](https://sourceforge.net/apps/mediawiki/treebase/index.php?title=API)) for TreeBASE, some advice from [Rutger Vos](http://rutgervos.blogspot.com/) (TreeBASE developer), and some [xpaths](http://en.wikipedia.org/wiki/XPath) R code from Gabe Becker (stats grad student, UC Davis), I have a (mostly) working demonstration.  As I get a chance, I'll be adding the rest of the [queries available in the API](https://spreadsheets.google.com/pub?key=rL--O7pyhR8FcnnG5-ofAlw), improve the error handling and give some more thought to a user interface.  A long cry from a mature package, but a decent proof-of-principle and a nice test-piece for me to learn a bit of how to make web calls and parse xml from R.

The package is being developed in my [Comparative Methods repository ](https://github.com/cboettig/Comparative-Phylogenetics/tree/master/treebase)(will probably fork into it's own repository once its a bit more mature), and a basic version is packaged on the [downloads](https://github.com/downloads/cboettig/Comparative-Phylogenetics/treebase_0.0-1.tar.gz) tab.


## Introduction to package:


My goal is to essentially mimic the [search capabilities ](https://spreadsheets.google.com/pub?key=rL--O7pyhR8FcnnG5-ofAlw)provided by the [web front-end](http://www.treebase.org/treebase-web/search/studySearch.html) using the [API](https://sourceforge.net/apps/mediawiki/treebase/index.php?title=API).

To grab all the phylogenetic trees by Huelsenbeck:

    
    Huelsenbeck = search_treebase("Huelsenbeck", by="author", section="study")
    


The first term is the search query.  The second term indicates that it is an author.  The third term specifies that we query by studies, essentially what tab we're on from the search window.  The web search is organized under different tabs, which have somewhat different search options.  The function returns all the trees in phylo format, and prints the url query so that the search can be explored manually.

We can search by taxa (appearing in tips only -- handling inclusive taxonomy is more challenging...):

    
    whales = search_treebase("Cetacea", by="taxon", section="taxon")
    


There are quite a few kinds of searches I'd like to be able to do, but don't seem available through the API.  For instance, It would be nice to search for trees with:



	
  * ** branch lengths** (many early trees are topology only), or more particularly, for chronograms (most comparative methods applications need time-calibrated trees);

	
  * **by algorithm** (RaxML, MrBayes, etc).  TreeBASE stores (and runs?) this [analysis](http://treebase.org/treebase-web/search/study/analyses.html?id=2218) information.




## To Do





	
  * Add remaining queries

	
  * Combining queries with booleans

	
  * improved user interface and documentation

	
  * Handling errors - most problematic right now I get errors on [trees](http://treebase.org/treebase-web/search/study/anyObjectAsRDF.rdf?namespacedGUID=TB2:Tr9917) with access denied while submissions are still in process.  Apparently this is a bug in treebase, hopefully fixable.


So far this is just the interface to the phylows commands.  Still have to figure out what can be done with the [Open Archives Initiative Protocol for Metadata Harvesting (OAI-PMH)](http://www.openarchives.org/pmh/) interface, since some functions like Author search are already in phylows.  Bill points out that this would allow searching by date of publication, and also will interface with Data Dryad.

Also interested in exploring SQL dumps.


## Why


Rutger Vos gives an [excellent introduction](http://www.slideshare.net/rvosa/phyloinformatics-and-the-semantic-web) to the concept of "Phyloinformatics," embedded below. As R is becoming a standard for applied phylogenetic analyses, I think it would be particularly useful to be able to access this potential from directly within R.

[iframe http://www.slideshare.net/slideshow/embed_code/7339099 425 355]

Of course this isn't what we really want to do.  There's nothing  special about the phylogeny from a particular study--an arbitrary  assembly of taxa and methods.  Or as Rod Page so eloquently put it,

[blackbirdpie id="53849924894343168"]

The ideal inference pathway goes back to the raw data each time -- draw the loci of interest for the taxa of interest from Genbank and start from scratch with a fully hierarchical inference.  Unfortunately, this is not always practical

Yet  science progresses by extrapolations and generalizations of these  arbitrary data sets that stand behind the conclusions brandished from  the titles of so many publications.  Re-analyzing the data behind these  studies will only happen if it is easy, so I hope this can greatly lower  the threshold.  Hopefully we can replace the more common:



	
  * Scientist A studies dataset B with method C and concludes D

	
  * Scientist E studies dataset F with method G and contradicts D


with

	
  * Scientist E studies dataset B (& F) with methods C (& G) and concludes...


Of course, re-analysis and reproducible research isn't as sexy as it  should be (arguably it's impact is much greater, but somehow we mistake  novelty for impact sometimes) so it's fortunate that a good database  interface doesn't just mean better science, but also new science --  comparing methods, using methods requiring very large datasets for  adequate power or to directly test rather than assume generality. ((i.e.  test vs assume key innovations are important for adaptive radiations in  bees because they appear important in fish, etc.))

I think  this exercise should not only be practically useful in helping me run  more analyses faster, but hope it has some farther-reaching pedagogical  value in the possibilities and challenges in interfacing with  real  linked data in large repositories.
