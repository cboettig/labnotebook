---
comments: true
date: 2011-06-13 22:39:32
layout: post
slug: em-algorithm-2
title: EM Algorithm
redirects: [/wordpress/archives/1980, /archives/1980]
categories:
- computation 
tags:
- algorithms
---

Yaniv ran us through our second session on EM algorithms.  We implemented a simple case described in [this tutorial](http://www.stat.uiowa.edu/~kcowles/s166_2007/chang166.pdf).

[gist id=1028113]

Code doesn't reflect the abstraction of the algorithm into a proper Expectation step and Maximization step.  We attempted this generalization:

[gist id=1028122]

Missed something in framing this correctly, since the maximization step includes a function that doesn't depend on s[1].  Any ideas?
