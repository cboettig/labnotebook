---
title: Collected notes from past few days
subtitle: some writing, some exchange on prosecutor's fallacy, some ropensci, etc
layout: post
category: ecology
tags:
- prosecutor
- warning-signals
- ropensci
- nonparametric-bayes 

---

## Friday

* some ropensci coordination 
* Adapt basic science abstract and broader impacts statement
* some writing on notebook features draft
* nonparametric writing!

## Monday

* nonparametric-bayes writing. Combining my generic position piece ([beyond-mechanistic-models.Rmd](https://github.com/cboettig/nonparametric-bayes/tree/master/inst/doc/beyond-mechanistic-models.Rmd)) with the technical nonparametric-bayes writeup ([nonparametric-bayes.Rmd](https://github.com/cboettig/nonparametric-bayes/tree/master/inst/doc/nonparameteric-bayes.Rmd)) to get a more general-audience paper.  
* ropensci reviewing
* Note: annoying feature of knitr's `purl`: appears to generate valid "external" knitr code, but includes all options in comment headers instead of just the chunk names.  This prevents "external" inclusion from identifying these chunks currectly.  `tangle` (option in `knit`) appears not to generate any header at all.  Maybe I'm missing something.  

### Prosecutor's Fallacy Comments

* Further exchanges with John over prosecutors fallacy.  Some scratch writing for a potential [reply piece]().  

Our discussion highlighted two potential test cases that would further demonstrate (or refute) that the critical slowing down we observed is an artifact -- our ability to detect it in cases that do not transition (e.g. population of all cases reaching a certain excursion) in the original dynamics, and our ability to detect it in scenarios that do not involve transition dynamics at all.  Running these two cases as
 
* [comment.Rmd](https://github.com/cboettig/earlywarning/tree/prosecutor/inst/examples) -- repeat the analysis using a generic threshold deviation rather than only populations that have crashed.  
* [beer.Rmd](https://github.com/cboettig/earlywarning/tree/prosecutor/inst/examples) -- repeat analysis in which there is only a single stable point.  

ugh, looks like libraries on zero haven't been kept up.  Some delays before production code will be running.  


## Tuesday

* More writing
* Assemble material for applied math club.  Going with particle filtering  (<span rel="tooltip" title="Ionides E, Breto C and King A (2006). Inference For Nonlinear Dynamical Systems. _Proceedings of The National Academy of Sciences_, *103*. ISSN 0027-8424, http://dx.doi.org/10.1073/pnas.0603181103."><a href="http://dx.doi.org/10.1073/pnas.0603181103" rel="http://purl.org/spar/cito/discusses" >Ionides _et. al._ 2006</a></span>)
 and the `pomp` vignette
* ropensci reviewing

### Misc

* Sounds like exciting stuff happening a the #btpdf2 conference 


