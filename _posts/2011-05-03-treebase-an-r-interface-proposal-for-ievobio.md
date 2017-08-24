---
comments: true
date: 2011-05-03 21:07:36
layout: post
slug: ropensci-an-r-interface-proposal-for-ievobio
title: 'treeBASE R interface: proposal for #iEvoBio'
redirects: [/wordpress/archives/1549, /archives/1549]
categories:
- evolution
tags:
- ropensci
---

## Lightning Talk Proposal


[![](http://farm6.static.flickr.com/5070/5685541420_656d5e16ab_o.png)](http://treebase.org) I will present the R package treeBASE, which provides an R implementation of the [treeBASE phylows API](https://sourceforge.net/apps/mediawiki/treebase/index.php?title=API).   This package makes it possible to search and import data from this database of published phylogenetic trees easily from within an R script.  Recent data archiving requirements at major evolutionary journals such as _The American Naturalist_ (Whitlock _et. al._ 2010) and _Evolution_ (Fairbairn, 2011) to deposit  data used in the study on the [Dryad digital repository](http://datadryad.org/jdap) (and deposit accompanying trees in TreeBASE), along with new requirements for data management from funders[ such as NSF](http://www.nsf.gov/pubs/policydocs/pappguide/nsf11001/gpg_2.jsp#dmp) are rapidly changing the landscape of data availability.

To take full advantage of available data, researchers must have simple, familiar and intuitive tools to access and manipulate the datasets.  Such tools could have dramatic effects on verification and validation in reproducible research, education, meta-analyses, and in opening doors to novel research questions.  The R language is widely used in comparative phylogenetics approaches; consequently allowing this package to be readily integrated into existing types of analysis.  In this talk I will suggest the motivation for this package and provide examples use cases before outlining where I would like to see it develop in the future.  The package is in active development; version history, example code and issue tracking can be found on the [github page](http://github.com/cboettig/treeBASE).



	
  * **License**: GPL-v2

	
  * **Source code**: [http://github.com/cboettig/treeBASE](http://github.com/cboettig/treeBASE)



## References


- Whitlock M, McPeek M, Rausher M, Rieseberg L and Moore A (2010).
"Data Archiving."
*The American Naturalist*, **175**.
ISSN 0003-0147, <a href="http://dx.doi.org/10.1086/650340">http://dx.doi.org/10.1086/650340</a>.

- Fairbairn D (2011).
"The Advent of Mandatory Data Archiving."
*Evolution*, **65**.
<a href="http://dx.doi.org/10.1111/j.1558-5646.2010.01182.x">http://dx.doi.org/10.1111/j.1558-5646.2010.01182.x</a>.
