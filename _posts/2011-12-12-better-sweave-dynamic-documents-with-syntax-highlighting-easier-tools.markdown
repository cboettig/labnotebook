---
comments: true
date: 2011-12-12 17:26:47
layout: post
slug: better-sweave-dynamic-documents-with-syntax-highlighting-easier-tools
title: Better dynamic documents (Sweave) with syntax highlighting, caching, etc
redirects: [/wordpress/archives/3524, /archives/3524]
categories:
- computation
- open-science
tags:
- code-tricks
---

The highlight package is a simple solution for very nice syntax highlighted code boxes in latex documents.  Requires [switching the driver](http://stackoverflow.com/questions/5448608/changing-the-sweave-driver-from-the-command-line), which is best done from within R and requires creating a makefile though.  Needs the "highlight" package installed.  Here's a [simple makefile.](https://gist.github.com/1469063)

A wealth/mess of Sweave related packages on the CRAN [taskview for Reproducible Research](http://cran.r-project.org/web/views/ReproducibleResearch.html) (now what other software platform has a the equivalent of a Reproducible Research task view?)

But why not really do things correctly? The [knitr](http://yihui.github.com/knitr) package is beautiful. Abstracts the concept beyond just latex integration.  You can write in pure latex, (instead of noweb mix), in pure markdown, or pure html, embedding the R commands in comments.  knitr can run the code in those comments to generate a file of the same format, but with the dynamic content embedded.  Handles caching, syntax highlighting, and figures in a much more seamless manner.  It can also use the package author's [formatR ](https://github.com/yihui/formatR)code to tidy up your code before including it.  You can convince R to use this for vignettes with a similar makefile.

[gist id=1470786]

The github markdown integration makes github look like a better and better candidate for a lab notebook.  Wonder how it handles mathjax or citations?

Another nice find for bringing my older package documentation into roxygen form: [Rd2roxygen](https://github.com/yihui/Rd2roxygen).


## More ambitious dynamic documentation


These improvements to Sweave are nice, though the dynamic document concept can certainly go much further.  [Dexy.it](http://www.dexy.it/features/) is an interesting multi-lingual version, but doesn't seem to combine source and the documentation in the same file.  Guess that can be kinda good, kinda bad. It seem to use a non-standard syntax, and while it's python easy_install sounds fine, might still be a barrier to adoption among R users...

Meanwhile, some notes form a presentation I saw recently that have a much more ambitious view of what's possible.  Nov 22 (which I've recast into the language Tim Berners-Lee uses to describe linked-data on the web:



	
  * One star -- sweave

	
  * two stars - XDynDocs multiple views (alternate analyses, full lab notebook)

	
  * three stars - rfirefox - interactive web view

	
  * star four - live data sources (self updating)


Some people involved: Deborah Nolan, Thomas Lee, Paul Baines, Wolfgang Polonik, Duncan Temple-Lang, Gabriel Becker.

some of my questions:

	
  * In the context of these tools, do we distinguish documenting code from publishing analyses?

	
  * Does this make remaining errors the more insidious?


