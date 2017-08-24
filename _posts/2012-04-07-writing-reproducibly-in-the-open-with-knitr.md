---
comments: true
date: 2012-04-07 14:58:36
layout: post
slug: writing-reproducibly-in-the-open-with-knitr
title: Writing reproducibly in the open with knitr
redirects: [/wordpress/archives/4419, /archives/4419]
categories:
- open-science
tags:
- R
---

[Sweave](http://en.wikipedia.org/wiki/Sweave) is something of a gold standard in reproducible research.  It creates a _dynamic document_, written in a mix of LaTeX and R code where the results of the analysis (numbers, figures, tables) are automatically generated from the code and inserted into the resulting pdf document, making them easy to update if the data or methods change.  It's a nice idea, in principle.

However, the practical troubles are many. Coauthors don't know LaTeX, publishers who don't accept LaTeX or pdfs.  The LaTeX myth that you are freed from thinking about formatting, when in fact you have to fill your document with LaTeX specific markup that makes it a burden both to type and to read the source-code.  Compiling and debugging your text. And then the reproducibility comes from sharing that Sweave file -- a mix of LaTeX and R that almost no one can read easily.  Where's the elegance in that?  ((I'm glossing over the additional challenges of highlighting, caching, and formating on the R code side, which have been largely addressed by additional packages and are elegantly solved in knitr.)) Sure, none of these are show-stoppers -- I've been content with LaTeX for years -- but suddenly there's a better way.

Thanks to [knitr](http://yihui.name/knitr/), a successor of Sweave, I can write my publications in [markdown](http://en.wikipedia.org/wiki/Markdown).  Unlike LaTeX, HTML, or other markup languages, markdown is designed to be easily read as plain text, but can also be interpreted into pretty HTML, and now into almost any other format thanks to [pandoc](http://johnmacfarlane.net/pandoc/).  All of which is to say that writing and sharing just got _a lot easier._

[As I have written previously](http://www.carlboettiger.info/archives/4325), I already use this markdown format for my notes and code, so there's no re-typing required.  When working on the paper, I can just write.  I can edit the code without flipping back and forth between files.  Knitr can run the code blocks, caching parts that have already run for efficiency, and upload the resulting figures in `png` format automatically to the Internet.  Github displays the [resulting document](https://github.com/ropensci/rfishbase/blob/master/inst/doc/rfishbase/rfishbase_github.md) and the 
```file
```
(https://github.com/ropensci/rfishbase/blob/master/inst/doc/rfishbase/source/rfishbase.md), while also [tracking the versions](https://github.com/ropensci/rfishbase/commits/master/inst/doc/rfishbase/source) as my writing progresses.

![Different output formats for the manuscript](http://farm8.staticflickr.com/7241/7054829647_ac9dcc4bd3_z.jpg)

Pandoc allows me to transform these notes into a LaTeX file that can generate professional-looking pdfs with given journal `.cls` files by using [a custom latex template](https://github.com/ropensci/rfishbase/blob/master/inst/doc/rfishbase/elsarticle.latex). Pandoc can also generate the less pretty but often required word documents.  [A separate Rscript](https://github.com/ropensci/rfishbase/blob/master/inst/doc/rfishbase/knit) combines with a [Makefile](https://github.com/ropensci/rfishbase/blob/master/inst/doc/rfishbase/Makefile) to control the relevant formatting -- for LaTeX output I want high-quality `pdf` graphics, for Word-doc output I want `eps` graphics which are created but not pasted into the Word file, for the drafts I want `png` graphics stored online for easy sharing.  Pandoc allows citations to be extracted from my Mendeley library (via Bibtex files) and inserted into each of these output formats (doc, pdf, github markdown).

Getting the LaTeX template, Makefile, and knit script set up for this pipeline takes a little care -- mostly to ensure figures and tables look appropriate in all outputs. Once these files are created though, they can be easily reused on other manuscripts.  A simple `make pdf` builds the pdf copy, `make docx` builds a MS Word copy, ((though these binary files aren't stored in the git repository)) and `make github` the copy that displays with images on Github.

The links in this post point to what is an active draft of a little manuscript at the time of this writing.  In addition to making the final result reproducible, Github captures the [provenance](http://en.wikipedia.org/wiki/Provenance#Data_provenance) or history of the research and writing process.  It's not a perfect system, but it's a nice step.

