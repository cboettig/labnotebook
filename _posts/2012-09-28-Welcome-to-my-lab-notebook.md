---
layout: post
title: Welcome to my Lab Notebook - Reloaded
category: open-science
tag: open-science
published: false

---

Welcome to my lab notebook, version 3.0.  My [original open lab notebooks](http://openwetware.org/wiki/User:Carl_Boettiger/Notebook) began on the wiki platform [OpenWetWare](http://openwetware.org), moved to a personally hosted Wordpress platform, and now run on a Jekyll-powered platform, but the basic idea remains the same. (For completeness, earlier entries from both platforms have been migrated here).  Quoting from [my original introduction](http://carlboettiger.info/archives/211) to the Wordpress notebook:


> ## Disclaimer: Not a Blog

> [![floatright](http://farm4.staticflickr.com/3053/3013680713_cfcebbd403_t.jpg)](http://www.flickr.com/photos/twid/3013680713/in/faves-cboettig/) Welcome to my open lab notebook.  This is the active, permanent record of my scientific research, standing in place of the traditional paper bound lab notebook.  The notebook is primarily a tool for me to *do* science, not communicate it.  I write my entries with the hope that they are intelligible to my future self; and maybe my collaborators and experts in my field.  Only the occasional entry will be written for a more general audience. 
> [...] 
> In these pages you will find not only thoughts and ideas, but references to the literature I read, the codes or manuscripts I write, derivations I scribble and graphs I create and mistakes I make.   



## Why an open notebook?  Is it working?

My original introduction to the notebook from November 2010 dodged this question by suggesting the exercise was merely an experiment to see if any of the purported benefits or supposed risks were well-founded.  Nearly three years in, can I draw any conclusions from this open notebook experiment?  

In that time, the notebook has seen six projects go from conception to [publication](http://carlboettiger.info/vita.html), and a seventh founder on a null result (see [#tribolium](http://carlboettiger.info/tags.html#tribolium)). Several more projects continue to unfold.  I have often worked on several projects simultaneously, and some projects branch off while others merge, making it difficult to capture all the posts associated with a single paper into a single tag or category. Of course not all ideas make it into the paper, but they remain captured in the notebook. I often return to my earlier posts for my own reference, and frequently pass links to particular entries to collaborators or other colleagues.  On occasion I have pointed reviewers of my papers to certain entries discussing why we did y instead of x, and so forth.  Both close colleagues and researchers I've never met have emailed me to follow up on something they had read in my notebook.   

I am both proud and nervous to know of a half dozen other researchers who have credited me for inspiring them to adopt open or partially open lab notebooks online.  I am particularly grateful for the examples, interactions, and ideas from established practitioners of open notebook science in other fields. My collaborators have been largely been somewhere between favorable and agnostic towards the idea, with the occasional request for delayed or off-line notes.  More often gaps arise from my own lapses in writing (or at least being intelligible), though the automated records from Github in particular, as well as Flickr (image log), Mendeley (reading log), and Twitter and the like help make up for some of the gaps.  

  <!-- Liam Revell, Scott Chamberlain, Alistair Boettiger, Noam Ross, Nick Fabina, Lee Worden, Mario Pineda-Krch-->




## Navigating the Open Notebook 

You can page through the notebook chronologically just like any paper notebook using the "Next" and "Previous" buttons on the sidebar. Of course the having an electronic notebook offers the ability to search, and you can browse the archives [by date](http://www.carlboettiger.info/archives.html), [tag](http://www.carlboettiger.info/tags.html) or [category](http://www.carlboettiger.info/categories.html).  Categories represent essentially separate notebooks for ecological research projects, evolutionary research topics, my teaching notebook, and a few others.  Each entry is usually made in a particular notebook (unique category).  Tags are more numerous, generic ways to group common entries which may have zero or multiple tags. An [RSS feed](http://www.carlboettiger.info/atom.xml) is available for new posts from the RSS icon at the bottom of each page (though currently equations and code blocks may not display well).

## (The real notebook is Github)

It can be difficult to get the big picture of a project by merely flipping through entries.  Likewise, the chronological flow of a blog or notebook fails to reflect the very nonlinear nature of research, and reproducing particular results frequently requires more information (as well as data and software) than contained in a single entry.  Github repositories have been the perfect answer to these challenges.  

My Github repositories offer a kind of inverted version of the lab notebook, organized on a backbone by project (roughly corresponding to tags) rather than the chronological backbone of the notebook.  Each of my research projects is now is given it's own public Github repository, structured as an R package with separate directories for functions, data, metadata, documentation, and analyses.  On Wordpress, I put forward the idea of an "Integrated Lab Notebook", a somewhat convoluted scheme in which I would describe what I was doing in the Wordpress posts, embed figures from Flickr, and link those figures to the underlying code on Github.  With the advent of [knitr](http://yihui.name/knitr/), I could dispense with this complicated custom scheme, and simply write my descriptions, code for the analysis and resulting figures in a single file.  Instead of creating a new notebook entry every time I extend or change a particular analysis, I can simply version manage the single file in the appropriate repository on Github. Click on a current repository such as [pdg_control](https://github.com/cboettig/pdg_control) and check out each of the related analyses in the [inst/examples](https://github.com/cboettig/pdg_control/tree/master/inst/examples) directory.  Each example includes everything required to reproduce the result, displays complete with syntax highlighting and figures in the same markdown language as the blog posts, and has a full version history with notes in the commit log about the associated changes.  

The [issues tracker](https://github.com/cboettig/pdg_control/issues?state=closed) connected to each Github repository provides a list of open and completed goals for the project, which themselves can be organized into color-coded tags. Progress on any issue often takes the form of subsequent commits of a particular analysis file, and that commit log can automatically be appended to the issue.  The repository structure makes the projects more portable -- I and others can clone a copy on different computers (e.g. my laptop, NERSC supercomputer) and easily merge changes.  Repositories serve just as well for writing the actual papers as they do for the analysis, as I discuss in "[writing reproducibly in the open with knitr](http://www.carlboettiger.info/2012/04/07/writing-reproducibly-in-the-open-with-knitr.html)." Huzzah for open source science.  

## The social lab notebook

When scripting analyses or writing papers, the notebook entry need only link to the commits and issues closed on that day. This can be done programmatically with a bit of Jekyll and ruby code. Mendeley is still my preferred platform for organizing and annotating articles, and it's API generates a convenient feed to what I am currently reading.  Twitter is my preferred professional social network (though I am trying to cross-post to G+), and these discussions can be easily linked into notebook entries using the API and a bit of Jekyll.  Feed for each of these appear at the top of my [notebook homepage](http://www.carlboettiger.info/lab-notebook.html), with links to the associated sites (also in the page footer). 








