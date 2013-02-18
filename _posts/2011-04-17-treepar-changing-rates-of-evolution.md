---
comments: true
date: 2011-04-17 18:11:46
layout: post
slug: treepar-changing-rates-of-evolution
title: 'TreePar: changing rates of evolution'
redirects: [/wordpress/archives/1423, /archives/1423]
categories:
- evolution
---

## Review & Comments on Article


T. Stadler's article _Mammalian phylogeny reveals recent diversification rate shifts_ (Stadler, 2011) describes her new TreePar package, evaluating shifts in the mammalian phylogeny (from and analyzed by (Bininda-Emonds _et. al._ 2007)) as an example.

The heart of the article is the calculation of the likelihood for a branching process model with rate shifts at specified times.  This approach is dramatically more powerful and less susceptible to spurious conclusions than the earlier approach of looking for a shift in slope in the lineage-through-time (LTT) plot.

Tanja presents a verbal argument for how the slope-shift may be misled, by confusing a 'pull of the present' rate shift (at about $ 1/(\lambda-\mu)$) for a shift in rates.   Consider a birth-death model where extinction rate turns off at time T.  Just before T, we have a slope of $\lambda$ due to the "pull of the present."  After T we have a real rate shift, where extinction is zero.  She argues that the slopes method would mistake this for two separate shifts, though I'm unconvinced that the soft shift would really be mistaken as a rate shift (if there is even power to detect the shift, it's not a sharp transition like a true rate change).  Despite this qualm, the likelihood method is certainly an improvement over the slope change, so it's great to see a likelihood method stepping into this place.

One subtlety of the likelihood maximization is that the numerical algorithm cannot actually handle the simultaneous optimization of _n_ transitions in rates.  To work around this, Tanja uses the following greedy algorithm: estimate the location of a shift under a one-shift model, then fix this time to estimate the location of the next shift.

To demonstrate that this is not necessarily the maximum likelihood, it is sufficient to demonstrate that the maximum-likelihood estimated location of a single shift is not equal to the maximum-likelihood estimate of either shift estimated in a two-shift model.  To prove this as simply as possible, consider a pure birth process: $ \lambda_1, \lambda_2, \lambda_3$, where shifts occur at times $ t_1, t_2$.  The lineage-through-time (log expected species count vs time) is a piecewise linear function with two change points.  If the change in each birth rate is monotonic, than the single change-point estimate will always choose a time intermediate to the two change-point estimates, such that the greedy algorithm will not find the maximum likelihood solution.  I believe one can also create identifiability issues of the optimum single change-point estimate in a two rate model, have to work this through more carefully though.  Less of a concern is that the locations of the shifts are restricted to a coarse grid, such that only a few different time points are actually tried.

Tanja does an excellent job of testing the method in the supplement.  My primary concern here is that all tests of robustness and confidence intervals of the method are done for the rather large mammalian phylogeny, and will not appear nearly so robust when users apply the analysis to smaller trees but do not repeat all of the simulation tests Tanja does in the original paper.  These tests are an excellent roadmap for how to do an analysis, but they are data-specific, and I feel the approach should not be used without repeating these tests on the data in question.  This also seems like an excellent exercise for the user, I'll try and write this code out shortly for some simulated examples.

Tanja's treatment allows for mass extinctions, which occur at estimated time-points, though Tanja has elsewhere shown that mass extinctions cannot be distinguished from models with constant speciation and extinction punctuated by stasis on the basis of extant taxa alone (Stadler, 2011), so I am unclear about the significance of their inference.  No such events are inferred in the example, and her code allows this feature to be turned off.

Tanja's implementation also treats partial sampling, an issue she has also addressed elsewhere (Hartmann _et. al._ 2010).

I hope I haven't seemed too critical here.  This is the first time I've really looked over Tanja's work and it seems to be of the highest caliber.  I do worry about the non-MLE estimates of the time due to the stepwise nature of the algorithm.


## Code: exploring TreePar




### First impressions:





	
  * TreePar code: Pure R (no src, no external dependencies).  Looks  clean but uncommented.  No object-oriented design/classes.  Does not  appear to follow style guide.  Debugging and error checks by print  statements (rather than error() and warning()), but at least performs  the checks.

	
  * Reasonably functionalized (18 functions in separate files support 2  user-called functions (in NAMESPACE): bd.shifts.optim(),  bd.densdep.optim().

	
  * Functions look reasonably documented, including examples code.  Examples run fine.

	
  * OOooh very exciting: bd.densdep is a proper density dependent model  with logistic birth and constant extinction (formerly Rabosky tested a  logistic birth but no extinction model).  No mention of this that I saw in the paper though(?) 




## References


- Stadler T (2011).
"Mammalian Phylogeny Reveals Recent Diversification Rate Shifts."
*Proceedings of The National Academy of Sciences*, **108**.
ISSN 0027-8424, <a href="http://dx.doi.org/10.1073/pnas.1016876108">http://dx.doi.org/10.1073/pnas.1016876108</a>.

- Bininda-Emonds O, Cardillo M, Jones K, MacPhee R, Beck R, Grenyer R, Price S, Vos R, Gittleman J and Purvis A (2007).
"The Delayed Rise of Present-Day Mammals."
*Nature*, **446**.
ISSN 0028-0836, <a href="http://dx.doi.org/10.1038/nature05634">http://dx.doi.org/10.1038/nature05634</a>.

- Stadler T (2011).
"Simulating Trees With A Fixed Number of Extant Species."
*Systematic Biology*, **60**.
ISSN 1063-5157, <a href="http://dx.doi.org/10.1093/sysbio/syr029">http://dx.doi.org/10.1093/sysbio/syr029</a>.

- Hartmann K, Wong D and Stadler T (2010).
"Sampling Trees From Evolutionary Models."
*Systematic Biology*, **59**.
ISSN 1063-5157, <a href="http://dx.doi.org/10.1093/sysbio/syq026">http://dx.doi.org/10.1093/sysbio/syq026</a>.
