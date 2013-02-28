---
comments: true
date: 2011-01-24 11:13:08
layout: post
slug: felsenstein-web-
title: Felsenstein (web) seminar
redirects: [/wordpress/archives/832, /archives/832]
categories:
- evolution 
tags: 
- seminar
---

Joe Felsenstein on [phyloseminar](http://phyloseminar.org) ([watch here](http://evo.caltech.edu/evoGate/player/EVOPlayer.jnlp?fileToPlay=http://phyloseminar.org/recorded/10_felsenstein.evx)). This morning. [ref]These are my own notes as taken during the seminar and may not  accurately reflect everything.  I merely confirm with the speaker that  my notes are publicly visible.  My own commentary/thoughts indicated in  square brackets.[/ref] Discusses bridging population genetics & comparative methods: where does covariation in traits across a phylogeny come from?


### Morphometrics


Using morphometrics (digitized landmarks [though now we can do spherical harmonics, CT scans, etc])  to evolve on a phylogeny under BM rather than use that data to infer phylogeny.  Can we just stick these coordinate info on the tree?  No, need to correct for the arbitrary reference frame (rotation of fish position etc)  can we superimpose all fish?  Fr[![Watching Joe Felsenstein presenting on phyloseminar.org with ... on Twitpic](http://twitpic.com/show/thumb/3t1keu.jpg)](http://twitpic.com/3t1keu)ed was right, no, we cannot!  (Nice example on why we need differences).  Use Helmard transition (differences between running ave), loses no biological info, fixes translation but not rotation.  Rotate to max likelihood.

Infers covariance of landmark points after having the points move by isotropic BM in all points but two, shows can recover that covariance by fitting the BM models and dealing with rotation.


### Fossils


Ronquist and Felsenstein independently look at using fossils.  Consider possible rooting of fossils to different places on tree by likelihood.  Max likelihood minimizes the det of the cov matrix.  Works nicely on simulated example on time collaborated tree.  Proposes stretching/scaling tree to address dealing with trees that are not calibrated in real time.


### Threshold model


(Sewall Wright)  BM threshold, allows variation within species (just throw a Gaussian around a threshold evolving as a cts trait BM, represents species dist.  Attempt with a covariance matrix of discrete binary traits.

Future: more MCMC won't help.  Need bigger trees, but models will break down.  [No, models aren't more accurate on smaller scales]
