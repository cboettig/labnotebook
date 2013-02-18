---
comments: true
date: 2011-10-19 23:01:10
layout: post
slug: optimal-control-exploration
title: Optimal Control Exploration
redirects: [/wordpress/archives/2944, /archives/2944]
categories:
- computation
tags:
- pdg-control
---

Translating Jim's Matlab code.

Adapted for Octave.

R version.

Document review:



	
  1. Chapter 04_Sanchirico_Final.pdf

	
  2. SanchiricoOptimalSpace_JEEM.pdf (Sanchirico & Wilen, 2005)

	
  3. Optimal_Rebuilding_AJAE2010.pdf, Optimal_Rebuilding_Supp_Material.pdf (Sanchirico _et. al._ 2010)

	
  4. Sanchirico_editsembedded.pdf: Book Chapter 1:  Economically Optimal Management of a Metapopulation


Reviewing Bett's Practical Methods for Optimal Control using Nonlinear Programming. (( [Practical Methods for Optimal Control and Estimation Using Nonlinear Programming, Second Edition (Advances in Design and Control)](http://www.mendeley.com/library/#) John T. Betts (2009) _Society for Industrial & Applied Mathematics_ p. 448))


### Basics




#### Newton's Method:





	
  * in solving roots (constraint), Jacobian. (secant methods)

	
  *  in solving (unconstrained) optimization, Hessian




#### Equality-constrained Optimization:


Lagrangian multipliers -> optimization.  Hessian of Lagrangian, gives KTT system:

$$ \begin{pmatrix} H_L & G^T \\ G & 0 \end{pmatrix} = \pmatrix{ - p \\ \bar \lambda}   = \pmatrix{ g\\ c } $$

Newton's.  Estimating Jacobian/Hessian by Quasi-Newton (Secant) approach.  e.g. BFGS update.


#### Inequality-Constrained Optimization:


define Active set $\mathcal A$ of constraints.  if $c_i(x) \geq 0$ then active when $\lambda_i^* \geq 0$, e.g. active for $i \in \mathcal{A}$. If in the active set, can treat as equality, otherwise constraint is removed from Lagrangian.


#### Quadratic Programming:


If we have



	
  * quadratic objective $F(x) = g^T x + \frac{1}{2} x^T H x$, $H$ positive-definite.  ($H = 0$ becomes a LP problem).

	
  * linear constraints $Ax = a, Bx \geq b$


An active set algorithm:

	
  1. Newton-minimize the active set Lagrangian (as equalities).

	
  2. Take the largest step in direction $p$ that doesn't violate the inactive set. (step size $\alpha  < 1$ in $\bar x = x + \alpha p$

	
  3. If the step is restricted by inactive set, add to active set and repeat.




#### Globalization strategies








	
  1. Merit function (just use F? use quadratic penalty?) decides if method is "working"

	
  2. Line-search method: what to do when step doesn't improve merit function.

	
  3. Trust-region methods

	
  4. Filters




#### Nonlinear Programming


minimize objective $F(x)$ subject to $m$ constraints $c_L \leq c(x) \leq c_U$ and the simple bounds $x_L \leq x \leq x_U$ .



	
  * Make quadratic from Taylor approximation to Lagrangian and solve this.

	
  * Introduce merit function




#### What can go wrong





	
  * Infeasible constraints

	
  * Rank-deficient constraints

	
  * Constraint redundancy (confuses the active set definition)

	
  * Discontinuities




#### Scaling


Scale variables appropriately, same range, magnitude, etc.  Typically automated in a good algorithm.


### Large, Sparse, NLP


(This is a direct approach.  Indirect methods reformulate as a boundary value problem by the Hamiltonian and solve that instead (via shooting, etc).


## Finite-Horizon Optimal Control Problems


On to collocation solutions to boundary value problems.  Switching to:

Judd, K. L. (1998). _Numerical Methods in Economics._ The MIT Press. Retrieved from http://www.amazon.com/Numerical-Methods-Economics-Kenneth-Judd/dp/0262100711

$$\max_u \int_O^T e^{\rho t} \pi(x,u,t) dt + W(x(T)) $$

s.t. $\dot x = f(x,u,t)$

$x(0) = x_0$

Where we have:



	
  * $n$ state variables $x \in R^n$,

	
  * $m$ controls $u \in R^m$,

	
  * a discount rate $\rho$,

	
  * a rate of payoff $\pi(x,u,t) : R^n \times R^m \times R \to R$, (a.k.a. the utility function)

	
  * $W(x(T))$, a value of the terminal state, (or otherwise this is 0, and we have terminal condition $x(T) = x^T$

	
  * and $f$ the law of motion (biology).


We can define the current-value Hamiltonian:

$$ H(x, u, \lambda, t) = \pi(x,u,t) + \lambda^T f(x,u,t) $$

where $\lambda \in R^n$ are shadow prices for $x$, subject to the costate equations:

$$ \dot \lambda = \rho \lambda - (\partial_x \pi + \lambda^T \partial_x f ) $$

(e.g. the costate equation is $ \dot \lambda = -\partial_x H $.  Why? Proof?)

and then the maximum principle implies that we get the optimal control (time-dependent values for parameters) by:

$$ u(t) \in \arg \max_u H(x,u, \lambda, t) $$

If $H$ is $C^2$ and concave in $u$, there's a unique solution $U(x,\lambda,t)$, given by first-order condition

$0 = \partial_u H(x, U(x,\lambda,t), \lambda, t)$

which satisfies the costate equation, the law of motion, and the boundary value problem.



## References


- Sanchirico J and Wilen J (2005).
"Optimal Spatial Management of Renewable Resources: Matching Policy Scope to Ecosystem Scale."
*Journal of Environmental Economics And Management*, **50**.
ISSN 00950696, <a href="http://dx.doi.org/10.1016/j.jeem.2004.11.001">http://dx.doi.org/10.1016/j.jeem.2004.11.001</a>.

- Sanchirico J, Wilen J and Coleman C (2010).
"Optimal Rebuilding of A Metapopulation."
*American Journal of Agricultural Economics*, **92**.
ISSN 0002-9092, <a href="http://dx.doi.org/10.1093/ajae/aaq045">http://dx.doi.org/10.1093/ajae/aaq045</a>.
