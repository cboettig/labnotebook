---
comments: true
date: 2011-09-15 08:59:36
layout: post
slug: nimbios-pdg-group-tasks
title: pdg-control PDG group, Tasks
redirects: [/wordpress/archives/2655, /archives/2655]
categories:
- ecology
tags:
- pdg-control
- pdg-control
---

## Tools





	
  * Sharing: Dropbox (Team account? 350 gigs/12 users $1670/yr)

	
  * Common language for training development: Matlab

	
  * Remote collaboration: GoToMeeting? Evo?

	
  * Code collaboration GitHub?




## Training problem I




### 1a) State vars > Control vars:


Can give solutions with chattering (periodic, possibly jumping between boundaries.)

Short-term priorities:

1) shared numerics.  **Jim** looks at collocation problem: how do they perform on periodic controls on the infinite time?  (If they can't work, we go to finite time.)

Need a way to be able to run each-other's numerics and get same result.

2) Literature exercise: Gather cases of chattering.  When it occurs is the objective linear or nonlinear? interior periodic or on boundary?  discrete or cts time?  Where are constraints relative to interior solution (i.e. are they outside the domain?)  Do they check second order sufficiency conditions for optimality? Theorem-like results?  **Paul with stick**, anyone who has seen this.

**Deadline: Oct 31st Conference call.  Drop box. **

3) Select an example in which to explore this.  Have simple form:

$$ \dot x = F(x,y, h) $$

$$ \dot y = G(x,y) $$

(could be discrete time instead.)  Predator-prey?  Age-structure?

4) Domain where controllability issues arise:

a) Put y on fast time scale (see Kellner et al. Kellner _et. al._ 2011)

slow down y (numerically.  Perturbation theory)

b) Introduce a second control $ \dot x = G(x,y, h_2) $

Constraint $ || h_2 || < \epsilon $

5) Convexity statement by subbing in equilibrium solns and periodic.

**Dan, Carl, Alan, Paul.**


### 1b) Adjustment costs


Refs: Everyone should read: Reed 79, Ludwig

Emperics - Paul/Jim long grass

$$ x_t = f(x_t -h_t) \epsilon_t $$

$$ J = \mathbb{E} \left( \sum h_t -c(h_t, h_{t-1} ) \right)$$

Where the velocity penalties/Regularization take one of these forms:

1) $ c(\Delta h)^2 $  Smoothing

2) $ c(\Delta h) $ Smoothing

3) $ c(\delta_{h_t \neq h_t-1} ) $  Transaction fee (i.e. Dan's toy version)

4) $ c_1 \chi_{h_t> h_{t-1}} $

5) traditional econ penalties $ ch_t^2 $, $ p(h_t)h_t $

Mechanistic motivation - **Jim**

Jobs: analytical -- approach path/ deterministic Led by: **Dan**, with **Jake, Paul**

Numerics: **Michael **stochastic dynamic programming.  (see Sethi 2005, JEEM (Sethi _et. al._ 2005)).

**Deadline: October 31st. Dan's analytics, Michael's numeric model. **

**Frank**: MPC exploration of numeric model.


## Training Problem II


2.0 One-dimensional Myers et al.
$$ N_t+1 = \frac{r N_t^{\alpha}}{1+\frac{N_t^{\alpha}}{K} }$$
$ \alpha > 1 $ gets allee effect.

$N_0 $ unknown. Cost of gathering information, profit from fishing.

Steps:

Constant strategy, single-step information gathering.

Information over time. Strategy varies.  Harvest control or effort control? Uncertain information from harvest? (Maybe go back to more classical framework here).

**Carl B, Carl T, Jake, Alan, Michael**

Literature review: **Jake, Marie-Josee, Alan**

Deadline: October 31st

2.0.1 Coral-algal-parrotfish

2.0.2 Commercial fishery sampling problem

**Alan wields stick.**


## Training Problem III


1) Run the spawning model on NIMBioS cluster. **Claire**

2) Spawning time as a single point optimization

3) Larval behavior during path.

Lit review: control model before the spawning?

Model predictive control?

**Megan wields stick. **

How tightly controlled is aggregation?  Let dispersion be open-loop.  Reverse engineer spawning controller.  Reverse active control.

Cluster scaling options: NIMBioS, Kraken, XSEDE.

Further skills

efficient stochastic dynamic programming (SDP).

Frank's people.  Jim's people.

TREE review? boxes and glossary.

Engineering control/model choice for control/timescales

Summary:







Participant
Tasks






**Paul Armsworth***


 Carry Stick for Prob. 1. Analytic for 1b.








Michael Bode


Lead numerics for 1b.  Prob 2.








Carl Boettiger


Lead Problem 2 coding.








**Megan Donahue***


Stick for Problem 3








Frank Doyle


MPC for problem 1b








Dan Ryan


Analytic 1b.








Marie-Josee Fortin


Literature for Prob 2.








**Alan Hastings***


Stick for Problem 2








Jacob LaRiviere


support analytic 1b, numeric 2








Claire Paris


Simulation on cluster








Jim Sanchirico


Numerics for 1a.  Mechanistic motivation 1b.  Share code. Recruit student








**Carl Toews***


Prob 2






*Group organizers

## References


- Sethi G, Costello C, Fisher A, Hanemann M and Karp L (2005).
"Fishery Management Under Multiple Uncertainty."
*Journal of Environmental Economics And Management*, **50**.
ISSN 00950696, <a href="http://dx.doi.org/10.1016/j.jeem.2004.11.005">http://dx.doi.org/10.1016/j.jeem.2004.11.005</a>.



-  Optimizing For Multiple Species And Multiple Values: Tradeoffs Inherent in Ecosystem-Based Fisheries Management, Julie B. Kellner, James N. Sanchirico, Alan Hastings, Peter J. Mumby,  (2011) *Conservation Letters*, **4**    [10.1111/j.1755-263X.2010.00132.x](http://dx.doi.org/10.1111/j.1755-263X.2010.00132.x)
