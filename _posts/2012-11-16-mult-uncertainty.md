---
layout: post
category: ecology
tags: [multiple-uncertainty]
title: Multiple uncertainty corrected

---

Fixed the [multiple uncertainty calculation](http://www.carlboettiger.info/2012/11/01/multiple-uncertainty-corrections.html) implementation.  Code had transposed $\mathbb{I}$, also one of the $\mathbb{M}$ matrices.  Should still confirm final implementation.  In the below example each case has log-normal growth noise present.  The non-monotonic section of the measurement uncertainty

![](/assets/figures/2012-11-17-f6c225f69f-policyfunctions.png) 


[See notes on code changes inline.](https://github.com/cboettig/pdg_control/commit/954cea9310063150bb42567b19caa272b34d32c2)



#### Additional notes from walking through algoritm step by step.  


- $x$ index in the true state space
- $y$ index in the observed state space
- $h$ index in the true action 
- $q$ index in the policy/decision space

- $V[y,q]$ the Expected value of policy $q$ and observed state $y$
- $\Pi[x,h]$ the profit of a harvest of $h$ given a true stock of $x$
- $M[y,x]$ is the probability of a true state $x$ given an observed stock $y$.  (How does this relate to the probability the observed stock is $y$ given the true stock is $x$? Should be the transpose?  Is $M$ symmetric?)
- $I[h,q]$ is the probability of implementing a harvest $h$, given a quota set to $q$.   
- $Q[y,q]$ the Expected profit from a policy $q$ and observed state $y$.  In Einstein summation, $Q[y_k,q_l] = M[y_k, x_i] \Pi[x_i,h_j] I[h_j, q_l]$

$$M(y_1, x_1) (\Pi(x_1,h_1)I(h_1, q_1) + \Pi(x_1,h_2)I(h_2, q_1) + \dots) +  M(y_1, x_2) (\Pi(x_2,h_1)I(h_1, q_1) + \Pi(x_2,h_2)I(h_2, q_1) + \dots)  +\dots$$
- $[\tilde{y}_t, y_k, q_l] = M[\tilde{y}_t, \tilde{x}_s] M[y_k, x_i] f[\tilde{x}_s, x_i, h_j] I[h_j, q_l]$


## Misc


- [heatmap](http://flowingdata.com/2010/01/21/how-to-make-a-heatmap-a-quick-and-easy-solution/)
- [ggplot version](http://learnr.wordpress.com/2010/01/26/ggplot2-quick-heatmap-plotting/)



