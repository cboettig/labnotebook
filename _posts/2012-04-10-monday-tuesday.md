---
comments: true
date: 2012-04-10 23:09:06
layout: post
slug: monday-tuesday
title: Monday / Tuesday
redirects: [/wordpress/archives/4437, /archives/4437]
categories:
- ecology
tags: 
- ropensci
- workflow
- warning-signals
- wrightscape
---



* rfishbase updated to Duncan's feedback
* writing intro section on Prosecutor's Fallacy.
* wrightscape update project repository. Scripts mostly in demos, results in notebook. Notebook makes is easy to get the most recent writeup on the topic, from where I can start to track back the history, but doesn't provide a good at-a-glance view of the analyses I've run side-by-side.  Moving the R script `demos/` into markdown knitted files in `inst/examples/` and rerunning.  [See directory](https://github.com/cboettig/wrightscape/blob/master/inst/examples).  
* Files that require cluster computation won't be able to upload graphs directly.  Should separate these scripts from their respective plotting scripts.  

## Working examples



* Have labrid_data, labrid_mc, focal_examples, simulated_release working.  [See directory](https://github.com/cboettig/wrightscape/blob/master/inst/examples).  Running the direct model comparisons on the other traits.  


## Data management

* Trying out the API for [thedatahub.org](http://thedatahub.org) for storing data. Starting with the python tool, some difficulty getting this running. [Detailed issue log](https://github.com/okfn/dpm/issues/55)
* Also put in form to get www hosting through NERSC.  
* Meanwhile, am just tossing data into the [webserver](http://two.ucdavis.edu/~cboettig/data/) running on our local lab computers.  This just provides a home for the data so I don't have binary files on github -- the metadata for these objects is handled by the [README that lives with the code](https://github.com/cboettig/wrightscape/tree/master/inst/examples).  
* For large data files (which I'm not generating in these codes) the clear way forward is storage you can send the computation to, rather than downloading.  For above solutions work for users of our cluster, or of NERSC, but for a more general audience AmazonS3 is the obvious choice (though involves monthly fees).  Looks like there is already a good way to put this into my workflow using `RAmazonS3`



First install libraries for Ubuntu:

```bash

sudo apt-get install libmime-base64-urlsafe-perl libdigest-hmac-perl libdigest-sha1-perl

```

Then install

```r
install.packages("RAmazonS3", repo="http://www.omegahat.org/R")
```

And then we're ready to roll.  [See Duncan's tutorial](http://www.omegahat.org/RAmazonS3/s3amazon.html)



Will consider a tutorial for this + maybe Segue for [Duncan's seminar](http://statcomputingucdavis.github.com/Spring12BBSeminar/).  (Note that Duncan's moved lots of omegahat.org onto github, which we'll be using for all the class content.)



## Reading

  * [Adaptive Management Conference Series](http://www.phidot.org/AMCS/participants/index.html)
  * [PLoS direct submission to wiki](http://wir.okfn.org/2012/03/29/plos-computational-biology-goes-wiki/)
  * [Tom Preston-Werner talk](https://plus.google.com/117538137308310530361/posts/LviS2eofpon)
  * [Open CPU](http://opencpu.org/2012/01/running-a-block-of-r-code-in-opencpu/)
  * Humans aren't good random number generators.  [uniform frequency example](http://www.khanacademy.org/labs/explorations/frequency-stability) and [game in which a machine-learning algorithm exploits your non-randomness](http://seed.ucsd.edu/~mindreader/)

## Misc





modify knitr hook for formatting inline code, e.g.

```r

knit_hooks$set(inline = function(x) {
 prettyNum(round(x,2), big.mark=",")
})

```


  * [Avoid knitr displaying X11 during interactive runs](https://github.com/yihui/knitr/issues/192)
  * [Refresh cache](https://github.com/yihui/knitr/issues/191)

