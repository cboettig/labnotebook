---
comments: true
date: 2012-03-11 23:52:23
layout: post
slug: parameter-uncertainty-in-stochastic-control-problems-2
title: Parameter uncertainty in stochastic control problems
redirects: [/wordpress/archives/4276, /archives/4276]
categories:
- ecology
tags:
- pdg-control
- reading
---

Day 3 of my short-term visitor stay before the working group starts.





  * **Wednesday**: Travel


  * **Thursday**: 8:45 Group Meeting: Paul, Michael, Lance, Dan, Jake, Carl.  

Training problem II discussion -- problem taxonomy: [stochastic ](www.carlboettiger.info/archives/3248), model uncertainty, parameter uncertainty, state uncertainty.  Learning on uncertainty (passive/adaptive active management) in the uncertainty cases, all of which increase the parameter space.  Evening with Paul's students.  


  * **Friday** Writing up Training problem II with Jake, Michael.  O'Meara meeting.  Evening of old time fiddle and being locked out of NIMBioS.  


  * **Saturday** Catching up on reading. Writing down transition matrices to account for the learning is non-trivial.


  * **Sunday** Writing Training problem II with Jake.  Brief meeting with Eric & Paul.  





## Literature



Still catching up on literature from 70s and 80s on optimal control with an uncertain parameter (uncertain model, or possibly, uncertain state).

﻿Nicest walk through of different approaches in this collection is probably Ludwig & Walters, 1982, introducing the non-adaptive ("average equilibrium") strategy, passive adaptive management ("Myopic Bayes") and active adaptive management (also with Bayesian updating) approach (computed through policy iteration rather than value iteration (SDP)).

(Ludwig & Hilborn, 1983) discuss difficulties in estimating stock abundance, but in the context of not knowing the parameter values, as opposed to inherent errors in the stock size.

(Walters & Hilborn, 1976) give a nice walk-through in an example with a 3D state space (stock size, mean + covariance matrix for distribution of parameters), where the updating rules come from the regression formulae:

$$ a_n = a_{n-1} - \frac{\hat P_{n-1} x_n }{ \sigma^2 + x^T_n \hat P_{n-1} x_n} (a_{n-1}^T x_n - y_n ) $$

$$ \hat P_n = \hat P_{n-1} - \frac{\hat P_{n-1} x_n x^T_n \hat P_{n-1} }{ \sigma^2 + \hat x^T_n P_{n-1} x_n} $$

Where $ \sigma^2 $ is the regression error variance, and for the Ricker model,



$$y_n = \ln \left(\frac{R_t}{S_{t-1}}\right) $$
$$ x_n = \left[ 1 \choose -S_{t-1} \right] $$
$$ a_n = \left[ \alpha_t \choose \beta_t \right] $$



Their annual review, (Walters & Hilborn, 1978), is a nice broad perspective without details for implementation.  Surprised that ch 8 of Walters 86 textbook doesn't get beyond the basics of Bellman's value iteration.  Mangel's 1985 [edited volume](http://www.amazon.com/Decision-uncertain-resource-Mathematics-Engineering/dp/0124687202/ref=ntt_at_ep_dpt_3) seems to do a nice job (but the Google copy doesn't quite cut it).



## Two-armed bandit problem



Imagine machine 1 has payoff $ \alpha_1 $ with unknown probability $ p_1 $, machine 2 has payoff $ \alpha_2 $ with known probability $ p_2 $.



Pr( $k $ wins in $m $ gambles $ | p_1 $ ) is `dbinom(k, m, p_1)`
and we need a good prior density $f(p_1) $ as `dbeta(x, alpha, beta)` 
such that the posterior is also a beta density.



The value-to-go in the SDP solution is a function of the distribution parameters of the prior,

$$J_n(\alpha,\beta) = \max\left( \alpha_2 p_2 , \alpha_1 \frac{\alpha}{\alpha + \beta}\right) $$,



which just the integral over the posterior at that time, since no further information will be gained.
We can compute the earlier steps from this.





## Algorithmic implementations



Iadine's [Markov decision process toolbox for Matlab](http://www.inra.fr/mia/T//MDPtoolbox/index_category.html) provides nice clean algorithmic specifications for Q-learning, value-iteration, policy-iteration, etc.  Work will still be in specifying the transition matrices for these contrived state-spaces.



## Confused







  * Is Myopic Bayes (passive adaptive management) differ from Q learning? (which "gives the expected utility of taking a given action in a given state and following a fixed policy thereafter.") (i.e. do they agree for a given learning rate?)  Both are value-iteration updates.



    * Why use policy iteration for the active adaptive management solution and value iteration (stochastic dynamic programming/Bellman equation) for Myopic Bayes?


    * How are [partially observable Markov decision processes](http://en.wikipedia.org/wiki/Partially_observable_Markov_decision_process) different than just adding uncertainty to the observed state (a la Sethi et al, etc?)  In particular, why not include observations as part of the state space?







#### estimating what we don't know





Random ideas that have come up in discussions.
 * How not to do this: estimate confidence intervals Harvey, 1997, ([overconfidence effect](http://en.wikipedia.org/wiki/Overconfidence_effect))
 * Better: estimate largest reasonable value, smallest reasonable value.  Order matters
 * Better yet? Bet on outcomes (prediction market?)
Bueno de Mesquita (Bueno de Mesquita, 2010)




## References


- Ludwig D and Hilborn R (1983).
"Adaptive Probing Strategies For Age-Structured Fish Stocks."
*Canadian Journal of Fisheries And Aquatic Sciences*, **40**.
ISSN 0706-652X, <a href="http://dx.doi.org/10.1139/f83-075">http://dx.doi.org/10.1139/f83-075</a>.

- Walters C and Hilborn R (1976).
"Adaptive Control of Fishing Systems."
*Journal of The Fisheries Research Board of Canada*, **33**.
ISSN 0015-296X, <a href="http://dx.doi.org/10.1139/f76-017">http://dx.doi.org/10.1139/f76-017</a>.

- Walters C and Hilborn R (1978).
"Ecological Optimization And Adaptive Management."
*Annual Review of Ecology And Systematics*, **9**.
ISSN 0066-4162, <a href="http://dx.doi.org/10.1146/annurev.es.09.110178.001105">http://dx.doi.org/10.1146/annurev.es.09.110178.001105</a>.

- Bueno de Mesquita B (2010).
"Judging Judgment."
*Critical Review*, **22**.
ISSN 0891-3811, <a href="http://dx.doi.org/10.1080/08913811.2010.541686">http://dx.doi.org/10.1080/08913811.2010.541686</a>.



-  Confidence in Judgment, Nigel Harvey,  (1997) *Trends in Cognitive Sciences*, **1**    [10.1016/S1364-6613(97)01014-0](http://dx.doi.org/10.1016/S1364-6613(97)01014-0)
-  Optimal Harvesting With Imprecise Parameter Estimates, D. Ludwig, C.J. Walters,  (1982) *Ecological Modelling*, **14**    [10.1016/0304-3800(82)90023-0](http://dx.doi.org/10.1016/0304-3800(82)90023-0)
