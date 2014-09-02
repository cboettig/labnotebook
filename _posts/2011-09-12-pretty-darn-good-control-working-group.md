---
comments: true
date: 2011-09-12 12:49:39
layout: post
slug: pretty-darn-good-control-working-group
title: Pretty Darn Good Control Working Group
redirects: [/wordpress/archives/2585, /archives/2585]
categories:
- ecology
tags:
- pdg-control
- pdg-control
- warning-signals
---

Monday, August 12
8:00 Coffee & Breakfast at NIMBioS
8:45 Welcome to NIMBioS (Lou Gross, Director of NIMBioS)
9:00 Intro to the pdg-control Working Group (Paul Armsworth)
9:30 Introductions by each Working Group Participant
5-minute self-introduction to the group, including your background, expertise, and current work
10:30 Break
11:00 Introduction to Training Problem 1 & Discussion (Jim Sanchirico)


### Training problem 0: Optimal Control


Jim

maximize present discounted value:

$$\max_{h_t} \int_0^T e^{-rt} \Pi(h_t) dt  $$

Biological growth minus harvest.  Let's start with given: $ X_0, X_T $

$$ \dot x = F(x_t) -h_t $$

Instantaneous fishing profit function curvature assumptions: $ \Pi'(h_t) >0, \Pi''(h_t) <0 $ (Diminishing returns)

Solution:  Current Value Hamiltonian: $ H = e^{rt} \bar H $ (current value is instantaneous, present value is integrated forward)

$ \lambda $ would be lagrange multiplier but is a variable, a function of time.  Hence "Dynamic" optimization.  Is the "shadow price" or adjoint.  Solve:

$$ H = \Pi(h_t) + \lambda_t \left( F(x_t) -h_t \right) $$

Under optimality conditions:



	
  1. $ h_t \frac{dH}{dh_t} = 0 \forall t w/ h_t > 0 \Pi'(h_t) -\lambda_t $

	
  2. $ \dot \lambda - r \lambda_t = \frac{dH}{dx_t} = F'(x_t) $

	
  3. $ \dot x = F(x_t) - h_t$


Subbing out lambda equations:

$$ \dot h = \frac{\Pi ^{\prime}}{\Pi^{\prime\prime}} \left( r - F^{\prime}(x) \right) $$

$$ \dot x_t = F(x_t) - h_t $$

Why is it dynamic?

	
  * Durability: fish stock today faces fish stock tomorrow.

	
  * Adjustment costs: can't immediately change control.  Rate of changing control.  (come from $ Pi'' $


