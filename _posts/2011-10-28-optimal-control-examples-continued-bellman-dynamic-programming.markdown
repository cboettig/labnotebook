---
comments: true
date: 2011-10-28 23:23:12
layout: post
slug: optimal-control-examples-continued-bellman-dynamic-programming
title: 'Optimal Control examples continued: Bellman,  Dynamic Programming'
redirects: [/wordpress/archives/3076, /archives/3076]
categories:
- ecology
tags:
- pdg-control
- warning-signals
---

### Discrete-time state equation


Discrete-time solution appears to be all about **dynamic programming**

and a chance for me to remember that I'm out of practice writing recursive functions. It's just that in thinking about the problem, you start from the end, with the trivial subcase, and keep adding the layers. But the recursive function kinda starts at the beginning, and that trivial case is the exit condition. R doesn't seem very efficient with these recursive functions, so this might become a C sub-routine eventually.



#### Problem setup


We consider some discrete-time state equation for (fish stock, $x$) under some control parameter (harvest, $h$): 

$$ x_{t+1} = f(x_t, h) $$

We again have utility function, $\pi(h)$ for diminishing returns on fish harvest. Discrete time means we maximize over the discrete discounting rate $\beta$ and sum over intervals:

$$ \max_{h_t} \sum_{t=0}^T \beta^t \pi(h) $$

subject to the state equation above and some boundary conditions $x_0 = X_0, \qquad x_T = X_T$.  First-order conditions are:

$$ U'(h_t) = \beta U'(h_{t+1}) F'(x_{t+1} ) \forall t $$
and solution will use a dynamic programming approach of the following recursion

$$ V(x_t) = \max_h \left( U(h) + \beta V(x_{t+1} ) \right) $$ 

Which substituting in the state equation gives us:

$$ V(x_t) = \max_h \left( U(h) + \beta V( F(x_t)) \right) $$
Let's assume a discrete Ricker-style model:
$$ x_{t+1} = f(x,h) = x \exp \left( \alpha \left(1-\frac{x}{K}\right) \left( \frac{x-C}{K} \right) \right) - h x $$

The Ricker-style formulation in analogy to our continuous time [problem](http://www.carlboettiger.info/archives/3001), Alan suggests we actually consider the case by Myers et al., (Myers _et. al._ 1995)

$$N_{t+1} = \frac{r N_t^{\alpha}}{1+\frac{N_t^{\alpha}}{K} } $$

Trivial case of no cost at boundary, harvests everything.  
![](data:image/png;base64,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)




###  A simpler case 


Fish remaining are whatever wasn't harvested yet:
$$ x_{t+1} = x_t - h_t $$

Cost/profit of harvesting: Profit $p(t)$ per fish (possibly varies with year), but cost gets harder $c h^2$, $c << p(t)$, 
$$ U(h) = p h - c h^2 $$

The algorithm can be specified by recursion, 

```R

phi <- function(x) 300

J <- function(t,x){
  if(t < T)
    out <- U(t,x, h_star(t,x)) + beta*J(t+1, f(t,x, h_star(t,x)))
  else 
    out <- phi(x)
  out
}
 
h_star <- function(t,x){
    func <- function(h) U(t, x, h) + beta*J(t+1, f(t,x,h))
#    optimize(f=func, interval=c(0,1))[[1]]
    h <- seq(0,1000,length=500)
    cost <- sapply(h, func)
    i <- which.max(cost)
    h[i]
}

```

See [full code](https://github.com/cboettig/pdg_control/blob/2fedf60ae61dafb21badaf05f1a97c213d59b1d1/R/discrete_optimal_control.R).  

![](data:image/png;base64,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)


but this is terribly inefficient.  


A simple dynamic programming reference [here](http://frank.mtsu.edu/~berc/working/Zietz-DP-1.pdf).


### Stochastic Optimal Control


Looks like this needs a dynamic programming approach.  A us[eful reference. ](http://userpage.fu-berlin.de/~mtoussai/08-optimal-control/kappen-handout.pdf) 


### Higher-dimensional state equations


Can these lead to oscillating solutions in as the number of state equations increases? Depends on nature of constraints? Inequalities?


### Steps check list





	
  1. Simple boundary-value problem solution by collocation. [Example](http://www.carlboettiger.info/archives/3001).

	
  2. Chebychev polynomial collocation

	
  3. Harvest vs fishing effort as control variable.

	
  4. Solution under inequality bounds

	
  5. Discrete-time state equations

	
  6. Stochastic Control

	
  7. Parrotfish 3 dimensional system, Horan 2 dimensional system.  See (Mumby _et. al._ 2007), (Blackwood _et. al._ 2010) (Horan _et. al._ 2011)

	
  8. Uncertainty




### 
## References

<p>Myers R, Barrowman N, Hutchings J and Rosenberg A (1995).
&ldquo;Population Dynamics of Exploited Fish Stocks at Low Population Levels.&rdquo;
<EM>Science</EM>, <B>269</B>.
ISSN 0036-8075, <a href="http://dx.doi.org/10.1126/science.269.5227.1106">http://dx.doi.org/10.1126/science.269.5227.1106</a>.
<p>Mumby P, Hastings A and Edwards H (2007).
&ldquo;Thresholds And The Resilience of Caribbean Coral Reefs.&rdquo;
<EM>Nature</EM>, <B>450</B>.
ISSN 0028-0836, <a href="http://dx.doi.org/10.1038/nature06252">http://dx.doi.org/10.1038/nature06252</a>.
<p>Blackwood J, Hastings A and Mumby P (2010).
&ldquo;The Effect of Fishing on Hysteresis in Caribbean Coral Reefs.&rdquo;
<EM>Theoretical Ecology</EM>, <B>5</B>.
ISSN 1874-1738, <a href="http://dx.doi.org/10.1007/s12080-010-0102-0">http://dx.doi.org/10.1007/s12080-010-0102-0</a>.
<p>Horan R, Fenichel E, Drury K and Lodge D (2011).
&ldquo;Managing Ecological Thresholds in Coupled Environmental-Human Systems.&rdquo;
<EM>Proceedings of The National Academy of Sciences</EM>, <B>108</B>.
ISSN 0027-8424, <a href="http://dx.doi.org/10.1073/pnas.1005431108">http://dx.doi.org/10.1073/pnas.1005431108</a>.
