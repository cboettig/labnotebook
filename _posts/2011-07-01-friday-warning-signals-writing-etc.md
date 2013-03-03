---
comments: true
date: 2011-07-01 17:57:59
layout: post
title: Friday, warning signals writing, etc
categories:
- ecology
tags: 
- warning-signals
- delayed-release
---

- 9-10a email, etc
- 10 am check simulations: Daphnia examples (Drake data) runs done.  A few examples, see neighboring plots in image database for the corresponding distributions and further examples.  Runtime of this code (click images for script) about 10 hours on 16 cores on zero.  



![200 sample points]( http://farm6.staticflickr.com/5277/5890100915_806042b402_o.png )

![50 sample points]( http://farm6.staticflickr.com/5316/5890100389_a5d5a1b852_o.png )

![25 sample points]( http://farm6.staticflickr.com/5034/5890100139_60b8246f09_o.png )


- launched ibm_analysis.R on zero, n10.  
- Writing writing... first full text draft done.  


Trying to get started on the centos cluster, some trouble submitting job to queue, see email discussion with Bill.  Initial config went fine:


- Copy ~/.ssh/ over for git access
- Copy .flickrrc over for flickr upload access
- Copy .bashrc, .inputrc over
- Copy ~/bin/ over for hpc-autotweets
- export PYTHONPATH=~/bin/ (or add to .bashrc)
- `easy_install -d ~/bin/ tweepy`

