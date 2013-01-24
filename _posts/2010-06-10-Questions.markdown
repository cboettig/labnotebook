---
layout: post

categories: [ecology]
title: Questions
---






 








Current population dynamics model macroscopic equations:

![ \\begin{align} \\dot E &= f\_E(E,L,A) = -\\mu\_e E - c\_{le} E L -
c\_{ae} E A - a\_e E + b A \\\\ \\dot L &= f\_L(E, L) = -\\mu\_L L +
a\_e E - a\_L L \\\\ \\dot P &= f\_P(L,P) = -\\mu\_P P - a\_p P + a\_L
L\\\\ \\dot A &= f\_A(P,A) = -\\mu\_A A + a\_p P \\end{align}
](http://openwetware.org/images/math/1/c/2/1c26a2c6740e377965fa6e85d41e3f33.png)

Interpreting μ terms as death events, b as birth, and the *a* terms as
transitions between age classes gives a natural form for the master
equation.

### Divergent Solutions to the linear noise approximation?

Breaking the age classes into *k* subclasses makes waiting time within
an age class gamma instead of exponential, which better matches
observation. Also allows sustained oscillations. The numerical solution
to the linear noise approximation shows divergent variance dynamics. Is
this a numerical artifact?

![Numerical solution to linear noise b=5, ue= 0, ul = 0.001, up = 0, ua
= 0.01, ae = .13\*k, al = .01\*k, ap = .15\*k, cle = .2, cap = .1, cae =
5,
V=volume](http://openwetware.org/images/thumb/e/eb/Oscillate_noise2.png/500px-Oscillate_noise2.png)

![image](/skins/common/images/magnify-clip.png)

**Numerical solution to linear noise** b=5, ue= 0, ul = 0.001, up = 0,
ua = 0.01, ae = .13\*k, al = .01\*k, ap = .15\*k, cle = .2, cap = .1,
cae = 5, V=volume

[version-stable
code](http://github.com/cboettig/structured-populations/blob/0af18d6f4b63ef63ced376f0c73cec16b83c66b5/R/gamma_beetles.R "http://github.com/cboettig/structured-populations/blob/0af18d6f4b63ef63ced376f0c73cec16b83c66b5/R/gamma_beetles.R").

![individual base simulation with same
parameters](http://openwetware.org/images/a/a9/Ibm_gamma.png)

[Version-stable
code](http://github.com/cboettig/structured-populations/blob/c361d07025b038c3d435018b751a6858c71f89c7/R/ind_based_models.R "http://github.com/cboettig/structured-populations/blob/c361d07025b038c3d435018b751a6858c71f89c7/R/ind_based_models.R")

### Differences between two-step (correlated events) and two single steps

Can we distinguish between a process where an element leaves one
population and enters another (i.e. a transitions from one age class to
the next) and a model where death rate in one class is equal to the
birth rate in another? The linear noise approximation for a two-step
process obeys a different equation than the one-step:

![ \\begin{align} & \\frac{d}{dt} E(p) = b(p)-d(p) + \\sum\_{j \\neq i}
\\tau\_{ji}(p) - \\tau\_{ij}(p) =: f(p)\\\\ & \\frac{d}{dt} M =
\\textrm{diag}( b(p) + d(p) ) - T + Df(p) M + M Df(p)\^T \\end{align}
](http://openwetware.org/images/math/5/e/b/5eb413fd88e12c41c39cf48c811fc71a.png)

where *T* is a symmetric matrix with off-diagonal elements *i,j*
τ~*i**j*~(*p*) + τ*j**i*(*p*) and diagonal elements chosen so that rows
sum to zero. This approximation is implemented in
[noise\_approx.R](http://github.com/cboettig/structured-populations/blob/master/R/noise_approx.R "http://github.com/cboettig/structured-populations/blob/master/R/noise_approx.R")

How different can this be from simply implementing all transitions as
single-steps?

So far the difference seems small in my examples:

![hastings covarainces, b1 = 0, b2 = .6, d1 = d2 = .1, c1 = c2 =.5, K
=1e4](http://openwetware.org/images/thumb/e/e8/Crowley_covariance.png/400px-Crowley_covariance.png)

![Comparison. Parameters: b\_1 = .2, b\_2 = .1, d\_1 = d\_2 = c =
.1](http://openwetware.org/images/thumb/2/26/Fixed_2.png/400px-Fixed_2.png)

![image](/skins/common/images/magnify-clip.png)

Comparison. Parameters: b\_1 = .2, b\_2 = .1, d\_1 = d\_2 = c = .1

\

\