[Catenary Turnpike Theorem](http://www.jstor.org/stable/1814560)

note the stationary state is just setting value of leaving fish in water equal to rate of money it gets  $F^{\prime}(x) = r $

Note if $ \Pi $ depends on the stock value (i.e. more fish are easy to find, or you like having fish in the sea)

$$ F^{\prime}(x) + \frac{\Pi_x}{\Pi_h} = r $$

Work simple example if profit is linear in h, but depends on stock: price of fish is p.   $ \Pi(h,x) = (p - c(x)) h $  Solutions are bang-bang, etc...

Then marginial productivity = rate of return minus stock effect (searching costs, etc).

$$ F^{\prime}(x) = r - \frac{c'(x) h}{p-c(x)} $$

liquidation gain equals loss forever in taking out more fish.

$ p-c(x) = \frac{R^{\prime}(x)}{r} $

External change in fish price, then steady state just follows the rate of change:

$ F^{\prime}(x) + \frac{\dot p}{p} = r $

Singular path (steady state path):

What if harvest is constrained outside: "blocked intervals" changes dynamics.

General note in all this dynamic stuff: you want stock at steady state, but you can't just put it there, you have to harvest.  Hence canterary turnpike, etc.


### Paul Armsworth: training problem 1


constraints (limitations) on control

Applications of optimal control recommend policy that changes frequently.

Nonlinear relationship in age class

$$ N_1(t+1) = f(N(t)$$

$$N_{i+1}(t+1) = N_i(t) e^{\mu_i}, i \leq a  $$

$$N_{i+1}(t+1) = N_i(t) e^{\mu_i-q_iE(t)}, i > a  $$

Fishing effort level E.  Pulse fishing or chattering becomes optimal (trying to meet two constraints, like temperature on different floors, where can't meet both, but response time to one is faster than the other). Can see as convexity (Alan).

_So the full optimum isn't popular!  _Because no policy maker wants chattering as a solution.

Appears when number of state variables exceeds number of control variables.  (Jim can this be proven?)  Many things expand state space.

Another example: adding stochasticity (optimal inventory)

$$ N(t+1) = f(N(t) -h(t)) \varepsilon_t $$

Results in highly variable optimal quotas. At least in bluefin tuna, show policy is very non-responsive.  Alan: easier to raise than lower quotas. Jim: irreversible action extreme.

Uncertainty analysis: Predicted stock size when quota set vs observed value.  Note: you get more accurate estimate of the stock size more distantly in the past (more harvest size data).

Common fixes: quadratic/L2 penalty to changing quota.  L1 penalty, max change size.

Neubert 2003: chattering in marine reserves (infinitely many infentesimal reserves) silly assumptions (no cost)

Halpern 2011: optimal harvest rates differ for each of 22 targets.

Hobday & Hartman 2006 suggest moving time-area closure boundaries to react to satellite data.

Technologically, tracking is possible.  But how much variation is desirable?


### 12:00 Lunch at NIMBioS




### 1:00 Introduction to Training Problem 2 & Discussion (Alan Hastings)


Coral reef grazing model (analytic model by Mumby et al 2007) (Mumby _et. al._ 2007)

Macroalgae (grazed by parrotfish) overgrows coral, Coral, Turf. Grazed or dead coral both become turf.  T+M+C = constant, so:

$$ \frac{dM}{dt} = a MC - \frac{g M}{M+T}+\gamma MT $$

$$ \frac{dC}{dt} = (rT - d-aM)C $$

Multiple stable states.   a is overgrowth.

Parrotfish model:

$$ \frac{dM}{dt} = a MC - \frac{g(P) M}{M+T}+\gamma MT $$

$$ \frac{dC}{dt} = (rT - d-aM)C $$

$$ \frac{dP}{dt} = sP\left( 1-\frac{P}{K(C)}\right) - fP$$

K(C) is from territorial limits, rather than food limits.  (Blackwood _et. al._ 2010)

Adding habitat quality (Blackwood _et. al._ 2011).



	
  * Compare to a non-multiple stable states.

	
  * Carl Walters adaptive control: variance on posterior as a state variable (confidence in a parameter)

	
  * passive adaptive -- living with uncertainty -- don't perturb to learn, only to improve expectation.

	
  * active -- actually perturbing system

	
  * model choice. model averaging.

	
  * Advanced problem: aggregated model vs model complexity.




### 2:00 Introduction to Training Problem 3 & Discussion (Megan Donahue)


Understanding how biology does it's own control problems: life history switch:



	
  1. Constraint: tradeoff between growth R and fecundity F

	
  2. Optimality criterion: maximize reproduction at time T

	
  3. Optimal strategy: switch effort from all F to all R at time $t_s$


Evolutionary context: optimal only in light of evolution.  heritablity limitations. differing historical context. optimal plasticity ("adaptive management").

ultimate (e.g. fitness) vs proximate (e.g. food) causation.

Optimal larval return strategy.  (Intro to larval forms of marine creatures)

Exploiting water column current flow (ARMSWORTH, 2001)

Delayed and non-delayed swimming.  Stochastic dynamic programming (Irisson _et. al._ 2004)

Megan: "You guys probably have another word for it in economics"  Jim: "Same thing". (Alan throws Jim candy)

Highly stochastic: in the sense that 1 :10^6 survive to settle.

Objective uncertainty: maximize time in plankton? survivorship to settlement? body size at settlement?  Is arithmetic mean lifetime fitness the right measure?  Sweepstakes (does one organism's progeny make up most of the population?)

Jim: Is this an optimal stopping time question?

Alan: An approximate solution to the optimal problem or optimal solution to the approximate problem?

Choosing among a set of potentially equivalent models.

Jim: When do we get 90% there with a low-dimensional solution?   (Advanced problem 1 & 2 start to address this). Does this make a difference when stochasticity enters?  (Jim and Alan's paper of adding more species to management story doesn't matter much).

In policy, we only want robust solutions when forced to be non-optimal; i.e. simple model or inflexible policy.  Michael: life-history/nature optimizes full problem, not the simplified one.  Does this mean it is less robust.

Paul Ludwig's paper where the simple model outperforms the generating complex model.

3:00 Break
3:15 Self-select into small groups to discuss Training Problems
TASK: Identify 1-3 focal questions. What the biological problem? What's the control problem?


### Training Problem 1 Questions





	
  * Theory:  state variable exceed control variable: we want the non-optimal control.


	
    1. When does this give chattering?

	
    2. Is there a convexity analog?

	
    3. Does this non-optimal solution to high-state-variable case do better than a an optimal solution to lower-state model?


	
  * Adjustment Costs


	
    1. optimal vs suboptimal

	
    2. Compare optimal under different constrains irriversability/asymmetric penalty


	
  * Overages/Underages

	
  * Empirical: volatility of stock-size estimate vs volatility of management adjustment.


5:00 NIMBioS Reception
6:15 Walk into town for dinner
7:30 Optional Activity: Contradancing at the Laurel Theater (2 blocks from NIMBioS)

Participant list


# [Pretty Darn Good' Control](http://www.nimbios.org/workinggroups/WG_PDG)









Participant
Institutional affiliation
Meetings





**Paul Armsworth***


Ecology & Evolutionary Biology, Univ. of Tennessee


1






Michael Bode


Adv. Environmental Decision Analysis, Univ. of Melbourne, Australia


1






Carl Boettiger


Univ. of California, Davis


1






**Megan Donahue***


Marine Biology, Univ. of Hawaii, Kaneohe


1






Frank Doyle


Chemical Engineering, Univ. of California, Santa Barbara


1






Raissa D'Souza


Univ. of California, Davis; Santa Fe Institute


-






Marie-Josee Fortin


Zoology, Univ. of Toronto


1






**Alan Hastings***


Environmental Science & Policy, Univ. of California, Davis


1






Jacob LaRiviere


Economics, Univ. of Tennessee


1






Claire Paris


Marine Science, Univ. of Miami


1






Jim Sanchirico


Environmental Science & Policy, Univ. of California, Davis


1






**Carl Toews***


Mathematics, Duquesne Univ.


1




*Group organizers
Mtg 1: Sep 12-15, 2011 (preliminary)


### 

## References


- Mumby P, Hastings A and Edwards H (2007).
"Thresholds And The Resilience of Caribbean Coral Reefs."
*Nature*, **450**.
ISSN 0028-0836, <a href="http://dx.doi.org/10.1038/nature06252">http://dx.doi.org/10.1038/nature06252</a>.

- Blackwood J, Hastings A and Mumby P (2010).
"The Effect of Fishing on Hysteresis in Caribbean Coral Reefs."
*Theoretical Ecology*, **5**.
ISSN 1874-1738, <a href="http://dx.doi.org/10.1007/s12080-010-0102-0">http://dx.doi.org/10.1007/s12080-010-0102-0</a>.

- Blackwood J, Hastings A and Mumby P (2011).
"A Model-Based Approach to Determine The Long-Term Effects of Multiple Interacting Stressors on Coral Reefs."
*Ecological Applications*, **21**.
ISSN 1051-0761, <a href="http://dx.doi.org/10.1890/10-2195.1">http://dx.doi.org/10.1890/10-2195.1</a>.

- ARMSWORTH P (2001).
"Directed Motion in The Sea: Efficient Swimming by Reef Fish Larvae."
*Journal of Theoretical Biology*, **210**.
ISSN 00225193, <a href="http://dx.doi.org/10.1006/jtbi.2001.2299">http://dx.doi.org/10.1006/jtbi.2001.2299</a>.

- Irisson J, LeVan A, Lara M and Planes S (2004).
"Strategies And Trajectories of Coral Reef Fish Larvae Optimizing Self-Recruitment."
*Journal of Theoretical Biology*, **227**.
ISSN 00225193, <a href="http://dx.doi.org/10.1016/j.jtbi.2003.10.016">http://dx.doi.org/10.1016/j.jtbi.2003.10.016</a>.
