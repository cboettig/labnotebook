---
layout: post
tags: [tribolium]
categories: [ecology]
title: Puzzled over the two-step jump process results
---






 








The variance dynamics are slightly different if the continuous time
Markov process allows events to contain two steps (such as a transition
of an individual from one age class to another, or one patch to another,
etc) as well as one step birth/death) transitions. *V*τ~*i**j*~(*X* /
*V*) to represent the rate of transitions from state *i* to state *j*.
We change variables for our state space from the discrete count state
variable *X* by dividing by the system size (volume) V, to obtain the
continuous, mean-field approximation of the density *p = X/V.* Then:

\

![ \\begin{align} & \\frac{d}{dt} E(p) = b(p)-d(p) + \\sum\_{j \\neq i}
\\tau\_{ji}(p) - \\tau\_{ij}(p) =: f(p)\\\\ & \\frac{d}{dt} M =
\\textrm{diag}( b(p) + d(p) ) - T + Df(p) M + M Df(p)\^T \\end{align}
](http://openwetware.org/images/math/5/e/b/5eb413fd88e12c41c39cf48c811fc71a.png)

where *T* is a symmetric matrix with off-diagonal elements *i,j*
τ~*i**j*~(*p*) + τ*j**i*(*p*) and diagonal elements chosen so that rows
sum to zero. This approximation is implemented in
[noise\_approx.R](http://github.com/cboettig/structured-populations/blob/master/R/noise_approx.R "http://github.com/cboettig/structured-populations/blob/master/R/noise_approx.R")

### Example: Crowley model

-   **Carl Boettiger 15:05, 25 May 2010 (EDT)**: (some corrections to
    eqns)

(Note this is the original Crowley model where the *c* coefficients are
equal. In the original model this represented competition for space by
overgrowth and hence would more naturally be expressed as a two step
process).

![ \\begin{align} \\dot x &= b\_1 x (K - x - y)/K - d\_1 x + c x y/K
\\\\ \\dot y &= b\_2 y (K - x - y)/K - d\_1 y - c x y/K \\end{align}
](http://openwetware.org/images/math/7/c/4/7c49b2c47e74e60537d6345e8b7a9c6a.png)

Interpreting the *cxy* terms as transitions rather than independent
birth and death events results in the same mean-field dynamics but
differing fluctuations. For instance, the covariance dynamics are:

![ \\frac{d}{dt} \\textrm{Cov}(x,y) = \\left(b\_1 (1-2x-y)-d\_1 +c y +
b\_2(1-x-2y)-d\_2 -c x \\right)\\textrm{Cov}(x,y) - (b\_1 x +c x
)\\sigma\_y\^2 -(b\_2 y -c y)\\sigma\_x\^2 - cxy
](http://openwetware.org/images/math/2/4/c/24c57b2b520fa2223fc7f059ade57d81.png)

Whereas interpreted as single-step birth and death the *cxy* term at the
end is absent.

The variance dynamics are similarly altered.

#### Numerical implementation

This individual-based simulation is implemented in
[metapop.c](http://github.com/cboettig/structured-populations/blob/master/src/metapop.c "http://github.com/cboettig/structured-populations/blob/master/src/metapop.c")
and callable from R interface from
[ind\_based\_models.R](http://github.com/cboettig/structured-populations/blob/master/R/ind_based_models.R "http://github.com/cboettig/structured-populations/blob/master/R/ind_based_models.R")
as metapop\_ibm(). The file
[metapop.R](http://github.com/cboettig/structured-populations/blob/master/R/metapop.R "http://github.com/cboettig/structured-populations/blob/master/R/metapop.R")
specifies the dynamics of birth, death, transition matrix and the
Jacobian so that linear\_noise\_approx() function from above can be used
to calculate the moments. This file also runs the crolwey\_ibm model
(from crowley.c, interface in the ind\_based.models.R) and the linear
noise approximation to it from
[crowley.R](http://github.com/cboettig/structured-populations/blob/master/R/crowley.R "http://github.com/cboettig/structured-populations/blob/master/R/crowley.R")
to compare how the two-step process changes the noise dynamics.

This comparison can be run simply by loading the package and running
metapop\_example() function.

For some reason the individual based-simulation of the two-step process
seems to resemble that of the one-step process more, while the two-step
linear noise approximation alternately underestimates (Fig 1) or
overestimates (Fig 2) the variance. Looking for bugs in the
implementation at the moment.

-   **Carl Boettiger 21:43, 26 May 2010 (EDT)**: Bug found, see
    corrected graphs on Tuesday's (5/25) entry.

![Fig 1. Parameters: b\_1 = .2, b\_2 = .1, d\_1 = d\_2 = c =
.1](http://openwetware.org/images/thumb/8/84/Compare_noise.png/360px-Compare_noise.png)

![image](/skins/common/images/magnify-clip.png)

Fig 1. Parameters: b\_1 = .2, b\_2 = .1, d\_1 = d\_2 = c = .1

![Fig. 2. Parameters: b\_1 = .2, b\_2 = .1, d\_1 = d\_2 = .1, c =
.15](http://openwetware.org/images/thumb/f/f3/Compare_noise2.png/360px-Compare_noise2.png)

![image](/skins/common/images/magnify-clip.png)

Fig. 2. Parameters: b\_1 = .2, b\_2 = .1, d\_1 = d\_2 = .1, c = .15

\

\

