---
comments: true
date: 2011-04-05 12:27:16
layout: post
slug: updates-to-socialr-package
title: Updates to socialR package
redirects: [/wordpress/archives/1355, /archives/1355]
categories:
- open-science
---

Talking with Nick a bit about the socialR package, hope to find a chance to streamline the package a bit, move away from all system calls and interface directly with the APIs for Flickr, twitter, etc from R. This should avoid the command-line program dependencies and configurations I need to use currently.

Building my own API interfaces looks like it will require a good bit of work, meanwhile significant hope the community might develop reasonable packages to pull this off -- basic packages already exist for twitter and flickr.  Doesn't look like they are quite there though.


## Notes so far




### twitter & ROAuth





	
  * Jeff Gentry has twitteR & ROAuth.  Unable to install ROAuth at the moment

	
  * Needs liboauth on Ubuntu: http://liboauth.sourceforge.net, installs fine through



    
    ./configure
    make
    sudo make install





	
  * Looks like the [liboauth files](http://packages.ubuntu.com/natty/i386/liboauth0) will be packaged in the next Ubuntu release (natty).

	
  * But ROAuth still errors on install:



    
    ** building package indices ...
    ** testing if installed package can be loadedError in dyn.load(file, DLLpath = DLLpath, ...) :
    unable to load shared object '/home/cboettig/R/packages/ROAuth/libs/ROAuth.so':
    liboauth.so.0: cannot open shared object file: No such file or directoryERROR: loading failed





	
  * [twitteR](http://cran.r-project.org/web/packages/twitteR/) now suggests ROAuth, so perhaps works to send messages through twitter's OAuth authentication now?




### Rflickr


Duncan has an RFlickr package on http://www.omegahat.org from 2008, using RCurl and XML.   Install with

    
    install.packages("Rflickr", repos = "<a href="http://www.omegahat.org/R" target="_blank">http://www.omegahat.org/R</a>", type = "source")
    





	
  * Not much documentation beyond[ this XML doc](file:///home/cboettig/R/packages/Rflickr/doc/Rflickr.xml) to get started

	
  * Set up a new[ flickr app](http://www.flickr.com/services/apps/72157626435666824/) to get an API key and secret key for the application. successful.

	
  * Rflickr requests only read privileges (geared towards analyzing existing flickr data rather than uploading content).  Tried editing authenticate permissions, but still seems to request read privileges.  (see flickR modified package in sandbox).

	
  * Rflickr fails to get fob/token.  First time timeout is expected -- successfully still opens browser and requests approval.  Next time function is called it shouldn't have to request approval but just return a token, unfortunately no such luck.



    
    tok <- Rflickr::authenticate(api_key, secret)





	
  * So once again, I'm a bit stuck.




## Other notes





	
  * Added R-2.12 repository to sources.list, (since running Lucid LTS I've been using its packaged R-2.10; ROAuth requires 2.12)

	
  * Looks like Duncan also has an [RWordPress](http://www.omegahat.org/RWordPress/) package; intriguing.  Maybe I can get scripts to write my entire notebook entries automatically...


Well, all the time I have for some exploratory coding at the moment, will have to return to this later; and see if I can enlist some help.  Should follow up with Duncan and Jeff.
