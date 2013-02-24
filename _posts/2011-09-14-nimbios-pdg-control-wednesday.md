---
comments: true
date: 2011-09-14 14:54:29
layout: post
slug: nimbios-pdg-control-wednesday
title: 'pdg-control pdg-control: Wednesday'
redirects: [/wordpress/archives/2590, /archives/2590]
categories:
- ecology
tags:
- pdg-control
- pdg-control
---

Wednesday, August 14
8:00 Coffee & Breakfast at NIMBioS
8:45 Introduction to Day 3 (Donahue/Armsworth)
9:00 Training Problem Groups


#### Marie-Jose reflects on the sampling problem:





	
  * Optimization between effort and data.

	
  * Spatial autocorrelation challenges

	
  * periodic sampling challenges.

	
  * Fortin et al 1989

	
  * Carl asked: Nyquist frequency?

	
  * Spatial sampling the correct scale by maximum variance in wavelet scaling.




#### Frank reflects on our activities from a control engineer's perspective





	
  * MPC for fishery management - few long-sampling engineering examples.  HIV/tumor treatment may be one.




	
  * Optimal program for spawning:  "Chasing the cost function," i.e. What do you minimize when I reach for a pen? Time? Distance?  Ans: third derivative of arm angle (jerk).

	
  * Larva follow an open-loop program vs internal/external feedback?

	
  * Chemotaxis, thermostats, integral control.  simple, robust.  (what's the optimal control problem it solves?)


Sensitivity Analysis: to - model behavior, cost function, shadow prices (constraint).

Model accuracy: is adaptation necessary?  Transfer function example:

Consider

$$ \tau \frac{dx}{dt} = - x + k u $$

Taking Laplace transform we get transfer eqn:

$$ \frac{x}{u} = \frac{K}{\tau s + 1} $$

Then roots of denominator are the eigenvalues. More [here](http://en.wikipedia.org/wiki/Transfer_function).  Analyze with [Bode plots](http://en.wikipedia.org/wiki/Bode_plot): note that Frank's examples are similar in the part where you want control to be fast.

An engineer's approach to adaptive control grab-box:



	
  * Gain Scheduling

	
  * Model-Reference Adaptive Control

	
  * Self-Tuning (sorta suboptimal dual control)

	
  * Dual Control (active adaptive -- i.e. probe)


Paul: how does this inform our model complexity discussion?  Model complexity needed to achieve predictive power may exceed that needed to achieve the control power.



R = M S, data is model operator on parameters.

	
  * Control problem: $ S = M ^{-1} R $

	
  * Identification of model form: M?

	
  * Simulation: R?


Models are always wrong at high frequency (noise), and irrelevant at low frequency.  All that matters is the right frequency.  Timescales!  e.g. thermostat doesn't care about days, doesn't care about seconds.

Process-based sampling?  Sampling a timescale/spatial scale of what you know about system.

Frank: recall crazy amazing thing in chemotaxis (e. coli story) is sensitivity over 10^4 ranges by resetting its bandwidth.



My brainstorm on emerging key ideas:

	
  * Control at the right frequency (isn't predictive power).

	
  * PDG control -- because optimal solution requires too freq intervention.  because infrequent intervention implies nonlinear regime.





#### Problem I breakout:


1) state variables > controls.

Examples: Age structured fishery.  Eradicate a subset of species with single control. Active adaptive management.  Effort becomes state (i.e. control is tax).

Result isn't always pulsing/chattering, but different dynamics.  When is not relevant?  (Note: variables = controls gets chattering by convexity.  non-chattering solutions of state variable > control).

Sub in the dynamics, not at the equilbrium.  (Kellner et al. Fast-slow timescale of open access).

Convexity condition.  two state, one control.  One fast state:

$$ \dot x = F(x, y, h) $$

$$ \dot y = G (x,y) $$

$\dot y = 0 $ fast time scale.  how about y periodic?

Plug into $ \dot x $ eqn.  So 1 state, 1 control:

$ \dot x = F(x, \hat G(x), h) $

Have engineers solved the convexity problem?  How do they do the two-floor chattering problem.

Numerics: can they capture chattering?  Discrete time, they can in long-term.  Is chattering impossible to represent in polynomial function [collocation](http://en.wikipedia.org/wiki/Collocation_method).

Two controls, becoming one control $ d(h_1, h_2 ) < \epsilon $

Jim's conjecture: Chattering is always the case, but always at the noise, when state variables exceed control.

Performance between low-dimensional and high dimensional .

Franz Wirl's papers: steady state is stable limit cycle.



TASK: Continue work on model formulation/analysis
12:00 Lunch at NIMBioS




#### Training Problem III summary from morning break-out:


Consider when synchronized spawning is optimal.

Noise  enhanced performance. Geometric mean/arthmetic mean (random mover bet-hedges better).

"We believe in markets.  The ones that are sloppy don't exist any more."




#### Training Problem I morning breakout report:


General feedback.  Need glossary of terms (TREE review)

Do we want to exemplify differences between PDG and optimal, or just pursue unanswered control questions.

(1) state var > control vars.

Sufficient from the deterministic dynamics.

3 conjectures: (A) chattering always comes up when state var > control var.  (B) Chattering is always only as large as the noise. (C) Numerics.

Alan's convexity conjecture: Can we collapse into the objective function in chattering examples and show convexity.  Must substitute in the dynamics, not the equilibrium.  (prove chattering is better by subbing in periodic solutions).

(2) adjustment costs: decided this is motivated by (4) empirical differences

Postulate: more relevant when stochastics.




#### Training Problem II morning breakout report:


Parrotfish problem

Stochastic or uncertain

shocks

adjusting fishing

unknown system state



1:00 Training Problem Groups, shuffling expertise as needed
TASK: Continue work on model formulation/analysis
3:00 Break
3:15 Training Problem Groups
TASK: Develop plan of work going forward: task assignments, writing assignments
5:30 Walk to town for dinner
7:00 Optional Activity (TBA)
