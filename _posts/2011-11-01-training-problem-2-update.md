---
comments: true
date: 2011-11-01 14:20:08
layout: post
slug: training-problem-2-update
title: Training Problem 2 update
redirects: [/wordpress/archives/3094, /archives/3094]
categories:
- ecology
tags:
- pdg-control
---

## Problem Statement


We consider the stochastic optimal control problem of fisheries harvests under the scenarios involving alternate stable states, with uncertainty about the parameters of harvest. We consider a series of introductory problems to prepare us for the full problem. We begin with classical optimal control approaches (Pontraygin's principle to transform into an ordinary differential equation boundary-value problem) for continuous time state equations (fish population dynamics) as a reference point. We begin with a one-dimensional state equation. We next consider the discrete-time state equation, which we approach with the Bellman/dynamic programming solution, as a useful starting point for the stochastic control. The continuous-time problem can solved from the Hamilton-Jacobi-Bellman PDE, instead of the BVP. While this is less efficient numerically, it generalizes to the stochastic case most naturally. The stochastic solution for the optimal path still assumes perfect knowledge. We can accommodate uncertainty in the state variables in a Bayesian learning framework.

So far I (Carl) am about half-way through these toy examples which will help set up the training problem.  Once we have a common set of tools and code we have quite a few questions to explore within the uncertainty problem.

(See [original](http://www.carlboettiger.info/archives/2655) task description)


## Introductory Problem by Pontryagin minimization


Optimal control with an allee effect. Continuous time, Pontraygin's minimum principle for the first-order conditions to establish a boundary value problem.



	
  * [BVP derivation](http://www.carlboettiger.info/archives/3001)

	
  * [Numerical solutions](http://www.carlboettiger.info/archives/3049) in several cases

	
  * [Code](https://github.com/cboettig/pdg_control/) for numerics




## Discrete problem by Bellman equation, Dynamic Programming


Optimal control for the analogous discrete time state equations.  Provides a dynamic programming example solution, introduces the cost-to-go.



	
  * Problem setup [notes](http://www.carlboettiger.info/archives/3076).

	
  * Code




## Continuous problem by Hamilton-Jacobi-Bellman PDE


As in the introductory problem. Discritize $ dt $,   and then by Taylor expansion the recursion of the cost to go becomes the HJB PDE:

$$ \partial_t J(x,t) = \min_h \left( U(x,h,t)  +  \beta f(x,h,t) \partial_x J(x,t)   \right) $$

and the optimal path obeys:

$$ h(x,t) = \arg \min_h \left( U(x,h,t) + \beta \partial_x J(x,t) f(x,h, t) \right) $$


## Stochastic problem


State equation is an SDE ((perhaps restricted to $g(x,h,t) = 1$? ))
$$ dx =f(x(t), h(t), t)dt + g(x(t), h(t), t) dB_t $$

and we minimize the expected cost.

$$ \max_h \left( \phi( \langle x(T) \rangle ) + \left \langle \int_0^T e^{-\rho t} \pi(x,h,t) dt \right \rangle \right)$$

For a Gaussian process we solve the stochastic HJB (from taking expectations over the path gives a deterministic PDE by that name):

$$ \partial_t J(x,t) = \min_h \left( U(x,h,t)  +  \beta f(x,h,t) \partial_x J(x,t)   + \frac{1}{2} \nu(x,h,t) \partial_x^2 J(x,t) \right)  $$

Where $ \nu(x,h,t ) $ is the variance dynamics for the state equation.  This may require a numerical solution for appropriate definitions of the stochastic state model, e.g.

$ d X = \alpha X \left(1-\frac{X}{K}\right) \left( \frac{X-C}{K} \right) - X h + \sigma X dB $

Not as bad as it appears perhaps; for instance, [Merton's portfolio problem](http://en.wikipedia.org/wiki/Merton%27s_portfolio_problem) is actually an example of this nature with a closed-form solution. There are efficient numerical solutions for linear-quadratic control versions, perhaps of little use to us.



## Stochastic problem with uncertainty


(Finite time-horizon). Either the parameters of the cost function or the state equation are unknown, and we update our belief about the parameters according to Bayes rule:
$$p_{t+dt} (\alpha | dx, h) \propto p(dx | \alpha, h) p_t(\alpha) $$

We define sufficient statistics for this distribution, and have a control problem with an extra dimension in the state equations. The expected profit is computed over both dimensions:
$$ \max_h \left \langle \phi( x(T) ) + \int_0^T e^{-\rho t} \pi(x,h,t) dt \right \rangle_{\theta, x} $$


## Higher dimensional dynamics


Each of these problems can then be repeated with the proper 3-dimensional parrotfish system:

$$ \frac{dM}{dt} = a MC - \frac{g(P) M}{M+T}+\gamma MT $$

$$ \frac{dC}{dt} = (rT - d-aM)C $$

$$ \frac{dP}{dt} = sP\left( 1-\frac{P}{K(C)}\right) - fP$$

K(C) is from territorial limits, rather than food limits.  (Blackwood _et. al._ 2010)

Adding habitat quality (Blackwood _et. al._ 2011).

## References


- Blackwood J, Hastings A and Mumby P (2010).
"The Effect of Fishing on Hysteresis in Caribbean Coral Reefs."
*Theoretical Ecology*, **5**.
ISSN 1874-1738, <a href="http://dx.doi.org/10.1007/s12080-010-0102-0">http://dx.doi.org/10.1007/s12080-010-0102-0</a>.

- Blackwood J, Hastings A and Mumby P (2011).
"A Model-Based Approach to Determine The Long-Term Effects of Multiple Interacting Stressors on Coral Reefs."
*Ecological Applications*, **21**.
ISSN 1051-0761, <a href="http://dx.doi.org/10.1890/10-2195.1">http://dx.doi.org/10.1890/10-2195.1</a>.
