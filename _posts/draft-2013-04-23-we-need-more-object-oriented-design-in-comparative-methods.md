---
published: false
layout: post
category: evolution
tags: 
- pmc

---


I really do wish more people writing phylogenetics packages would take the time to write standard statistical methods for their fits, and return them as proper classes.  Aaron King does a great job of this with OUCH (though no need to use S4 classes since they seem to confuse people), and no one else has followed suite. Other statistical fitting packages in R almost always use such object oriented design.  If someone has done this, then the PMC algorithm can be written in terms of the "generic" S3/S4 functions:


```r
## Fit the original data using a function that returns an intelligent object "fit" which has methods "simulate", "update", and "logLik"
fit_A <- my_fitting_function(data, phy, model_pars_A, fitting_pars ...)
fit_B <- another_fitting_function(data, phy, model_pars_B, fitting_pars ...)

orig_LL <- logLik(fit_B) - logLik(fit_A)

## 1000 Simulations under each model
A_sims <- simulate(fit_A, 1000)
B_sims <- simulate(fit_B, 1000)

## here are the four fits
AA <- lapply(A_sims, fit_A, update)
AB <- lapply(A_sims, fit_B, update)
BA <- lapply(B_sims, fit_A, update)
BB <- lapply(B_sims, fit_B, update)

## which create 2 distributions
null_dist = sapply(AB, logLik) - sapply(AA, logLik)
test_dist = sapply(BB, logLik) - sapply(BA, logLik)
```

in which the exact same code could be used regardless of whether `my_fitting_function` was `brownie.lite`, `fitContinuous`, `fitDiscrete`, `hansen`, `OUwie`, any of the laser fns, etc etc, and `another_fitting_function` could be the same call with different parameters (e.g. call to `hansen` with a different painting) or a call to some other function entirely (e.g. `brownie.lite`).  Instead, `OUCH` is the only one that does this, and it insists on using a different format for "data" and "phy" which makes it annoying to have it play nicely with other fitting routines. 

There are many other good statistical tests that could benefit from such methods. I hope one day they may be more popular in our phylogenetics community.  

