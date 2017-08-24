---
comments: true
date: 2011-03-19 11:07:50
layout: post
slug: approximate-bayesian-hpc-abc-methods
title: Approximate Bayesian Computing (algorithms) methods
redirects: [/wordpress/archives/1221, /archives/1221]
categories:
- evolution
---

[Erick Matsen ](http://matsen.fhcrc.org/) asked me about the question at the end of Luke Harmon's phyloseminar critiquing Approximate Bayesian Computing ABC methods.  The question wasn't any more specific, though Luke recognized the paper.  Searching the literature didn't turn anything up, asking [Leo](http://www.mendeley.com/profiles/leonardo-de-oliveira-martins/) through the [MCMC group](http://www.mendeley.com/groups/517931/bayesian-mcmc/) on Mendeley I think this is the paper:

﻿Robert, C.P. et al. Lack of confidence in ABC model choice. _PNAS_ **I**, 8(2011). ([arXiv](http://arxiv.org/abs/1102.4432))

Seems a more pointed critique to ABC then Templeton's discussion (Templeton, 2010) particularly as the lead author is a critic of Templeton (Berger _et. al._ 2010).

At first I thought this would be a relatively intuitive argument that the method is often applied when we lack appropriate sufficient statistics for models.  Of course it comes down to a question of sufficient statistics, but the result is somewhat stronger,


> a straightforward proof that a model-wise sufficient statistic is usually not sufficient across models, i.e. for model comparison.  An immediate corollary is that the ABC-MC approximation does not converge to the exact Bayes factor.


Hence the emphasis on model choice in the title -- lacking sufficient statistics for the particular model would obviously impact posterior density estimation even within models.

There's some rather excellent discussion of these issues on [Christian Robert's blog](http://xianblog.wordpress.com/2011/03/08/error-in-abc-versus-error-in-model-choice/), again thanks to Leo for pointing me to this, still some more reading to do on this before we here more about ABC from Brian O'Meara on [phyloseminar](http://phyloseminar.org/) next week.


### Update


Dan Lawson (comments below) drew my attention to another paper treating this problem of model-wise sufficient statistics Didelot _et. al._ 2011.  The authors propose a potentially straight-forward work-around: define a model M in which both the original models M1 and M2 are embedded.  They then demonstrate for exponential family models that sufficient statistics for M are sufficient statistics for comparing M1 and M2 by Bayes factors, if I've followed the argument correctly.  I'll try to work out an example in a phylogenetics context in the notebook when I get a chance.


### Further reading


Search also led me to stumble across two nice books applying this in R.

Robert, C.P. & Casella, G. _Introducing Monte Carlo Methods with R (Use R)_. 284 (Springer Verlag: 2009), ([Amazon link](http://www.amazon.com/Introducing-Monte-Carlo-Methods-Use/dp/1441915753))

﻿Albert, J. _Bayesian Computation with R (Use R)_. 300 (Springer: 2009). ([Amazon link](http://www.amazon.com/Bayesian-Computation-R-Use/dp/0387922970)).





## References


- Templeton A (2010).
"Coherent And Incoherent Inference in Phylogeography And Human Evolution."
*Proceedings of The National Academy of Sciences*, **107**.
ISSN 0027-8424, <a href="http://dx.doi.org/10.1073/pnas.0910647107">http://dx.doi.org/10.1073/pnas.0910647107</a>.

- Berger J, Fienberg S, Raftery A and Robert C (2010).
"Incoherent Phylogeographic Inference."
*Proceedings of The National Academy of Sciences*, **107**.
ISSN 0027-8424, <a href="http://dx.doi.org/10.1073/pnas.1008762107">http://dx.doi.org/10.1073/pnas.1008762107</a>.



-  Likelihood-Free Estimation of Model Evidence, Xavier Didelot, Richard G. Everitt, Adam M. Johansen, Daniel J. Lawson,  (2011) *Bayesian Analysis*, **6**    [10.1214/11-BA602](http://dx.doi.org/10.1214/11-BA602)
