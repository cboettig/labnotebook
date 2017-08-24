---
comments: true
date: 2011-02-04 18:30:12
layout: post
slug: warning-signals-hpc
title: Warning signals & hpc
redirects: [/wordpress/archives/938, /archives/938]
categories:
- ecology
tags:
- warning-signals
---

Morning has been rather difficult trying to get simulations up and running.  Parallel library isn't running on zero or one, variety of errors that seemed to be machine dependent and reminiscent of the ~./sfCluster problem, 3 hrs of debugging revealed this was indeed just a bug in my updated code.  (In changing to my object-oriented simulate.gauss and update.gauss functions rather than calling the specific functions directly I hadn't updated all the function calls).


### Updated Runs


The comparison between tau curves compares simulations under the case with no loss in stability with the case of gradual loss (same initial stability but adds a gradual loss rate), while the Monte Carlo test compares simulations between models that have both been estimated from the same data set.  The latter two models are more similar, as estimates of constant rate put that constant near the average, whereas the Tau simulations leave it at the initial value of what it assumes in the changing rate model.  (That is, one has the model for the stability parameter $ R(t) = R_0$ while the other has $ R(t) = R_0 + m t$, and in the Tau comparison the $ R_o$ values agree, whereas in the estimation they differ.  )

[flickr-gallery mode="search" tags="stochpop" min_upload_date="2011-02-04 00:00:00" max_upload_date="2011-02-06 23:59:59"]



### WriTing


Have continued quite a bit of writing on the manuscript followed by a very good meeting with Alan.


### Trouble with Amazon AMIs


Some trouble with Amazon computing I still haven't solved.  I go to launch my amazon cloud using my existing AMIs and they don't exist

I go to re-add my amazon AMI using

    
    ec2-register cboettig-private-bucket/image.manifest.xml -n cboettig-ami -C ~/.ec2/cert-H....pem -K ~/.ec2/pk-H...pem --region us-west-1
    


and I get error

    
    Invalid or unaccessible kernel id in ami manifest:
    


Will have to post on the developer forum to see if I can learn what is going on, does not seem that AWS support covers technical questions.
