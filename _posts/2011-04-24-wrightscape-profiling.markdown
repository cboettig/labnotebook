---
comments: true
date: 2011-04-24 18:50:11
layout: post
slug: wrightscape-profiling
title: wrightscape profiling
redirects: [/wordpress/archives/1486, /archives/1486]
categories:
- computation
- evolution
---

Optimization at the R level is substantially slower than at the C level:

    
    system.time(wright_test = wright(data,tree,regimes, alpha=ou2@sqrt.alpha^2, sigma=ou2@sigma))
       user  system elapsed
     82.157   0.068  82.346
    system.time(ws2 = wrightscape(trait, labrid$tree, regime=labrid$regimes, (ou2@sqrt.alpha)^2, ou2@sigma, theta=ou2@theta[[1]]))
    iter:   229, llik = 34.750, size = 0.000,
     par values =  0.000069  2.456353  0.000026  0.225234  0.973002  0.488713
       user  system elapsed
      4.964   0.000   4.971


This is possibly due to repeating the lca matrix calculation.  As it's not done in a separate R function yet, the profiler cannot tell us this.

Updated code to use a separate function (already had a separate C function in anticipation of this, so just needed a separate wrapper for it.  Wrote a bit of type-checking, error handling, and documentation for the new functions, still could be expanded.

    
    
    system.time(wright_test2 <- wright(data,tree,regimes, alpha=ou2@sqrt.alpha^2, sigma=ou2@sigma))
       user  system elapsed
      7.329   0.028   7.372


Now it's still slower, but only by factor of 2, instead of a factor of 20.

Next, will check comparison of the parameter convergence:

    
    
     wright_test2
    $par
    [1]  2.2659839 -3.2141702  4.5873655  6.0465643  0.6557786 -0.6525537  0.2020016
    
    $value
    [1] -42.07038
    
    $counts
    function gradient
         502       NA 
    
    $convergence
    [1] 1


Should clearly add labels to the output.  This is Xo, alpha1, alph2, sigma1, sigma2, theta1, theta2.  Already a problem that it has estimated a negative alpha -- probably as a consequence, the algorithm has terminated but not converged.

The likelihood calculation does not include checks on parameter values that must be positive -- as seen by $value, the likelihood function is still being evaluated ((just to verify this, consider

    
     multiOU_lik(data, tree, regimes, alpha=wright_test2$par[2:3], sigma=wright_test2$par[4:5], theta=wright_test2$par[6:7], X=wright_test2$par[1])


))

We can add error handling for these values or try a bounded optimizer -- it would be nice to have some more rigorous guidelines on choosing the numerical optimizer and handling in this case.  Particularly curious how well the simplex and other methods due in facing local peaks.  

Bounded optimizer objects to non-finite values.  Adding simple -Inf likelihood condition on negative parameters and increasing maximum iterations beyond 2000, Nelder-Mead still fails to converge, exiting with degenerate simplex, though gets a likelihood of similar values.  Values are comparable but not very close matches to the gsl algorithm in the C code.  Probably worth exploring with simulated annealing too.  


    
    
    ws2$data     ws2$tree     ws2$regimes  ws2$loglik   ws2$Xo       ws2$alpha    ws2$theta    ws2$sigma    
    > c(ws2$Xo, ws2$alpha, ws2$theta, ws2$sigma)
    [1] 2.252339e-01 6.919340e-05 2.456353e+00 2.593147e-05 2.252339e-01
    [6] 9.730023e-01 4.887133e-01
    > wright_test2$par
    [1]  1.918392e+00  7.880160e-10  5.834572e+00  5.045619e+00  6.890863e-01
    [6] -8.452617e+00  2.207771e-01
    



see git log for details.



