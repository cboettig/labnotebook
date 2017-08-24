---
comments: true
date: 2011-07-06 18:00:58
layout: post
slug: exact-simulation-by-the-gillespie-algorithm
title: Exact Simulation by the Gillespie Algorithm
redirects: [/wordpress/archives/2128, /archives/2128]
categories:
- ecology
tags:
- warning-signals
---

The Gillespie algorithm has two parts: (1) determine what event happens, (2) determine when it happens. Consider the system of equations
$$ \dot X_i = f_i(\vec X) $$

where the $f_i$ give the rates of creation and annihilation (negative and postive parts of $f_i(\vec X)$ must be listed seperately) for all species $x_i$.  We assume this gives the mean rate at which each event occurs, drawn from on exponential distribution.  We could simply draw the associated random exponential time for each reaction, and pick the minimum for which event occurs.  Instead, we use an equivalent method where we only have to draw a single, uniform random number to pick the event, and another uniform random number to compute the time until the next event.  The method is outlined below.  


	
1. Create a vector $\vec C$ that is the cumulative sum of these rates, 

$$ C_i = \sum_{j=1}^i f_j(\vec X) $$
	
2. Normalize this vector by dividing by the sum of all the rates, $\sum_i f_i(\vec X)$, so that its components range from $(0,1]$ with the value of the last component equal to one. 
3. Draw a uniform random number between 0 and 1 and find the smallest component of $\vec C$ bigger than that random number.  The index _i_ of that component indicates which event occurs.  
4. The time at which it occurs is simply an exponential random number whose mean rate is the sum of the individual rates. The best way to draw a random exponential with mean rate $\lambda$ is


$$ -\ln( r )/\lambda $$

Where $r$ is random number between 0 and 1, and advance the time counter by this interval.  






