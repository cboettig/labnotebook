---
comments: true
date: 2010-12-11 03:44:54
layout: post
slug: socialr-an-r-package-to-track-the-status-of-computations-with-social-network-tools
title: 'socialR: Reproducible Research & Notebook integration with R'
redirects: [/wordpress/archives/565, /archives/565]
categories:
- open-science
tags:
- R
---

I've created an R package that uses social media tools for reproducible research.  The goal of the package is this: whenever I run a code, output figures are automatically added to my figure repository (Flickr), linked to the timestamped version of the code that produced them in the code repository.  Figures should be tagged by project and be embedded selectively or automatically into this lab notebook.  The basic workflow of the notebook looks like this:[ref]Diagram of my notebook as presented at Science Online, 2011, see other slides in my [entry on this](http://www.carlboettiger.info/archives/792).[/ref]

![]( http://farm6.staticflickr.com/5259/5471680767_34c350314e_o.png )


To do this, I use a few simple R functions that I wrap around  the system command-line programs git, flickr_upload, and hpc-autotweets to enable monitoring of my simulations through social media. The package has it's own [git repository here](https://github.com/cboettig/socialR).  This is a rather custom development to make for rapid deployment on my own machines, and depends largely on Linux tools external to R, so it may not be easily deployed by others.  See my earlier post, [Making R Twitter](http://www.carlboettiger.info/archives/375), for examples and back story.

![]( http://farm5.staticflickr.com/4112/5196584707_663796eb6e_o.png )



## Basic Features


All of these tasks are run by wrapping any plot command with my command "social_plot()"



	
  * Push the running code version to Github.

	
  * Grab the git hashtag to reference this version of the code.

	
  * Push figures to Flickr as they complete.  Tags images appropriately and provide link to the code (version-stable, on Github) that produces them in the description.

	
  * Tweet notification of a figure upload, parameter values, links to code, and timestamp.



	
  * Tweet when an error occurs.




## Setup / Install





	
  1. Create a flickr account (need not be unique for the computer).

	
  2. Create a twitter account (preferably separate one for the machine).

	
  3. Install [flickr_upload](http://search.cpan.org/~cpb/Flickr-Upload/flickr_upload):

    
    ; sudo apt-get install libflickr-upload-perl




	
  4. Install [tweepy](https://github.com/joshthecoder/tweepy/blob/master/INSTALL):

    
    easy_install tweepy




(See link for more detailed instructions)
	
  5. [Configure flickr_upload credentials](http://search.cpan.org/~cpb/Flickr-Upload/flickr_upload#___top).

	
  6. [Configure OAuth for tweepy](http://jeffmiller.github.com/2010/05/31/twitter-from-the-command-line-in-python-using-oauth).




## Future modifications


Current program relies entirely on external command-line tools. Probably no easy solution to make this package self-contained and cross platform.  Still, a good bit of functionality can be added:



	
  * Add option to include the git log message.

	
  * Smart/more informative git commit messages

	
  * Add option/default to use truncated git commit ID numbers

	
  * Make Flickr discription actually link directly to code.

	
  * Make twitter statements include urls/actual links (to code, files)

	
  * Identify machine credentials?

	
  * Documentation still needed

	
  * Should verify if the git version is current

	
  * Grab a DOI for the object (i.e. using EZID from UC3?)


