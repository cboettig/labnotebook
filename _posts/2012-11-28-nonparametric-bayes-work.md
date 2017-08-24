---
layout: post
category: ecology
tags: nonparametric-bayes
title: early results in nonparametric-bayes approaches to optimal policy

---


## Resolving Numerical and Computational issues

#### Sequential approach? ([issue #4](https://github.com/cboettig/nonparametric-bayes/issues/4))

Thinking through whether or not it is worth optimizing the computational performance of the sequential approach.  

Can it be demonstrated that this actually has higher numerical stability? Alternatively, can it be demonstrated that this is (or is not) equivalent to the calculation performed by the direct inversion? What is the difference in computational complexity between these approaches? e.g. the inverse ends up effectively O(n^3), but what is the recursion?

If we assume measurement noise, is stability an issue? e.g. introducing such small noise or jitter apparently a standard method to address stability; see pg 12 and citations there-in (Matheron, 1963; Cressie, 1991, Neal, 1997).

How much accuracy is lost with reasonable grids? Compared to adding jitter?

Is there any evidence of use for this approach in the substantial GP literature of computational experts?

With large data sets, the determinant does get close to zero, but solutions appear stable with direct (DGESV) inversion.  See [issue #4](https://github.com/cboettig/nonparametric-bayes/issues/4) for a discussion.  

- seeing if I get singular matrices in the inversion [09:55 pm 2012/11/28](https://github.com/cboettig/nonparametric-bayes/commit/7faf6791cb386db48687144937868f976814dc65)
- print determinant value [10:00 pm 2012/11/28](https://github.com/cboettig/nonparametric-bayes/commit/71f2443754193910bd20af1e9659848d5de1dc86)



#### Choleski, ([issue #2](https://github.com/cboettig/nonparametric-bayes/issues/2))

- basic example comparing methods [08:10 pm 2012/11/28](https://github.com/cboettig/nonparametric-bayes/commit/113df7a98a46e0fb91443a60867c887a76f3ccb6)
- choleski approach using backsolve [05:49 pm 2012/11/28](https://github.com/cboettig/nonparametric-bayes/commit/5c332aa3ade026973fa5cb873f7ec3c7b5c6f7d3)

Some explaining to do here.  

### Hyperparameter optimization ([issue #3](https://github.com/cboettig/nonparametric-bayes/issues/3))

Added necessary hyperparameter for variance in the covariance kernel $\tau$, in kernel $\tau e^{-(x-x')^2/\ell}$.  Alternatively should be scaling data s.t. variance is unity.  Manually tuning this does allow for better fits.  Need to try optimization still. Have added a method to condition on the function going through (0,0) with negligible error, currently in a somewhat direct/inelegant code (and potential for numerical instability).  

- Reed example using tau not set to 1 and conditioning on going through (0,0) [05:34 pm 2012/11/28](https://github.com/cboettig/nonparametric-bayes/commit/0de731ae0924ea649549dafebb4914f2da3269a6)
- allow for tau as hyperparameter [02:55 pm 2012/11/28](https://github.com/cboettig/nonparametric-bayes/commit/ca583db171b79f732c00ce8acd5b902942619c4e)

Now getting reasonable performance of the Gaussian process relative to the optimal policy (also see earlier examples below).  Comforting to see that the Gaussian Process results in slightly larger uncertainty and manages slightly more conservatively (higher standing stock, lower harvests).  Very conservative outside range of data -- resulting in a policy function deviating strongly from Reed's constant escapement.  


![plot of chunk unnamed-chunk-2](/assets/figures/2012-11-28-ca583db171-unnamed-chunk-2.png) 

![plot of chunk policy_plot](/assets/figures/2012-11-28-ca583db171-policy_plot.png) 

![plot of chunk simplot](/assets/figures/2012-11-28-ca583db171-simplot.png) 


### Functionalize package

Existing methods now all implemented in package function `gp_fit`, and method for SDP via GP in `gp_transition_matrices`. 
 
- as before but with kernlab fit (underestimates lengthscale) [02:16 pm 2012/11/28](https://github.com/cboettig/nonparametric-bayes/commit/16892e97b750b8d2e0bf7e31cf05cdaae592e979)
- Identical to previous reed-example commit but with kernlab engine (not fit) [02:14 pm 2012/11/28](https://github.com/cboettig/nonparametric-bayes/commit/ba98931d271492ff1b819b558dceefcc04c444f2)
- Example of direct method using subroutines from `R/` [02:11 pm 2012/11/28](https://github.com/cboettig/nonparametric-bayes/commit/158fae025441495527c58dda627756ff54d9862f)

Different GP fitting routines can all be called with gp_fit and plotted with plot.gpfit.
transition matrices for GP can be estimated with `gp_transition_matrices`.

See example use in reed-example.R [01:48 pm 2012/11/28](https://github.com/cboettig/nonparametric-bayes/commit/8fa49628f1969eab457109c7364382649e87143e)




