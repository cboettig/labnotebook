---
comments: true
date: 2011-02-25 14:36:16
layout: post
slug: phylo-luke-harmon
title: 'Phylo: Luke Harmon'
redirects: [/wordpress/archives/1108, /archives/1108]
categories:
- evolution
tags: 
- seminar
---

My notes on Luke Harmon's excellent talk on [Phyloseminar](http://phyloseminar.org/) this morning.  See the [recording](http://phyloseminar.org/recorded.html) of Luke's actual talk to know what he said, below are my thoughts and notes to myself having watched the talk.

Luke summarizes his goal rather nicely as:


> Analyzing the data that people actually have to answer the questions they actually want to know


For him, this focuses on incomplete trees and non-Brownian models.   Two of the three methods he discussed cover incomplete trees, two use BM and one doesn't care about character evolution to begin with.  All use the birth-death model of speciation, despite the worrying assumption that species are, on average, increasing exponentially.  Despite the tally, I'm pretty excited about the methods proposed (well, the second two), because they move us in that direction with a decent expression of the uncertainty resulting from the data people actually have (by virtue of being Bayesian.  Not that you have to be Bayesian to do this, but somehow bootstrapping and confidence intervals don't seem standard practice in implementation of comparative methods in Frequentist quantities, while the Bayesian ones always show you the posteriors.)




## Medusa & Fossil Medusa




### Medusa


Dealing with incomplete trees: Rabosky et al 2007(Rabosky _et. al._ 2007) incomplete trees partition the likelihood:

$ \log L = \log L_p + \log L_t $

phylogenetically resolved, taxonomic (unresolved part of the tree).  Calculate the likelihood of the birth-death parameter values on the _T_ unresolved parts of the tree (where the _i_th clade has $ n_i$ taxa) simply as:

$$ \log L_t = \sum_{i=1}^T \log(1-\beta_i) + \sum _{i=1}^T(n_i -1)\log \beta_i$$

where

$$ \beta_i = \frac{\exp(rt_i)-1}{exp(rt_i) - a}$$

where _a_ is the extinction fraction (death rate over birth rate) and _r_ the diversification rate (birth rate minus death rate).

Stepping through the tree proposing and accepting/rejecting rate shifts by AIC: uses a rule-of-thumb difference of 4 AIC units.  Luke suggests larger trees should use a larger difference.  Obviously I'd prefer something more concrete given the poor performance AIC [tends to have in ](http://www.carlboettiger.info/archives/635)other comparative approaches.


### Fossil Medusa


Luke asks us: so what if we know that there were more extinct taxa at one point than are represented by $ n_i$ tip taxa? The expectation under the birth death model is that of exponential growth in total number of species.  (Since we are using the birth-death model, this outcome is still possible, and indeed is included in the probability above.  Because it is very unexpected outcome, it contributes rather little to that probability though.)

We could make this observation more probable by assuming that at some point the diversification rate shifted around the time of this observation, either slowing down or even resulting in a net extinction rate.  _**Fossil Medusa **_does this by estimating different the likelihood of getting up to the $ m_i$ extinct taxa by the observed time, and then letting it assume a new rate to get to the $n_i$ present-day taxa starting with $ m_i$ taxa[ref]Must require a new equation to have starting condition that isn't a single species: should be a simple rescaling.[/ref]

This seems strange to me-- The location of this shift is placed by the fossil dates, there is no reason to believe it couldn't have occurred earlier or later.  This is worrisome as rate estimates depend strongly on branch length.  Second, we have to justify that the fossils of lost species still have a common ancestor at the beginning of this unresolved clade.  Does this require that the $ m_i$ extinct taxa actually all co-occur at the given time, or just existed somewhere in the interval?  Certainly the former seems to be the assumption of the method, but may be hard to establish in the data(?)

Luke observes that typical birth death estimates result in zero extinction estimates. because it reduces uncertainty and makes the data more probable, and that models lack density dependence sensu Dan Rabosky's recent work (Rabosky & Glor, 2010)

Luke also observes the multiple comparisons issue inherent in the Medusa approach.


## Auteur


[Jon Eastman](http://www.wsu.edu/~storfer/eastman/) has implemented a RJMCMC (see(GREEN, 1995)) of multiple diversification rates on phylogenetic tree.  Assumes Brownian motion and a tree known without error etc etc but seems like a fantastic step forward to me.  As a reversible jump model, it allows proposals of split and merge events where the diversification rate can change on the tree.  This moves us away from the rather problematic requirement to compare "painted" trees, or propose diversification rate relative to an inferred ancestral history of another discrete trait (which is interesting if that's the hypothesis, and can be integrated over the stochastic character mappings -- but it requires such a trait whose history motivates the rate shifts, which is rather restrictive!).

Note: this seems to be similar to the spirit of Liam's MCMC method for rate variation; see for the [description](http://phytools.blogspot.com/2011/02/mcmc-method-for-rate-variation.html) on his development blog.


## MECCA


[Graham Slater's](http://www.eeb.ucla.edu/gradstudents/slater/Graham/Graham_J_Slater.html) ABC approach in which unresolved clades are simulated by birth-death process.  Gives posterior distributions on parameter estimates.  Can be applied to differences in diversification rates.  I think the particularly innovative thing here is in testing the ability of an ABC approach (Csilléry _et. al._ 2010) to get us out of the challenge of missing taxa in a meaningful, model-driven way.  I'm actually rather nervous about ABC when it hinges on a set of parameters that are rather far from being sufficient statistics.  The probability of the birth-death rates depends very strongly on the number of taxa, and very weakly on the topology, so it's a rather weak way to fill in the missing topology.

Essentially this can be seen as a correction to diversification rate estimates in the following sense.  Treating the clade as an unresolved polytome would underestimate diversification rates, because it gives longer time of independent drift for traits to diversify.  Forcing a birth-death tree structure makes a rather twiggy tree to replace the unresolved section, which results in an estimate of diversification rate $ \sigma$ that will be much higher, and probably an overestimate relative to any density-dependent tree structure.


## Closing


At the end a mention of a couple other new directions that I agree are dead on.  Traits connected to diversification rates, as in recent work from  FitzJohn and Sally Otto's group at UBC(FitzJohn _et. al._ 2009),(FitzJohn, 2010). -- very interesting, but as Luke points out, a great way to make your trait estimates really susceptible to the missing taxa problem.  (Luke answers a seminar question on the impact of missing taxa -- Brownian diversification rate isn't very sensitive to this, while things that depend directly on predicting number of species, such as birth and death rates, are hugely effected).

Also mentions  Dan Rabosky concerns over estimations in rates (Rabosky, 2010).  I couldn't agree more that realistic diversification models are crucial.



## References


- Rabosky D, Donnellan S, Talaba A and Lovette I (2007).
"Exceptional Among-Lineage Variation in Diversification Rates During The Radiation of Australia'S Most Diverse Vertebrate Clade."
*Proceedings of The Royal Society B: Biological Sciences*, **274**.
ISSN 0962-8452, <a href="http://dx.doi.org/10.1098/rspb.2007.0924">http://dx.doi.org/10.1098/rspb.2007.0924</a>.

- Rabosky D and Glor R (2010).
"From The Cover: Equilibrium Speciation Dynamics in A Model Adaptive Radiation of Island Lizards."
*Proceedings of The National Academy of Sciences*, **107**.
ISSN 0027-8424, <a href="http://dx.doi.org/10.1073/pnas.1007606107">http://dx.doi.org/10.1073/pnas.1007606107</a>.

- GREEN P (1995).
"Reversible Jump Markov Chain Monte Carlo Computation And Bayesian Model Determination."
*Biometrika*, **82**.
ISSN 0006-3444, <a href="http://dx.doi.org/10.1093/biomet/82.4.711">http://dx.doi.org/10.1093/biomet/82.4.711</a>.

- Csilléry K, Blum M, Gaggiotti O and François O (2010).
"Approximate Bayesian Computation (Abc) in Practice."
*Trends in Ecology &amp; Evolution*, **25**.
ISSN 01695347, <a href="http://dx.doi.org/10.1016/j.tree.2010.04.001">http://dx.doi.org/10.1016/j.tree.2010.04.001</a>.

- FitzJohn R, Maddison W and Otto S (2009).
"Estimating Trait-Dependent Speciation And Extinction Rates From Incompletely Resolved Phylogenies."
*Systematic Biology*, **58**.
ISSN 1063-5157, <a href="http://dx.doi.org/10.1093/sysbio/syp067">http://dx.doi.org/10.1093/sysbio/syp067</a>.

- FitzJohn R (2010).
"Quantitative Traits And Diversification."
*Systematic Biology*, **59**.
ISSN 1063-5157, <a href="http://dx.doi.org/10.1093/sysbio/syq053">http://dx.doi.org/10.1093/sysbio/syq053</a>.

- Rabosky D (2010).
"Primary Controls on Species Richness in Higher Taxa."
*Systematic Biology*, **59**.
ISSN 1063-5157, <a href="http://dx.doi.org/10.1093/sysbio/syq060">http://dx.doi.org/10.1093/sysbio/syq060</a>.
