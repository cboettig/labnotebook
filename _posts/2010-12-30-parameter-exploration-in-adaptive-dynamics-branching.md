---
comments: true
date: 2010-12-30 16:52:09
layout: post
slug: parameter-exploration-in-adaptive-dynamics-branching
title: Parameter exploration in adaptive dynamics branching
redirects: [/wordpress/archives/693, /archives/693]
categories:
- ecology
tags:
- adaptive-dynamics
---

Ran a series of simulations overnight to explore aspects of time-to-branching at different phases of the branching process.  Still using only 16 replicates per data point, though increased maximum time for a run another order of magnitude to avoid timing out runs influencing the dataset for the slow-rate parameters.  Still seems to suggest a regime beyond which branching becomes completely improbable.  Not clear that the transition is a sharp as the Arrhenius approximation might suggest.

[flickr-gallery mode="tag" tags="2010dec30slideshow"]

([code](https://github.com/cboettig/AdaptiveDynamics/commit/20124cd7ce45f26f0cd40ad4896ea5358d655c63#diff-1))

([data](https://github.com/cboettig/AdaptiveDynamics/blob/2b25473689f6b4e9ba739a4373a3e457da9589c0/demos/waiting_times.Rdat))

[flickr-gallery mode="tag" tags="adaptivedynamics"]

I have found the interpretation of the larger scale simulations exploring the impact of the various parameters upon the branching times in different phases somewhat less clear than I had hoped.

The analytical approximation gives the suggestion of a sharp transition between a regime where branching is "easy", where the expected coexistence times are longer than the expected waiting time to the next mutation, and "hard", where they are shorter.  The mathematics reduce to an expression similar to the Arrhenius law, where there is a sharp transition between the probability of being in one state to being in the other depending on the noise level. 

I have been trying to get explore this through the simulations and figuring out the best way to visually represent this.  I have been using the contour plots you suggested to illustrate the coexistence times on the PIP, which is quite nice.  Unfortunately the analytic approximations don't seem to agree quantitatively outside a somewhat limited parameter range, more limited than I expected.  

I have also been exploring the time required to reach each of our four phases of the branching process as a function of the various parameters.  In this I hoped to see the sharp transition predicted by the approximation, but figuring out the best way to both explore and visualize this through the parameter space.  Hard to distinguish this from simply getting exponentially longer.  
