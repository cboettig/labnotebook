---
comments: true
date: 2012-03-13 20:17:25
layout: post
slug: pdg-control-training-problem-2-update-to-group
title: pdg-control, Training Problem 2 update to group
redirects: [/wordpress/archives/4294, /archives/4294]
categories:
- ecology
tags:
- pdg-control
---

### Intrinsic Stochasticity





$$ x_{t+1} = z_t f(x_t, h_t) $$ 
$$ max_{h_t} \textrm{E} \left( \sum_t \Pi(h_t, x_t) \delta^t \right) $$
Measurement error $ m_t = z_m x_t $
Implementation error $ i_t = z_i h_t $



Next: Uncertainty = we can learn and hence decrease the uncertainty.  But state-space grows exponentially.



### Parametric Uncertainty





Biological state equation
$$ x_{t+1} = z_t f(x_t, h_t, a_t) P(a_t, \hat a_t, \sigma_t) $$
Bayesian Learning state equations
$$ \hat a_{t+1} = \textrm{Posterior}(a | x) = \frac{ L(x|a) \textrm{Prior}(a)}{\int  L(x|a) \textrm{Prior}(a) da } $$



Myopic learning just evolves the original SDP problem over the stopping time, integrating over the fixed uncertainty, but updates only to the next time-step.  It then implements the optimal next step, observes the system, updates the uncertainty, and then repeats the SDP over this updated uncertainty.  This scales as $n^2$ times the action-space, since the SDP need not consider possible belief states.

Adaptive learning includes the belief states in the state dynamics.  Even summarized as a distribution with two summary statistics, this involves a transition matrix of $n^6 $ entries for each possibility in the action-space.



### Model Uncertainty





Parameters of the models are fixed, and becomes parameter uncertainty, 
Updating rule is
$$ x_{t+1} = p_t f_1(x_t) + (1-p_t) f_2(x_t) $$
$$ p_{t+1} = \frac{p_t f_1(x_t)}{ p_t f_1(x_t) + (1-p_t) f_2(x_t) }$$





### State uncertainty





$$f(x,h) P(x,\mu, \sigma) $$
Belief MDP or POMDP.





## Misc Notes







  * Why is an Allee threshold different than the zero boundary in the other models? Stochastic rescue.  


  * Viable vs optimal control (Doyen) (Martinet & Doyen, 2007)




## References


- Martinet V and Doyen L (2007).
"Sustainability of an Economy With an Exhaustible Resource: A Viable Control Approach."
*Resource And Energy Economics*, **29**.
ISSN 09287655, <a href="http://dx.doi.org/10.1016/j.reseneeco.2006.03.003">http://dx.doi.org/10.1016/j.reseneeco.2006.03.003</a>.
