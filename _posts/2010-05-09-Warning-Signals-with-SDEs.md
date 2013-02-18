---
layout: post
tags: [warning-signals, code-tricks]
categories: [ecology]
title: Warning Signals with SDEs
---






 








### Summary

-   Have a functional likelihood calculation from the full
    individual-based simulation, see Friday. Accuracy needs more
    testing, and the computation is probably too slow for optimization
    routines.
-   Have an implementation of the linear decrease in stability model
    with analytic conditional probability density. Needed a couple
    adjustments today.
-   Need to add direct simulation to the warning signals package,
    currently retunrs only time-averaged/ensemble averaged stats. Can be
    approximated by setting the window equal to the timestep and
    ensembles equal to one.

### Revising & Testing the math

Revisions to the equations from Thursday's entry:

-   Added an alpha\_0 parameter -- the alpha dynamics shouldn't start at
    zero.
-   The variance integral had a factor of two that wasn't carried
    through. Also this calculation changes as a result of the alpha\_0
-   The resulting analytical solution for the variance depends on a
    difference of error functions, which has poor numerical behavior for
    small beta. Implemented a flag in the R code which drops down to the
    analytic solution of beta=0 when it begins to run into this
    numerical round-off, otherwise numerics return variance of zero.
    Compared to analytic simulations.

### Effective model choice: absence of a warning signal

1.  Generate a data set that does not contain a warning signal, using
    the OU model.
2.  Fit both model with changing stability and the simple OU model.

~~~~ {.de1}
theta <- 3
alpha <- 1
sigma <- 2
X <- sde.sim(model="OU", theta= c(theta*alpha,alpha,sigma), X0=Xo, N=1000, T=1000)  # (SDE package parameterizes OU differently)
 
 
# These starting conditions converge to the wrong set of parameters but achieve the same likelihood
 
Call:
mle(minuslogl = warning.lik, start = list(alpha_0 = 2, theta = 1, 
    sigma = 2, beta = 2), method = "L-BFGS-B", lower = c(0, 0, 
    0, 1e-09), control = list(maxit = 1000))
 
Coefficients:
         Estimate   Std. Error
alpha_0 0.5812878 139.62180181
theta   3.0881681   0.06202446
sigma   1.9305852  43.26824107
beta    1.0907615 279.24384653
-2 log L: 3401.722 
 
 
## These parameters converge closer to the true parameter set, and achieve much smaller Std Error
Call:
mle(minuslogl = warning.lik, start = list(alpha_0 = 2, theta = 1, 
    sigma = 2, beta = 0.2), method = "L-BFGS-B", lower = c(0, 
    0, 0, 1e-09), control = list(maxit = 1000))
 
Coefficients:
          Estimate Std. Error
alpha_0 1.10203570        NaN
theta   3.08817901 0.06202212
sigma   2.09564217 0.02879976
beta    0.04950086        NaN
-2 log L: 3401.722 
 
 
 
## Matches the parameter values from the simple OU model (beta = 0), and same likelihood
 
mle(minuslogl = OU.lik, start = list(theta1 = 1, theta2 = 0.5, 
    theta3 = 0.5), method = "L-BFGS-B", lower = c(-Inf, 0, 0))
 
Coefficients:
       Estimate Std. Error
theta1 3.479407 0.29304030
theta2 1.126721 0.09219684
theta3 2.103550 0.07886453
-2 log L: 3401.722 
 
## And matches (even outperforms) the likelihood of the true parameters:
> 2*warning.lik(alpha_0, theta, sigma, beta)
[1] 3405.286
> 2*OU.lik(alpha*theta, alpha, sigma) 
[1] 3405.837
~~~~

### Analysis of Results

-   So bad news is fit of the richer model can depend on initial
    conditions, and maximizing likelihood alone doesn't guarantee
    finding the right parameters.
    -   Luckily this alternate peak seems to have broader uncertainty

-   Good news is that both approaches achieve the likelihood of the true
    parameter values. Any information criterion would successfully
    reject the change of stability model in this case.

\

### Code Updates

-   Warning Signals project has also [migrated to
    Github](http://github.com/cboettig/warningSignals "http://github.com/cboettig/warningSignals").
    Nicer interface, git is much faster, handles branching & merging
    very elegantly and this centralizes my projects.
-   the optimization function in R takes control argument for maximum
    number of iterations as demonstrated above, though we don't hit the
    default max (100) yet, which is promising for being able to optimize
    the individual-based model over at least a subset of parameters.
-   Ironically the sde\_likelihood library for this analysis has been
    developed in the Structured-Populations package, though it has now
    been integrated into the warningSignals package.
-   Handy: function *formals()* gives the arguments/defaults of an R
    function.
-   Should look into how mle() is calculating the standard error
    estimate on parameters.

Misc
----

-   Joined Nature's
    [SciTable](http://www.nature.com/scitable "http://www.nature.com/scitable"),
    aimed at undergraduates and professors teaching mostly. We'll see if
    it's any use.
-   [Statistics](http://www.youtube.com/watch?v=lFZ0z5Fm-Ng "http://www.youtube.com/watch?v=lFZ0z5Fm-Ng")
    on Social media, youtube-style.
-   Persuasive [case for
    twitter](http://www.wired.com/techbiz/media/magazine/15-07/st_thompson "http://www.wired.com/techbiz/media/magazine/15-07/st_thompson"),
    a social sixth sense?
-   [100 twitter
    tips](http://www.bestcollegesonline.com/blog/2009/07/21/100-serious-twitter-tips-for-academics/ "http://www.bestcollegesonline.com/blog/2009/07/21/100-serious-twitter-tips-for-academics/").
-   added category tags to notebooks yesterday. Should help organize the
    subprojects in each notebook.

\

