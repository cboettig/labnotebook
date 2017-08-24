---
comments: true
date: 2012-01-19 14:10:49
layout: post
slug: is-your-phylogeny-informative
title: Is your phylogeny informative?
redirects: [/wordpress/archives/3670, /archives/3670]
categories:
- evolution
tags:
- my-publications
- R
- research-blogging
---

Yesterday my paper (Boettiger _et. al._ 2012)  appeared in early view in Evolution ([author's preprint](http://www.mendeley.com/download/public/98752/4485545655/9a209c7dd29980fd2e47c06eb8b2d1d7dd6f70d4/dl.pdf)),As the open access copy doesn't appear on pubmed for a while, you can access my author's copy [here](http://www.mendeley.com/download/public/98752/4485545655/9a209c7dd29980fd2e47c06eb8b2d1d7dd6f70d4/dl.pdf). so I'd like to take this chance to share the back-story and highlight my own view on some of our findings, and the associated [package on CRAN](http://cran.r-project.org/web/packages/pmc/index.html).Just submitted, meanwhile, the code is always on [github](https://github.com/cboettig/pmc).

I didn't set out to write this paper.  I set out to write a very different paper, introducing a new phylogenetic method for continuous traits that estimates changes in evolutionary constraint.  This adds _even more _parameters than already present in rich models multi-peak OU process, and I wanted to know if it could be justified -- if there really was enough information to play the game we already had, before I went and made the situation even worse.  Trying to find something rigorous enough to hang my hat on, I ended up writing this paper.  


### The short of it


There's essentially three conclusions I draw from the paper.



	
  1. AIC is not a reliable way to select models.

	
  2. Certain parameters, such as $\lambda$, a measure of "phylogenetic signal," (Pagel, 1999) are going to be really hard to estimate.

	
  3. BUT as long as we _simulate extensively_ to test model choice and parameter uncertainty, we won't be misled by either of these.  So it's okay to drink the koolaid (Losos, 2011), but **drink responsibly.
**




### A few reflections


I really have two problems with AIC and other information criteria when it comes to phylogenetic methods.  One is that it's too easy to simulate data from one model, and have the information criteria choose a ridiculously over-parameterized model instead.  In one example, the wrong model has a $\Delta$AIC of 10 points over the correct model.

But a more basic problem is that it's just not designed for hypothesis testing -- it doesn't care how much data you have, it doesn't give a notion of significance.  If we're ascribing biological meaning to different models as different hypotheses, we need want a measure of uncertainty.

When estimating parameters that scale branch length, I think we must be cautious because these are really data-hungry, and don't work well on small trees. Check out how few of these estimates of lambda on 100 replicate datasets hit near the correct value shown by vertical line:

![](http://farm8.staticflickr.com/7014/6727029515_bcfe58aedb_o.png)


The package commands are explained in more detail in the **[ package vignette](http://cran.r-project.org/web/packages/pmc/vignettes/pmc_tutorial.pdf)**, but the idea is simple. Running the pmc comparison between two models (for the model-choice step) looks like this:


```r
bm_v_lambda <- pmc(geospiza.tree, geospiza.data["wingL"],
  "BM", "lambda", nboot=100)
```


Extracting the distribution of estimates for the parameter lambda got from fitting the lambda model (B) to data made by simulating under lambda model (A):


```r
lambdas <- subset(bm_v_lambda["par_dists"],
  comparison=="BB" & parameter=="lambda")
```


To view the model comparison, just plot the pmc result:


```r
plot(bm_v_lambda)
```


The substantial overlap in the likelihood ratios after simulating under either model indicate that we cannot choose between BM and lambda in this case.  I'll leave the paper to explain this approach in more detail, but it's just simulation and refitting.

![](http://farm8.staticflickr.com/7026/6727293465_4a2a545fdf_o.png)


You could just bootstrap the likelihoods or for nested models, look at the parameter distributions, but you get the maximum _statistical power_ from the ratio (says Neyman-Pearson Lemma).




### A technical note: mix and match formats


Many users don't like going between ouch format and ape/phylo formats. The pmc package doesn't care what you use, feel free to mix and match. In case the conversion tools are useful, I've provided functions to move your data and trees back and forth between those formats too.  See _format_data()_ to data-frames and _convert()_ to toggle between tree formats.


## Reproducible Research


The package is designed to make things easier.  It comes with a vignette (written in sweave) showing just what commands to run to replicate the results from the manuscript.

This entire project has been documented in my open lab notebook from its [inception](http://openwetware.org/wiki/User:Carl_Boettiger/Notebook/Comparative_Phylogenetics/2010/02/07). Posts prior to October 2010 can be found on my [OWW notebook](http://openwetware.org/wiki/User:Carl_Boettiger/Notebook/Comparative_Phylogenetics/2010), the rest in my current [phylogenetics notebook](http://www.carlboettiger.info/archives/category/phylogenetics) (here on wordpress). Of course this project is interwoven with many notes on related and more recent work.



##  Additional methods and feedback 


As we discuss in the paper, simulation and randomization-based methods have an established history in this field(Freckleton & Harvey, 2006), (Harmon _et. al._ 2010).  These are promising things to do, and we should do them more often, but I might make a few comments on these approaches.  

We are not getting a real power test when we simulate data produced from different models whose parameters have been arbitrarily assigned, rather than estimated on the same data, lest we overestimate the power.  Of course we need to have a likelihood function to be able to estimate those parameters, which is not always available.    

It is also common and very useful to assign some summary statistic whose value is expected to be very different under different models of evolution, and look at it's distribution under simulation.  This is certainly valid and has ties to cutting edge approaches in ABC methods, but will be less statistically powerful than if we can calculate the likelihoods of the models directly and compare those, as we do here.  




Boettiger, C., Coop, G., & Ralph, P. (2012). IS YOUR PHYLOGENY INFORMATIVE? MEASURING THE POWER OF COMPARATIVE METHODS Evolution DOI: [10.1111/j.1558-5646.2012.01574.x](http://dx.doi.org/10.1111/j.1558-5646.2012.01574.x)



## References


- Boettiger C, Coop G and Ralph P (2012).
"is Your Phylogeny Informative? Measuring The Power of Comparative Methods."
<em>Evolution</em>.
<a href="http://dx.doi.org/10.1111/j.1558-5646.2012.01574.x">http://dx.doi.org/10.1111/j.1558-5646.2012.01574.x</a>.

- Pagel M (1999).
"Unknown."
<em>Nature</em>, <b>401</b>.
ISSN 00280836, <a href="http://dx.doi.org/10.1038/44766">http://dx.doi.org/10.1038/44766</a>.

- Losos J (2011).
"Seeing The Forest For The Trees: The Limitations of Phylogenies in Comparative Biology."
<em>The American Naturalist</em>, <b>177</b>.
ISSN 00030147, <a href="http://dx.doi.org/10.1086/660020">http://dx.doi.org/10.1086/660020</a>.

- Freckleton R and Harvey P (2006).
"Detecting Non-Brownian Trait Evolution in Adaptive Radiations."
<em>Plos Biology</em>, <b>4</b>.
ISSN 1544-9173, <a href="http://dx.doi.org/10.1371/journal.pbio.0040373">http://dx.doi.org/10.1371/journal.pbio.0040373</a>.

- Harmon L, Losos J, Jonathan Davies T, Gillespie R, Gittleman J, Bryan Jennings W, Kozak K, McPeek M, Moreno-Roark F, Near T, Purvis A, Ricklefs R, Schluter D, Schulte II J, Seehausen O, Sidlauskas B, Torres-Carvajal O, Weir J and Mooers A (2010).
"Early Bursts of Body Size And Shape Evolution Are Rare in Comparative Data."
<em>Evolution</em>.
<a href="http://dx.doi.org/10.1111/j.1558-5646.2010.01025.x">http://dx.doi.org/10.1111/j.1558-5646.2010.01025.x</a>.
