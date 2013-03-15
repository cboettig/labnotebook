---
comments: true
date: 2012-04-19 10:39:06
layout: post
slug: catching-up
title: Catching up
redirects: [/wordpress/archives/4451, /archives/4451]
categories:
- ecology
tags:
- ropensci
- warning-signals
- notebook-technology
- wrightscape
- code-tricks
---

Catching up on notebook entries for last week and the beginning of this week in one go here.  In the process of wrapping up a variety of older projects, so this is kinda all over the place.

## rfishbase

  * Create function table, 
  * finalize functions
  * Add support for references.  Done, see [getRefs](https://github.com/ropensci/rfishbase/blob/master/R/analysis.R#L280). (And isn't it awesome that you can link to a specific linenumber (i.e. line 280) in github by adding #L280 to the end of the url?)  
  * Picked up some great grep tools in the process thanks to stackoverflow: handling [empty matches](http://stackoverflow.com/questions/10214604/gsub-return-an-empty-string-when-no-match-is-found) and [multiple matches](http://stackoverflow.com/questions/10215142/gsub-to-return-all-matches-of-an-expression-instead-of-just-the-last-match)
  * No luck in setting [templates for pandoc's conversion to word](http://johnmacfarlane.net/pandoc/demo/example9/options.html).  Should be possible with `--reference.docx` but no luck.  (meanwhile, who knew .docx and .odt were just zip archives you could unzip and poke around the xml?  Unfortunately styles.xml is a bit opaque to me).  



## treebase

* Replace all sapply calls with dedicated functions
* Table of functions
* Simplify presentation
* markdownify the Sweave file.

## Prosecutor's fallacy


* Running examples 

## Wrightscape

* Collecting, organizing and selecting [examples](https://github.com/cboettig/wrightscape/blob/master/inst/examples) into knitr format from demo files.  

## StatCompSci

* Duncan is running a brown bag seminar on big data computing.  We're coordinating all material over [on github](https://github.com/StatComputingUCDavis/Spring12BBSeminar).  

## Other

* Write ievobio proposals
* prsb review -- Done.
* Experimenting with a [Jekyll based site](cboettig.github.com) using CSS from twitter-bootstrap.  
* Coordinating Academic Publishing panel discussion

## Misc code tricks

* [clone all branches](http://stackoverflow.com/questions/67699/how-do-i-clone-all-remote-branches-with-git)
* [image alignment in markdown](http://stackoverflow.com/questions/255170/markdown-and-image-alignment)
* [markdown in diqus](http://code.lancepollard.com/jquery-disqus-plugin)

## _ruby versions can drive you nuts sometimes._

* Getting [out of 1.8.7 and into 1.9.2](http://askubuntu.com/questions/91693/how-do-you-uninstall-ruby-1-8-7-and-install-ruby-1-9-2)
* Redcarpet isn't the default interpreter, but works better. However, [it's latest version has issues](http://stackoverflow.com/questions/8395347/gollum-wiki-undefined-method-new-for-redcarpetmodule).



