---
comments: true
date: 2011-11-03 11:27:40
layout: post
title: Warning signals - noise response
categories:
- ecology
tags:
- warning-signals
- delayed-release
---

Dakos (Dakos _et. al._ 2012) considers $ \tfrac{dx}{dt} = f(x,p) $ and perturbs the parameter randomly to introduce variation.  Evaluating around an equilibrium where $  f(x^*, p^*) = 0 $, they expand to first order (citing (Ripa & Heino, 1999)):


$$ \frac{dx}{dt} = \partial_x f(x^*,p^*)(x-x^*)  +  \partial_p f(x^*,p^*) (p - p^*) $$

and taking $ \xi = x- x^* $, with some slight of hand argue this can be rewritten as an Ito process,

$$ d \xi = \lambda \xi dt + \partial_p f(x,p) dW $$

with eigenvalue $ \lambda = \partial_x f(x^*, p^*) $. 


Let's be a bit more careful.  First, we haven't said much about the noise process.  In general we'll want the noise process to have a timescale.  White noise Gaussian process won't track.  

Consider again $ \dot x(t) = f(x(t), p(t) $.  

The variance dynamics are given by the van Kampen expansion:
$$ \dot \sigma_x^2 = 2 \partial_x f(x,p)\sigma_x^2 + g(x,p) + \nu(x,p) $$

where $ g(x,t) $ is the intrinsic demographic noise, properly the second jump moment, and

$$ \nu(x,p) = 2\frac{ ( \partial_p f(x,p)  )^2 \sigma_p^2}{-\partial_x f(x,p) + 1/\tau_c} $$

Where $ \tau_c $ is the correlation time of the noise process (0 is white noise, which doesn't contribute, going towards infinity is very low-frequency noise, which the population can track).  The ability to track the noise requires $ \partial_x f(x,p) $ to be on order or larger than $ 1/\tau_c$, an ability it loses near a critical bifurcation where $ \partial_x f(x,p) \to 0 $.  Note that this term is missing from the Dakos et. al. treatment, essentially that treatment assumes that the noise is always substantially faster than the population dynamics, but not white, so that $ \nu \approx \partial_p f(x,p) \sigma_p^2 $.  

_This is all about tracking low-frequency variation though, which is not the kind of dynamics we're interested in.  _


Under this assumption, we might write:

$$ dx = f(x, p) dt + \sigma_x dB_1(t)+ \sigma_p | \partial_p f(x,p) | dB_2(t) $$

Now recall that the noisy parameter $ p $ will not generally be the parameter changing to drive the bifurcation.  

if $ \partial_p f(x,p) $ does not change as $ \partial_x f(x,p) \to 0$, then we need not worry.  

In there example, none of the $ \partial_p f(x,p) $ depend directly on $ c $, the bifurcation parameter, but all depend on $ x $, which decreases as the bifurcation approaches.  


So how about this case on environmental variation entering linearly? $ \partial p f(x) = h(x) \approx $ 


Decreasing x decreases the total noise in two of the examples:



## References


- Dakos V, van Nes E, D'Odorico P and Scheffer M (2012).
"Robustness of Variance And Autocorrelation as Indicators of Critical Slowing Down."
*Ecology*, **93**.
ISSN 0012-9658, <a href="http://dx.doi.org/10.1890/11-0889.1">http://dx.doi.org/10.1890/11-0889.1</a>.

- Ripa u and Heino u (1999).
"Linear Analysis Solves Two Puzzles in Population Dynamics: The Route to Extinction And Extinction in Coloured Environments."
*Ecology Letters*, **2**.
ISSN 1461-023X, <a href="http://dx.doi.org/10.1046/j.1461-0248.1999.00073.x">http://dx.doi.org/10.1046/j.1461-0248.1999.00073.x</a>.
