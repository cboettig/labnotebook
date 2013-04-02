---
layout: post
title: Welcome to my Lab Notebook - Reloaded
category: open-science
tags: 
- notebook-technology
- Jekyll 
- blog

---

Welcome to my lab notebook, version 3.0.  My [original open lab notebooks](http://openwetware.org/wiki/User:Carl_Boettiger/Notebook) began on the wiki platform [OpenWetWare](http://openwetware.org), moved to a personally hosted Wordpress platform, and now run on a Jekyll-powered platform ([site-config](http://www.carlboettiger.info/README.html)), but the basic idea remains the same. For completeness, earlier entries from both platforms have been migrated here.  Quoting from [my original introduction](http://www.carlboettiger.info/archives/211) to the Wordpress notebook:


> ## Disclaimer: Not a Blog

> [![floatright](http://farm4.staticflickr.com/3053/3013680713_cfcebbd403_t.jpg)](http://www.flickr.com/photos/twid/3013680713/in/faves-cboettig/) Welcome to my open lab notebook.  This is the active, permanent record of my scientific research, standing in place of the traditional paper bound lab notebook.  The notebook is primarily a tool for me to *do* science, not communicate it.  I write my entries with the hope that they are intelligible to my future self; and maybe my collaborators and experts in my field.  Only the occasional entry will be written for a more general audience. 
> [...] 
> In these pages you will find not only thoughts and ideas, but references to the literature I read, the codes or manuscripts I write, derivations I scribble and graphs I create and mistakes I make.   



## Why an open notebook?  Is it working?

My original introduction to the notebook from November 2010 dodged this question by suggesting the exercise was merely an experiment to see if any of the purported benefits or supposed risks were well-founded.  Nearly three years in, can I draw any conclusions from this open notebook experiment?  

In that time, the notebook has seen six projects go from conception to [publication](http://www.carlboettiger.info/vita.html), and a seventh founder on a null result (see [#tribolium](http://carlboettiger.info/tags.html#tribolium)). Several more projects continue to unfold.  I have often worked on several projects simultaneously, and some projects branch off while others merge, making it difficult to capture all the posts associated with a single paper into a single tag or category. Of course not all ideas make it into the paper, but they remain captured in the notebook. I often return to my earlier posts for my own reference, and frequently pass links to particular entries to collaborators or other colleagues.  On occasion I have pointed reviewers of my papers to certain entries discussing why we did `y` instead of `x`, and so forth.  Both close colleagues and researchers I've never met have emailed me to follow up on something they had read in my notebook.  This evidence suggests that the practice of open notebook science can faciliate both the performance and dissemination of research while remaining compatible and even synergistic with academic publishing.  

I am both proud and nervous to know of a half dozen other researchers who have credited me for inspiring them to adopt open or partially open lab notebooks online.  I am particularly grateful for the examples, interactions, and ideas from established practitioners of open notebook science in other fields. My collaborators have been largely been somewhere between favorable and agnostic towards the idea, with the occasional request for delayed or off-line notes.  More often gaps arise from my own lapses in writing (or at least being intelligible), though the automated records from Github in particular, as well as Flickr (image log), Mendeley (reading log), and Twitter and the like help make up for some of the gaps.  

  <!-- Liam Revell, Scott Chamberlain, Alistair Boettiger, Noam Ross, Nick Fabina, Lee Worden, Mario Pineda-Krch-->

## The Integrated Notebook becomes the Knitted Notebook

In creating my wordpress lab notebook, [I put forward the idea of an "Integrated Lab Notebook"](http://www.carlboettiger.info/archives/211), a somewhat convoluted scheme in which I would describe my ideas and analyses in Wordpress posts, embed figures from Flickr, and link them to code on Github.   [Knitr](http://yihui.name/knitr/) simplified all that.  I can now write code, analysis, figures, equations, citations, etc, into a single `Rmarkdown` format and track it's evolution through git version control.  The `knitr` markdown format goes smoothly on Github, the lab notebook, and even into generating pdf or word documents for publication, never seperating the code from the results.  For details, see "[writing reproducibly in the open with knitr](http://www.carlboettiger.info/2012/04/07/writing-reproducibly-in-the-open-with-knitr.html)."



## Navigating the Open Notebook 

You can page through the notebook chronologically just like any paper notebook using the "Next" and "Previous" buttons on the sidebar. The notebook also leverages all of the standard features of a blog: 

* the ability to search, 
* browse the archives [by date](http://www.carlboettiger.info/archives.html), 
* browse by [tag](http://www.carlboettiger.info/tags.html) or 
* browse by [category](http://www.carlboettiger.info/categories.html).  
* follow the [RSS feed](http://www.carlboettiger.info/atom.xml) 
* add and share comments in Disqus

I use categories as the electronic equivalent of separate paper notebooks, dividing out my ecological research projects, evolutionary research topics, my teaching notebook, and a few others.  As such, each entry is (usually) made into exactly one category.  I use tags for more flexible topics, usually refecting particular projects or methods, and entries can have zero or multiple tags.  

It can be difficult to get the big picture of a project by merely flipping through entries.  The chronological flow of a notebook is a poor fit to the very nonlinear nature of research.  Reproducing particular results frequently requires additional information (also data and software) that are not part of the daily entries.  Github repositories have been the perfect answer to these challenges. 

## (The real notebook is Github)

My Github repositories offer a kind of inverted version of the lab notebook, grouped by project (tag) rather than chronology.  Each of my research projects is now is given it's own public Github repository.  I work primarily in R because it is widely used by ecologists and statisicians, and has a strong emphasis on reproducible research.  The "R package" structure turns out to be brilliantly designed for research projects, which specifies particular files for essential metadata (title, description, authors, software dependencies, etc), data, documentation, and source code (see [my workflow](http://www.carlboettiger.info/2012/05/06/research-workflow.html) for details).  Rather than have each analysis described in full in my notebook, they live as seperate `knitr` markdown files in the [`inst/examples`](https://github.com/cboettig/pdg_control/tree/master/inst/examples) directory of the R package, where their [history](https://github.com/cboettig/pdg_control/commits/master/inst/examples) can be browsed on Github, complete with their commit logs.  Long or frequently used blocks of code are written into functions with proper documentation in the package source-code directory `/R`, keeping the analysis files cleaner and consistent.   

The [issues tracker](https://github.com/cboettig/pdg_control/issues?state=closed) connected to each Github repository provides a rich TO DO list for the project. Progress on any issue often takes the form of subsequent commits of a particular analysis file, and that commit log can automatically be appended to the issue. 

## The social lab notebook

When scripting analyses or writing papers, pretty much everything can be captured on Github.  I have recently added a short [script](https://github.com/cboettig/jekyll-labnotebook-plugins) to Jekyll which will pull the relevant commit logs into that day's post automatically.  Other activities fit less neatly into this mold (reading, math, notes from seminars and conferences), so these things get traditional notebook entries.  I'm exploring automated integration for other activities, such as pulling my current reading from Mendeley or my recent discussions from Twitter into the notebook as well.  For now, feed for each of these appear at the top of my [notebook homepage](http://www.carlboettiger.info/lab-notebook.html), with links to the associated sites.  



