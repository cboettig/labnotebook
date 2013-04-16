---
title: "nonparametric-bayes: framing the issues for the manuscript"
layout: post
categories: ecology
tags:
- nonparametric-bayes
- warning-signals
- reading

---


## Marc meeting: nonparametric-bayes manuscript

Very good meeting today going over some big picture considerations in the presentation of the nonparametric-bayes manuscript with Marc.  (Also see new entries in issues log on nonparametric-bayes.)  Make it clear that we are making a point rather than providing a tool.  Focus on the tipping point context rather than the general management context.  

* Comparison against a parametric Bayesian model ([40](https://github.com/cboettig/nonparametric-bayes/issues/40))
* Comparison against an active learning parametric model facing a tipping point ([41](https://github.com/cboettig/nonparametric-bayes/issues/41))

## Parametric Bayesian model

Drafting parametric Bayesian case for comparison, following Marc's suggestion.  So far, [code as implemented in BUGS](https://github.com/cboettig/nonparametric-bayes/commit/795bf96ed92a708b44978610da7db3b49ebb4dce)

## More on the exit time problem 

* Alan pointed me to earlier work of <span class="showtooltip" title="Schuss Z and Matkowsky B (1979). The Exit Problem: A New Approach
to Diffusion Across Potential Barriers. _Siam Journal on Applied
Mathematics_, *36*, pp. 604-623. ISSN 0036-1399, 
http://dx.doi.org/10.1137/0136043."><a href="http://dx.doi.org/10.1137/0136043" rel="http://purl.org/spar/cito/discusses" >Schuss & Matkowsky (1979)</a></span>  
* Also, an electronic version of Don Ludwig's article: <span class="showtooltip" title="Donald Ludwig, (1981). Escape from Domains of Attraction for Systems Perturbed by Noise, Nonlinear Phenomena in Physics and Biology."><a href="http://link.springer.com/chapter/10.1007/978-1-4684-4106-2_14" rel="http://purl.org/spar/cito/usesMethodFrom" >Ludwig (1981)</a></span> 

## Warning signals Reading

* Alan pointed out <span class="showtooltip" title="Boerlijst M, Oudman T, de Roos A and Solé R (2013). Catastrophic
Collapse Can Occur Without Early Warning: Examples of Silent
Catastrophes in Structured Ecological Models. _Plos One_, *8*,
pp. e62033-. 
http://dx.doi.org/10.1371/journal.pone.0062033."><a href="http://dx.doi.org/10.1371/journal.pone.0062033" rel="http://purl.org/spar/cito/reviews" >Boerlijst _et. al._ (2013)</a></span>  on warning signals in PLoS ONE today.  A very nice piece!  It's quite useful how it show that the early warning signal can appear in unmonitored variables (e.g. juvenile dynamics) or in variables without adequate noise to provide a signal. Kind of funny that they pitch it as a counterexample to the conjecture that early warning signals are universal, since even Scheffer has avoided that word, and it's not really a counterexample given  the caveat of some process noise and complete observability of the system people have so far assumed (while your work with Derin is a more conclusive counter-example by going beyond fold bifurcations)...  Anyway, good examples. We need a better understanding of warning signals in this multi-dimensional context at large.  

* Recently Noam pointed out <span class="showtooltip" title="Streeter R and Dugmore A (2013). Anticipating Land Surface
Change. _Proceedings of The National Academy of Sciences_, *110*,
pp. 5779-5784. ISSN 0027-8424, 
http://dx.doi.org/10.1073/pnas.1220161110."><a href="http://dx.doi.org/10.1073/pnas.1220161110" rel="http://purl.org/spar/cito/discusses" >Streeter & Dugmore (2013)</a></span> , which looks like a nice spatial warning signal example (with the classic patterns, rather than the <span class="showtooltip" title="Bel G, Hagberg A and Meron E (2012). Gradual Regime Shifts in
Spatially Extended Ecosystems. _Theoretical Ecology_, *5*, pp.
591-604. ISSN 1874-1738, 
http://dx.doi.org/10.1007/s12080-011-0149-6."><a href="http://dx.doi.org/10.1007/s12080-011-0149-6" rel="http://purl.org/spar/cito/containsAssertionFrom" >Bel _et. al._ (2012)</a></span>  pattern), but haven't had time for a closer read yet.   

## Other reading

* Trying to get a hold of <span class="showtooltip" title="Ludwig D and Walters C (1981). Measurement Errors And Uncertainty
in Parameter Estimates For Stock And Recruitment. _Canadian
Journal of Fisheries And Aquatic Sciences_, *38*, pp. 711-720.
ISSN 0706-652X,  http://dx.doi.org/10.1139/f81-094."><a href="http://dx.doi.org/10.1139/f81-094" rel="http://purl.org/spar/cito/discusses" >Ludwig & Walters (1981)</a></span>  as well.  A tough day for reading with the UCSC subscription access down due to "power outages"

* Interesting preprint on advice for data reuse, <span class="showtooltip" title="White EP, Baldridge E, Brym ZT, Locey KJ, McGlinn DJ and Supp SR
(2013). Nine simple ways to make it easier to (re)use your data.
 https://peerj.com/preprints/7 [Online. last-accessed:
2013-04-15 21:19:41].  http://peerj.com/preprints/7."><a href="http://peerj.com/preprints/7" rel="http://purl.org/spar/cito/discusses" >White _et. al._ (2013)</a></span> 

### Misc and code-tricks

* My knitr scripts are not executing in parallel with snow/snowfall packages(?)  Parallelizes fine when run chunk by chunk.  (e.g. [example with snowfall](https://github.com/cboettig/earlywarning/blob/8bf907c21f8eb0f69f6995a94d21ab0eac6e214a/inst/examples/example.Rmd)).  Knitr runs parallel fine with `multicore`.  Weird.  

* An interesting puzzle on knitr list today: wrangling crazy ascii tables in `Hmisc::summary.function`.  A good solution would just rewrite the class's `print` method to be a table object (e.g. compatible with `xtable` and `pander::pandoc_table`), but instead we can hack the ascii, adjusting the options that are passed to `print.char.matrix`: 

* Created a [PURL](http://purl.org) persistent identifier for the notebook [purl.org/globalecology/lab-notebook](http://purl.org/globalecology/lab-notebook).  Existing public top level domain. Waiting for approval for my own top-level domain (cboettig).  

```r
library(Hmisc)
df = data.frame(Age = round(rnorm(100, 50,15)), Sex = rep(c("M", "W")))
out <- summary.formula( ~ Age + Sex, data = df, method = "reverse")
print(out, hsep= '|', csep='|', vsep='-', left.border=FALSE, top.border=FALSE)
```

## References


- Golan Bel, Aric Hagberg, Ehud Meron,   (2012) Gradual Regime Shifts in Spatially Extended Ecosystems.  *Theoretical Ecology*  **5**  591-604  [10.1007/s12080-011-0149-6](http://dx.doi.org/10.1007/s12080-011-0149-6)
- Maarten C. Boerlijst, Thomas Oudman, André M. de Roos, Ricard V. Solé,   (2013) Catastrophic Collapse Can Occur Without Early Warning: Examples of Silent Catastrophes in Structured Ecological Models.  *Plos One*  **8**  e62033-NA  [10.1371/journal.pone.0062033](http://dx.doi.org/10.1371/journal.pone.0062033)
- Donald Ludwig, Carl J. Walters,   (1981) Measurement Errors And Uncertainty in Parameter Estimates For Stock And Recruitment.  *Canadian Journal of Fisheries And Aquatic Sciences*  **38**  711-720  [10.1139/f81-094](http://dx.doi.org/10.1139/f81-094)
- Zeev Schuss, Bernard J. Matkowsky,   (1979) The Exit Problem: A New Approach to Diffusion Across Potential Barriers.  *Siam Journal on Applied Mathematics*  **36**  604-623  [10.1137/0136043](http://dx.doi.org/10.1137/0136043)
- R. Streeter, A. J. Dugmore,   (2013) Anticipating Land Surface Change.  *Proceedings of The National Academy of Sciences*  **110**  5779-5784  [10.1073/pnas.1220161110](http://dx.doi.org/10.1073/pnas.1220161110)
- Ethan White, Elita Baldridge, Zachary Brym, Kenneth Locey, Daniel McGlinn, Sarah Supp,   (2013) Nine simple ways to make it easier to (re)use your data.  *PeerJ PrePrints*  [http://peerj.com/preprints/7](http://peerj.com/preprints/7)
- Donald Ludwig, (1981). Escape from Domains of Attraction for Systems Perturbed by Noise, Nonlinear Phenomena in Physics and Biology.

