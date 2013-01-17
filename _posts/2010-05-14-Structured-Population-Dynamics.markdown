---
layout: post
tags: [tribolium]
categories: [ecology]
title: Structured Population Dynamics
---






 








### Beetle Model

Macroscopic equations:

![ \\begin{align} \\dot E &= f\_E(E,L,A) = -\\mu\_e E - c\_{le} E L -
c\_{ae} E A - a\_e E + b A \\\\ \\dot L &= f\_L(E, L) = -\\mu\_L L +
a\_e E - a\_L L \\\\ \\dot P &= f\_P(L,P) = -\\mu\_P P - a\_p P + a\_L
L\\\\ \\dot A &= f\_A(P,A) = -\\mu\_A A + a\_p P \\end{align}
](http://openwetware.org/images/math/1/c/2/1c26a2c6740e377965fa6e85d41e3f33.png)

Has the corresponding variance-covariance dynamics

![ \\begin{align} &\\frac{d}{dt} \\sigma\_E\^2 = 2\\partial\_E f\_E
\\sigma\_E\^2 + g\_E + 2\\textrm{Cov}(E,L) \\partial\_L f\_E +
2\\textrm{Cov}(E,A) \\partial\_A f\_E \\\\ &\\frac{d}{dt} \\sigma\_L\^2
= 2\\partial\_L f\_L \\sigma\_L\^2 + g\_L + 2\\textrm{Cov}(E,L)
\\partial\_E f\_L \\\\ &\\frac{d}{dt} \\sigma\_P\^2 = 2\\partial\_P f\_P
\\sigma\_P\^2 + g\_P + 2\\textrm{Cov}(L,P) \\partial\_L f\_P \\\\
&\\frac{d}{dt} \\sigma\_A\^2 = 2\\partial\_A f\_A \\sigma\_A\^2 + g\_A +
2\\textrm{Cov}(P,A) \\partial\_P f\_A \\\\ &\\frac{d}{dt}
\\textrm{Cov}(E,L) = \\left( \\partial\_E f\_E + \\partial\_L f\_L
\\right) \\textrm{Cov}(E,L) + \\partial\_L f\_E \\sigma\_L\^2 +
\\partial\_E f\_L \\sigma\_E\^2 \\\\ &\\frac{d}{dt} \\textrm{Cov}(E,A) =
\\left( \\partial\_E f\_E + \\partial\_A f\_A \\right)
\\textrm{Cov}(E,A) + \\partial\_A f\_E \\sigma\_A\^2 + \\partial\_E f\_A
\\sigma\_E\^2 \\\\ &\\frac{d}{dt} \\textrm{Cov}(L,P) = \\left(
\\partial\_P f\_P + \\partial\_L f\_L \\right) \\textrm{Cov}(L,P) +
\\partial\_L f\_P \\sigma\_L\^2 + \\partial\_P f\_L \\sigma\_P\^2 \\\\
&\\frac{d}{dt} \\textrm{Cov}(A,P) = \\left( \\partial\_P f\_P +
\\partial\_A f\_A \\right) \\textrm{Cov}(A,P) + \\partial\_A f\_P
\\sigma\_A\^2 + \\partial\_P f\_A \\sigma\_P\^2 \\end{align}
](http://openwetware.org/images/math/1/2/4/1249afdfb5963c156af5b5709ac8a669.png)

Where *g\_i* is the second jump moment, which is a function of the state
(*E*, *L*, *P*, *A*) just as *f\_i* is. (In this case it will correspond
to the sum of all birth and death terms).

### General Form & Algorithm

Consider the dynamics are given by

![ \\dot X\_i = f\_i(\\vec X)
](http://openwetware.org/images/math/0/1/5/0155c412fb0a830912daef0b2e65b0dd.png)

and define variance-covariance matrix *M* and the Jacobian matrix of *f*
as *J*. Then the dynamics of the diagonal elements (variance terms) are
written as

![ \\dot \\sigma\_i\^2 = 2 g\_i + 2\\sum\_k J\_{ik} M\_{ik} \\partial\_k
f\_i
](http://openwetware.org/images/math/a/0/9/a0963cc09f8b045656952fc47a21587f.png)

While the dynamics of the off-diagonal elements (covariance terms) are
given by

![ \\frac{d}{dt} \\textrm{Cov(i,j)} = \\dot M\_{ij} = \\partial\_i f\_i
M\_{ji} + \\partial\_j f\_j M\_{ij} + \\partial\_i f\_j M\_{ii} +
\\partial\_j f\_i M\_{jj}
](http://openwetware.org/images/math/b/b/d/bbd80770f9365cec3c61b2ce68e34a0a.png)

Track current implementation of the algorithm
[here](http://github.com/cboettig/structured-populations/blob/master/R/noise_approx.R "http://github.com/cboettig/structured-populations/blob/master/R/noise_approx.R").

\

