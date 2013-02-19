---
comments: true
date: 2011-07-25 17:58:55
layout: post
slug: monday-algorithms-discussion-group-em-finished
title: 'Monday: Algorithms Discussion Group, EM finished'
redirects: [/wordpress/archives/2215, /archives/2215]
categories:
- computation
tags:
- algorithms
---

Finished up the EM algorithm today.  Key was getting the right function to maximize.  Turns out wikipedia has a very [nice write up](http://en.wikipedia.org/wiki/Expectation-maximization_algorithm) of this very example, but in our notation:

$$  E_p \log(p f_1) + (1-E_p) \log( (1-p) f_2 )$$

Where $E_p$ comes from the expectation step.

Jamie has joined us and has set up a [github repository](https://github.com/ashander/adg) for the discussion group.  Find the successful [abstract algorithm](https://github.com/ashander/adg/blob/master/em/em3.R) there.
