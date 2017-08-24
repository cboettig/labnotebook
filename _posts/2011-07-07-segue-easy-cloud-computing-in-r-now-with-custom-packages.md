---
comments: true
date: 2011-07-07 16:45:05
layout: post
slug: segue-easy-cloud-hpc-in-r-now-with-custom-packages
title: 'Segue: Easy cloud hpc in R, now with custom packages'
redirects: [/wordpress/archives/2133, /archives/2133]
categories:
- computation
tags:
- hpc
---

After a few helpful emails from package creator JD Long, I have the segue package running with custom R packages.  The package is [available](http://code.google.com/p/segue/source/checkout) on Google code.  With two lines of code I can start submitting jobs to very large clusters of computers on the Amazon cloud.  For a basic introduction to the package see Jeff Breen's [post](http://jeffreybreen.wordpress.com/2011/01/10/segue-r-to-amazon-elastic-mapreduce-hadoop/).

Quick notes on updating using [mercurial](http://mercurial.selenic.com/): Since I've already pulled the code using 

```bash
 hg clone https://segue.googlecode.com/hg/ segue 
```

to clone the repo, I did

```bash

hg pull https://segue.googlecode.com/hg/ 
hg update
R CMD INSTALL .

```


Okay, ready to test the segue package.  We will load the CRAN package (sde) which automatically loads dependencies as well, and my little custom [mcmcTools](https://github.com/cboettig/mcmcTools) package, which has no dependencies (these would have to be loaded manually).  

[gist id=1070581]



###  a few notes 





	
  * Be sure to double-check the cluster has shut down on the Amazon web interface.  Just exiting R doesn't mean the cluster closed and they aren't billing. 

	
  * Note that on launch of the cluster instance we have to pass along all the rObjects we want to have access to on the cluster using the rObjectsOnNodes option in a named list.  Failing to do so tripped me up earlier 

	
  * Note that emrlapply wants a list argument, 


```bash
as.list(1:2)
```

not a numeric vector, 

```bash
1:2
```



Earlier this morning, none of this was possible.  JD Long is a genius, and a fast-working one at that.  First he added the support for cran packages, and then for custom packages.  A few notes: package dependencies must be loaded explicitly.  Be patient with the instance start-up, mine took 11 minutes.  

**Note:** post updated 2011-07-08 to reflect JD's suggestion to use rObjectsOnNodes. now all is working well. Maybe also a thank-you to [Google+](https://plus.google.com/) for facilitating the last bit o troubleshooting.   

