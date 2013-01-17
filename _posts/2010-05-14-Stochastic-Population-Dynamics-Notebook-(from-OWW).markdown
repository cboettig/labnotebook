---
layout: post
tags: [tribolium]
categories: [ecology]
title:  Structured Population Dynamics

---






### Beetle Model

Macroscopic equations:

$$\begin{align} \dot E &= f_E(E,L,A) = -\mu_e E - c_{le} E L -
c_{ae} E A - a_e E + b A \\ \dot L &= f_L(E, L) = -\mu_L L +
a_e E - a_L L \\ \dot P &= f_P(L,P) = -\mu_P P - a_p P + a_L
L\\ \dot A &= f_A(P,A) = -\mu_A A + a_p P \end{align}$$

Has the corresponding variance-covariance dynamics

$$\begin{align} &\frac{d}{dt} \sigma_E^2 = 2\partial_E f_E
\sigma_E^2 + g_E + 2\textrm{Cov}(E,L) \partial_L f_E +
2\textrm{Cov}(E,A) \partial_A f_E \\ &\frac{d}{dt} \sigma_L^2
= 2\partial_L f_L \sigma_L^2 + g_L + 2\textrm{Cov}(E,L)
\partial_E f_L \\ &\frac{d}{dt} \sigma_P^2 = 2\partial_P f_P
\sigma_P^2 + g_P + 2\textrm{Cov}(L,P) \partial_L f_P \\
&\frac{d}{dt} \sigma_A^2 = 2\partial_A f_A \sigma_A^2 + g_A +
2\textrm{Cov}(P,A) \partial_P f_A \\ &\frac{d}{dt}
\textrm{Cov}(E,L) = \left( \partial_E f_E + \partial_L f_L
\right) \textrm{Cov}(E,L) + \partial_L f_E \sigma_L^2 +
\partial_E f_L \sigma_E^2 \\ &\frac{d}{dt} \textrm{Cov}(E,A) =
\left( \partial_E f_E + \partial_A f_A \right)
\textrm{Cov}(E,A) + \partial_A f_E \sigma_A^2 + \partial_E f_A
\sigma_E^2 \\ &\frac{d}{dt} \textrm{Cov}(L,P) = \left(
\partial_P f_P + \partial_L f_L \right) \textrm{Cov}(L,P) +
\partial_L f_P \sigma_L^2 + \partial_P f_L \sigma_P^2 \\
&\frac{d}{dt} \textrm{Cov}(A,P) = \left( \partial_P f_P +
\partial_A f_A \right) \textrm{Cov}(A,P) + \partial_A f_P
\sigma_A^2 + \partial_P f_A \sigma_P^2 \end{align}
$$

Where *g\_i* is the second jump moment, which is a function of the state
(*E*, *L*, *P*, *A*) just as *f\_i* is. (In this case it will correspond
to the sum of all birth and death terms).

### General Form & Algorithm

Consider the dynamics are given by

$$ \dot X_i = f_i(\vec X)$$

and define variance-covariance matrix *M* and the Jacobian matrix of *f*
as *J*. Then the dynamics of the diagonal elements (variance terms) are
written as

$$ \dot \sigma_i^2 = 2 g_i + 2\sum_k J_{ik} M_{ik} \partial_k f_i$$

While the dynamics of the off-diagonal elements (covariance terms) are
given by

$$ \frac{d}{dt} \textrm{Cov(i,j)} = \dot M_{ij} = \partial_i f_i
M_{ji} + \partial_j f_j M_{ij} + \partial_i f_j M_{ii} +
\partial_j f_i M_{jj}$$

Track current implementation of the algorithm
[here](http://github.com/cboettig/structured-populations/blob/master/R/noise_approx.R "http://github.com/cboettig/structured-populations/blob/master/R/noise_approx.R").


