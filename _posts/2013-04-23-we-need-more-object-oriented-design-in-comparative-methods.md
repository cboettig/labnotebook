---
layout: post
category: evolution
tags: 
- pmc

---



The bad news is that the latest [Geiger](http://cran.r-project.org/web/packages/geiger/index.html) version (which is much improved in all respects) breaks my little [pmc](http://cran.r-project.org/web/packages/pmc/index.html) package, owing to changes in how `fitContinuous` output is structured.  The good news is that the new geiger is much better than the old one, and that the pmc package is pretty trivial.  So this should not be read as a complaint, but I think as a scientific developer community as a whole we could learn a few simple lessons here, which can help our code more reproducible and extensible.  

Functions define the API, or [application programming interface](http://en.wikipedia.org/wiki/Application_programming_interface), of a package.  Once a package has been released, developers are usually hesitant to change how a function call is made -- what arguments it takes or what order they come in, since this would break any existing code.  For the most part, the update is a good example of that, with minor exceptions -- (for instance, a data.frame used to be a valid input to the `fitContinuous` `dat` argument, but now it must be a matrix).  More problematic is the lack of an API in the original version of package for handling output objects. If you wanted to access the estimated value of the parameter `lambda` after running `fit <- fitContinuous(phy, dat, model="lambda", ...)`, you would have needed to use `fit[[1]]$lambda`.  Under the newer version of this function, such a call won't work.  Any code written to use the output of that function will not work either.  

To avoid this kind of problem in the future, Jon has written the function `coef` which will extract the coefficients from the fit.  For anyone starting to write packages, writing and using such extraction functions seems like an unnecessary hassle -- after all it is often no faster to call the additional function than to just pull the data out of the return object yourself.  But there is good reason to implement and use such methods.  By drawing the data out using a function, it is possible to change the internal structure of the output without breaking the package API; without breaking code that depends on the package.  In future, the `coef` function can just be similarly updated to point to the correct location for the model coefficients.  

Better than providing just any function, the new `coef` and `logLik` functions are generic methods that can act on a wide range of model fits in R that return coefficients or log likelihoods.  Just type `methods("coef")` in your R terminal after loading your commonly used libraries to see how many of them define such a function.  Following the basic principle of object-oriented design, these generic function calls identify the class of object they are given, and figure out what method to use on that class.  For instance, the list of stuff returned by `fitContinous` now has class `gcfit`, and a function `coef.gcfit` which the generic function `coef` uses to know where to find the coefficients in a `gcfit` object.  Generic functions are particularly nice, since they allow us to write code that can deal with a wide variety of statistical fits without needing to know just how to perform those tasks.  The pmc algorithm is a good example of this. Using the generics `simulate`, `update`, and `logLik`, we can write the algorithm as:   



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

The `pmc` package simply writes wrappers that will provide these generic methods to some of these functions.  Because different packages (e.g. ouch, geiger) handle data differently, the wrappers must also be able to convert back and forth between these formats if we want to compare methods across different packages in this way.  Though straight forward, it is not good practice to have the methods such as `simulate` and `update` provided in a different package than the actual fitting routines, but the number of package fitting methods continues to grow and I haven't persuaded anyone to consider including such routines. With my postdoctoral work outside the area of phylogenetics, updating pmc each time is impractical.  If packages provided such generic routines, code such as the above would work out of the box without the need for a specialized `pmc` package, which appears to make this very intuitive technique more opaque then necessary.   

There are many other good statistical tests that could benefit from such methods (particularly simulation methods which could assist in many ways). I hope one day they may be more popular in our phylogenetics community. 











