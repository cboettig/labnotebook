---
comments: true
date: 2011-01-24 16:03:31
layout: post
slug: mcelreath-hierarchical-models
title: McElreath Hierarchical Models
redirects: [/wordpress/archives/839, /archives/839]
categories:
- ecology
tags: 
- seminar
---

CPB workshop on hierarchal modeling starts off today with Richard McElreath's introduction.[ref]These are my own notes as taken during the seminar and may not   accurately reflect everything.  I merely confirm with the speaker that   my notes are publicly visible.  My own commentary/thoughts indicated in   square brackets.  As these notes are taken directly during seminar (on my droid phone -- saves me transcribing, later) , please forgive  typos and shorthand.[/ref]  "This is a workshop, not a job talk, meaning I'm going to give away the tricks and you have to learn something.  For job talks you just show off."

Begins with a sample dataset: bloodpressure dist of individuals by city.  Non-hierarchical way: ignore city data, look at all variation of pop, or compare city means.  Hierarchical models will look at both within & between.

Intro to statistical models $ y \sim N(a + B x, \sigma) $.  Becomes hierarchical if the a's are also distributed - a model with "more than one level of stochastic sampling."  Individuals are clustered or have repeat sampling.

Compares to old approach: fixed (constant) effects (instead of random) each neighborhood gets an id, rather than coming from a distribution.  (Cites Gelman 2005 rant on meanings of random effects.)   We'll call our stoch approach "varying effects."  Nice when (a) not enough data or (b) don't care about identity of division.  Fixed effect makes sense sometimes; groups are genders, or groups are ordered, etc.

Common types: varying intercepts, varying slopes.  (All code on smartsite, "I didn't really saw her in half legs were tucked up in the box."  )  gives lme4 lmer() examples, if both vary, can also covary.

Considers Bryk schools math achievement data.  Mentions centering data.  Examples of regression.  Robustness testing by changing model structure.

---- end of in-seminar notes ---.

Nice basic introduction; tomorrow will take us into model fitting by maximum likelihood rest of the week will take us through to Bayesian hierarchical models, MCMC and Gibbs sampling.  Schedule here: [http://cpb.ucdavis.edu/Workshops.html](http://cpb.ucdavis.edu/Workshops.html)
