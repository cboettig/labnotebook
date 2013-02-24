---
comments: true
date: 2011-03-30 20:52:04
layout: post
slug: brian-omeara-discusses-new-abc-approaches-on-phylo
title: Brian O'Meara discusses new algorithms approaches on Phylo
redirects: [/wordpress/archives/1329, /archives/1329]
categories:
- evolution
tags:
- algorithms
- seminar
---

Brian gave an excellent overview of Approximate Bayesian Computing (ABC) and described the TreEvo software he is developing with post-doc Barb Banbury. My notes from the seminar, with my own comments _italics_ and  a few added references


### Intro / Motivation





	
  * Rates of model innovation is rather slow

	
  * Can be impossible to specify in closed form (can't specify median of binomial in closed form)

	
  * Perhaps it would be faster if we didn't have to wait for someone to come up with all the likelihood functions




### Reviews ABC method:





	
  * Simulate

	
  * Define a summary statistic

	
  * Define a "success" -- distance metric on summary statistic: Acceptance-Rejection Sampling




### Sufficient statistics





	
  * (examples from coin flip: actual string of HT, proportion of heads.  not sufficient: previous toss)

	
  * Problems: when there are no sufficient stats?

	
  * Haven't proven sufficiency?


O'Meara's approach: take 22 summary stats and prune the list (all the kinds of model parameters geiger will give you -- lambda, kappa, etc.) -- _No way that lambda/kappa/etc are decent summary stats, some of these will even have identifiability issues on certain topologies.  What about correlation among summary stats?_

Following Wegman et al, (Guessing the citation for this is (Wegmann _et. al._ 2009)) Box-Cox transformation ahead of time. _Not clear to me what the justification for this is.  Transformations are evolutionary hypotheses. What's is the biology?_

Describes **Sequential Monte Carlo**:
Start by sampling from prior with liberal acceptance.  Update a posterior estimate as the new prior, and repeat.



	
  * New Models: Bounded models, discrete models such as autoregressive, character displacement models, etc.

	
  * Priors: uses a library of a few common distributions.  Discusses influence of different priors, priors with zero probability ranges.

	
  * Examples: character displacement (non-independent evolution on branches) & bounded side

	
  * Super concerned about identifiability issues, let alone sufficient statistics.

	
  * Some results look close to prior.


O'Meara on parameter estimation vs model selection:  "Tells you more about your power than your biology."  Hmm...


### Challenges


Mention of Robert et al. (Robert _et. al._ 2010), and [preprint](http://arxiv.org/abs/1102.4432). Concerns on sufficient statistics.



	
  * Discusses examples of ways to fail: too little data, get the prior back

	
  * Overconfidence: Run different times, each gets tight, mostly non-overlapping distributions of a parameter back.




### Features





	
  * Auto-tuning: runs enough generations and then stops.

	
  * Plotting results

	
  * Model menagerie

	
  * multiple character models coming soon




### In progress:





	
  * check-pointing (restart partial runs, needed for large cluster runs to be able to restart killed/crashed runs)

	
  * speed optimization

	
  * testing testing testing




### Advantages/Disadvantages





	
  * No model adequacy assessment yet

	
  * Usual plus/minus of Bayesian (priors, computational time, etc)




### More resources





	
  * Brian recommends the Csillery et al TREE review on ABC (Csilléry _et. al._ 2010)

	
  * The project is a Google summer of code option

	
  * Brian mentions [post-doc](http://www.brianomeara.info/lab) and other opportunities.

	
  * No release candidate on software yet, but Brian welcomes exploring the actively developed code on R-forge: [Treevo](https://r-forge.r-project.org/projects/treevo/)




[Watch the talk](http://evo.caltech.edu/evoBeta/player/EVOPlayer.jnlp?fileToPlay=http://phyloseminar.org/recorded/012_omeara.evx)

## References


- Wegmann D, Leuenberger C and Excoffier L (2009).
"Efficient Approximate Bayesian Computation Coupled With Markov Chain Monte Carlo Without Likelihood."
*Genetics*, **182**.
ISSN 0016-6731, <a href="http://dx.doi.org/10.1534/genetics.109.102509">http://dx.doi.org/10.1534/genetics.109.102509</a>.

- Robert C, Mengersen K and Chen C (2010).
"Model Choice Versus Model Criticism."
*Proceedings of The National Academy of Sciences*, **107**.
ISSN 0027-8424, <a href="http://dx.doi.org/10.1073/pnas.0911260107">http://dx.doi.org/10.1073/pnas.0911260107</a>.

- Csilléry K, Blum M, Gaggiotti O and François O (2010).
"Approximate Bayesian Computation (Abc) in Practice."
*Trends in Ecology &amp; Evolution*, **25**.
ISSN 01695347, <a href="http://dx.doi.org/10.1016/j.tree.2010.04.001">http://dx.doi.org/10.1016/j.tree.2010.04.001</a>.
