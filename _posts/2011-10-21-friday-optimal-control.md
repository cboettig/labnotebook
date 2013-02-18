---
comments: true
date: 2011-10-21 23:15:08
layout: post
slug: friday-optimal-control
title: 'Friday: Optimal Control'
redirects: [/wordpress/archives/2972, /archives/2972]
categories:
- ecology
tags:
- warning-signals
---

## Optimal control


Imagine we're trying to minimize $J = \theta( y(t_F), t_F)$

subject to both the state equations: $\dot y = f(y(t), u(t))$, Note these are continuous, applying at all times $t$.

and boundary conditions: $\psi(y(t_F), u(t_F), t_F) = 0$. These are discrete, applying only at fixed time $t_F $.  We have to put the continuous constraint in as an integral:

$$ \hat J = \left[\phi + \mathbf{\nu}^T \psi \right]_{t_F} - \int_{t_I}^{t_F} \mathbf{\lambda}^T \left(\dot{\mathbf{y}} - f(\mathbf{y}(t),\mathbf{u}(t)) \right) dt $$

compare to the Lagrangian minimizing $F(x)$ under the constraint $c(\mathbf{x} ) = 0$

$$ F(\mathbf{x}) - \mathbf{\lambda}^T \mathbf{c}(\mathbf{x}) = F(\mathbf{x}) - \sum_{i=1}^m \lambda_i c_i(\mathbf{x}) $$

We can add the discrete boundary conditions in with classic Lagrange multiplier

[Differences](http://en.wikipedia.org/wiki/Hamiltonian_(control_theory)) between Hamiltonian of Pontryagin and that in mechanics. Why didn't anyone tell me about [this paper](https://netfiles.uiuc.edu/liberzon/www/teaching/sussmann-willems.pdf)!


### Sample problem


from page 353 (10.6.10), Judd

Maximize the objective function:
$$ \max_c \int_0^T e^{-\rho t} u(c) dt $$
s.t. $$\dot A = f(A) + w(t) -c(t) $$
$$ A(0) = A(T) = 0 $$

with w(t) wage rate at time t
A(t) assets at ime t,
and f(A) the return on invested assets

From the statement of the problem, we have:
the Hamiltonian: $H = u(c) + \lambda ( f(A) + w(t) -c )$
and the costate eqn: $\dot \lambda = \lambda (\rho - f'(A) )$
and bdry conditions.

assuming u concave in c, the maximum principle gives us:
the first order condition that:
$$ 0 = \partial_c H = u'(c) - \lambda $$

So we're left with a nice ODE system:
$$ \dot A = f(A) + w(t) - C(\lambda) $$
$$ \dot \lambda = \lambda (\rho - f'(A)) $$
$$ A(0) = A(T) = 0 $$

Let's assume functional forms for the utility:
$$ u(c) = c^{1+\gamma}/(1+\gamma) $$
and the asset return:
$$ f(A) = rA $$

Then our system becomes
$$ \dot A = rA + w(t) - c(t) $$
$$ \dot \lambda = \lambda (\rho - r ) $$

From the max principle of Hamiltonian, first order condition
$$ 0 = \partial_c H $$, so
$$ u'(c) -\lambda = c^{\gamma} -\lambda $$
$$ \lambda = c^{\gamma} $$
$$ \frac{d\lambda}{dt} = \frac{d\lambda}{dc}\frac{d c}{dt} $$
$$ \frac{d\lambda}{dc} = \gamma c^{\gamma} $$
which we sub into the costate equation to get
$$ \frac{d\lambda}{dt} = c^{\gamma} (\rho - r) $$
$$ \gamma c^\gamma \frac{dc}{dt} = c^{\gamma} (\rho - r) $$
which simplfiies to:
$$ \frac{dc}{dt} = \frac{c}{\gamma} (\rho - r) $$

and our second equation is still:
$$ \dot A = rA + w(t) - c(t) $$
And our boundary conditions:
$$ A(0) = A(T) = 0 $$

So a nice ODE BVP we're ready to solve.  




