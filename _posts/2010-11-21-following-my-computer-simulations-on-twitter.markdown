---
comments: true
date: 2010-11-21 21:28:20
layout: post
slug: following-my-computer-simulations-on-twitter
title: Making R twitter?
redirects: [/wordpress/archives/375, /archives/375]
categories:
- open-science
---

I'm running quite a few of my analyses on my remote server, a 16 core, 32 GB ram, Ubuntu server with Tesla GPU, named "zero" (we're creative folks).  It's easy to start lots of simulations (from ssh), harder to track when they are finished and verify results.  No longer -- "zero" now uses social media to share what she's up to.  Find her on twitter: @tweeting_cpu

![]( http://farm5.staticflickr.com/4089/5195954426_a378881339_o.png )


![]( http://farm5.staticflickr.com/4125/5197185652_e11112045a_o.png )



### Social Computation





	
  * Provides automated updating of simulation status and error messages

	
  * Integrates into my workflow, can follow the computer from my own twitter account

	
  * Sends figures to flickr with tags and descriptions

	
  * Sends figures to my social network software so I can see them in real-time.

	
  * Uses mentions (@cboettig) to trigger on-screen notification

	
  * Uses hashtags to track progress of different simulations running at the same time.

	
  * Creates a search-able log of simulations with timestamps

	
  * Can embed the log using RSS or other features standard to twitter.

	
  * All communication can be completely private, shared with a chosen network, or shared with the world (open science).


![]( http://farm5.staticflickr.com/4112/5196584707_663796eb6e_o.png )



### The Setup





	
  * A Twitter account: [@tweeting_cpu](http://twitter.com/#%21/tweeting_cpu)

	
  * [Command-line twitter client](http://jeffmiller.github.com/2010/05/31/twitter-from-the-command-line-in-python-using-oauth)

	
  * Flickr account (can be shared with the user)

	
  * [Command-line flickr uploader](http://search.cpan.org/~cpb/Flickr-Upload/flickr_upload)


While I have given the computer it's own twitter account, I have it post to my own flickr account since I've already been using that as my results repository and it is a pro account.  Having a separate flickr account for tweeting_cpu does give me a social object I can follow via flickr however.

Note that there are many other command-line twitter programs which no longer work since twitter adopted OAuth, including the [twitteR](http://cran.r-project.org/web/packages/twitteR/index.html) R package on CRAN, but this python script is perfect. Both commandline apps require a little configuration file with authentication details, but are well documented and easy to set up.

With this setup, I can add social instructions inside my R code using the system() call:

    
    system(' flickr_upload --tag="phylogenetics" ou3_v_ou11.png ')
    system('hpc-autotweets "Simulation complete, results here: http://bit.ly/aacEr1" ')


The image is filed with appropriate metadata in the flickr collection which manages all my simulation results.  Now I can follow my computer.  I can also embed my computer's latest tweets into my notebook using the rss feed:


Next: exploring how this can help me keep a tighter link between the code that produced the images and the images themselves.  Currently rely mostly on timestamps and context, would be great if it could make sure the code was committed to git before running, and grabbing the commit id to add to the metadata.
