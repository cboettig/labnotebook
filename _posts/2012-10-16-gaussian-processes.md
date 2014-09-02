---
layout: post
title: Gaussian processes
category: ecology
tags: nonparametric-bayes

---

* Great methods tutorial/overview with Steve.  Now getting up to speed on background reading in both Gaussian processes and embedding dimensions.  
* Will also want to look into basis approximations for SDP acceleration.  

## Gaussian Processes

* New project, New tag: nonparametric-bayes, and [associated github repostitory](https://github.com/cboettig/nonparametric-bayes)

### Reading

* Rasmussen & Williams (2006) 2nd ed, [full text avialable online](http://www.GaussianProcess.org/gpml). read Ch 1 & 2.

> Can be thought of as a Bayesian version of Support Vector Machines

Who knew?  Working through basic regression scenarios.  

Also reading:

* Deisenroth, M. P., Rasmussen, C. E., & Peters, J. (2009). Gaussian process dynamic programming. Neurocomputing, 72(7-9), 1508-1524. doi:10.1016/j.neucom.2008.12.019
* Kocijan, J., & Girard, A. (2005). Dynamic systems identification with Gaussian processes. … of Dynamical Systems. doi:10.1080/13873950500068567
* Turner, R. (2010). State-space inference and learning with Gaussian processes. Proceedings of 13th …, 868-875. 



### R support:

* [gausspr](http://rss.acs.unt.edu/Rdoc/library/kernlab/html/gausspr.html), see also the [package vignette](http://cran.at.r-project.org/web/packages/kernlab/vignettes/kernlab.pdf) (From the core team, probably a reasonable starting point).
* [gptk](http://cran.r-project.org/web/packages/gptk/) (crude choice, poor software development practices)
* [mlegp](http://cran.r-project.org/web/packages/mlegp/vignettes/mlegp.pdf)
* [manually](http://www.r-bloggers.com/gaussian-process-regression-with-r/) (e.g. for learning rather than performance)

## Embedding dimensions

* [Taken's Theorem](http://en.wikipedia.org/wiki/Takens'_theorem) But how about the stochastic case?
* Convergent cross-mapping paper, [Sugihara et al. 2012](http://dx.doi.org/10.1126/science.1227079), recently in *Science*.  
* Stochastic Takens: perhaps see [Stark et al 2003](http://www.ucl.ac.uk/cnda/about/papers/Random_Embed.pdf), doi:10.1007/s00332-003-0534-4 

## rOpenSci

* Checked `ritis`, Scott submitted to CRAN
* More requests for increased functionality on `rfishbase`
* Contact with Roy about developing an API for FishBase.  Contacted Deng
* `httr` 0.2 is on CRAN! Updated `rfigshare` dependency, plan to release soon.  


## Notebook 

* Contacted Ben about documentation and use of EML.  
* Posted updated semantic notebook 
* Hmm, FOAF person types don't seem to contain enough data to be valid Person objects according to Google Rich Snippets.  Unfortunately this cannot be easily solved by [mixing "Person" types](http://answers.semanticweb.com/questions/19200).  Note that [Dublin Core and FOAF agree](http://answers.semanticweb.com/questions/3667/can-dctermsrightsholder-be-used-with-foafperson) on what a person/agent is, but it seems data-vocabulary.org rdf does not? 
* Tools for discovery and navigating ontologies? http://www.ebi.ac.uk/ontology-lookup/
