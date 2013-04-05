---
layout: post
category: ecology
tags: 
- derivation
- prosecutor
- warning-signals
- adaptive-dynamics

---


I have often observed (e.g. `r citet("10.1098/rspb.2012.2085 ", "citesAsEvidence")`) that if purely stochastic transitions out of a potential well happen, then they happen fast (dispite the fact that waiting time for them to happen is very long).  Yesterday Marc mentioned an interesting proof of this from Don Ludwig, who was able to show that the waiting time to reach a large deviation in a time $t$, given that it reaches it at all, is of the same order as the return time from the large deviation to the equilibrium, $\log(L/\sigma)$.  That's an absolutely fascinating conclusion, indeed a bit stronger than even I had expected (the waiting time until an escape is observed rather different! -- of order $\exp(L^2/\sigma^2)$.  


Don's derivation is repeated in pages 302-311 Marc's "Theoretical Biologist's Toolbox," rather delightfully too (e.g. the "Kumura Maneuver", or sidenotes such as "it is also kind of fun to do a web search with key words ‘Dawson’s Integral’").  `r citet("http://www.pnas.org/content/82/22/7641.abstract", "citesForInformation")` provides a somewhat different derivation of the same result.  


## Return time 

The return time calculation is straight forward.  Consider our OU model 

$$dX = - X dt + \sigma dB_t$$

We ask for the return time into a neighborhood $\sigma$ of the origin, starting at $X_0 = L$ distant from the origin.  The deterministic solution 

$$ \tfrac{dx}{dt} = - x $$

implies $x_t = L (1 - e^{-t}) $, so setting $x_t = \sigma_t$ and solving for $t$, we find that $x_t$ is within $\sigma$ of $t$ in time $\log{L} - $\log{\sigma}$, or $\log{L/\sigma}$, as claimed.  

## Waiting time

The time we must wait before any trajectory can reach a given boundary is a classic hitting-time problem for the OU process that can be solved in several ways.  

## Exit time 

Most trajectories will thus return many times to the origin (stable point) before finally escaping.  But if we focus just on the part of the trajectory from some value near the origin, that eventually escapes without ever crossing the origin again, 

$$u_t(x,t) dt = Pr\left(\textrm{exit from }(0; L]\textrm{in the interval } (t, t + dt) \textrm{without having crossed} 0 | X(0) = x$$

We are interested in comparing the average time taken by trajectories exiting by time $t$ relative to the probability of exiting at all (i.e. as $t \to \infty$),

$$ T_c(x) = \frac{\int^{\infty}_0 t u_t(x,t) dt }{lim_{t \to \infty} u(x,t) }$$


