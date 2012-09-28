---
comments: true
date: 2010-12-23 19:08:58
layout: post
slug: writing-cloud-hpc-and-scio11
title: 'Writing, Cloud Computing, and #scio11'
redirects: [/wordpress/archives/660, /archives/660]
categories:
- open-science
---

Working on a few things in today's lab notebook entry.  Some more notes on exploring cloud computing tools, sketching out some ideas for my #scio11 science online panel discussion on open notebook science, and otherwise working on my phylogenetics mansucript.


### Cloud Computing


An interesting package was [announced over the r-sig-hpc](https://stat.ethz.ch/pipermail/r-sig-hpc/2010-December/000877.html) list today, creating an arbitrarily large Hadoop cluster out of Amazon EC2 instances directly from the R command line.  JD Long has been very responsive to my naive questions on setting it up, so I was able to quickly activate an Elastic Map Reduce account via Amazon Web Services and run the example code.  It installs an instance of R on each cluster at the time of launch, so it takes a moment to initialize and I'm not sure if it can handle calls in the parallel code that call other libraries (unless perhaps these are explicitly loaded in the parallel function?)  The code essentially provides a parallel (elastic map reduce) version of lapply, running the instances on different machines (EC2 instances) and then sewing the answers back together.

As the interface is delightfully simple, could possibly be useful even to run single amazon instances.  Simply set credentials, initialize a cluster of specified size and instance type, and then call the parallel lapply:

    
    setCredentials("yourKey", "yourSecretKey", setEnvironmentVariables=TRUE)
    myCluster <- createCluster(numInstances=5)
    emrlapply(...)
    


Look forward to learning more about the package, EMR, and testing it out.  Code available through [Google code hosting](http://code.google.com/p/segue/).


### Science Online 2011


Getting ready for Science Online Conference.  Finalizing room share with Mark Hahnel and touching base with Jean-Claude Bradley and Tony Williams about our panel on Open Notebook Science.  Jean-Claude describes that we'll have a short introduction before launching into the panel discussion.  His introduction will focus on how and why they can convert ONS data to web services (like ChemSpider, which Tony represents).  Provide a nice parallel to what I'm trying to do integrating this notebook into web services.  Using this notebook space to brainstorm a bit what I can contribute/would like to cover in the session.

Think my intro will try to highlight these three things:
	
* Open Notebook Science for Theorists

As theorists, it should be easier for us to keep electronic lab notebooks than for empiricists.  We can blithely ignore all those discussions about having a laptops or ipads to write at the bench or gloves-on or gloves-off keyboards.  We have a machine within easy reach.  Most of the computational work is done on the computer already, where software solutions can track progress and changes automatically.  and yet... it isn't.

Perhaps the primary problem is that we're not taught to keep lab notebooks in the first place.  It might help if students in the sciences were taught software development practices like version managing, but we're not.  Capturing the abstract parts of theory is even harder.  I don't really know what the workflow of other theorists in my field looks like, even for people I work with closely.  I guess that's part of my desire to create an open notebook.
	
* Open Notebook Science from the perspective of a student

I started practicing open notebook science as a third year graduate student without input for or against the idea from my advisor or anyone else at my institution.  I suppose there are a variety of stages or positions from which someone might first start an open lab notebook, and a variety of ways to do it.  Each face a rather different set of challenges, and perhaps I can offer something of the student perspective.
	
* Integration of web services relevant to theory and computing

Integrating databases such as flickr/github/mendeley,  now also Amazon web services; hopefully the databases like dryad eventually.  I'm interested to learn about the more mature models of integrating with external databases and how to make the most of this.
	
* The social dimension

I've described my efforts as a "social lab notebook."  That's a little ambitious for something that no one else reads, let alone comments.  But it's a design principle of sorts.  I'm interested in how to do this effectively, and what potential it has to make better, faster, and farther reaching science.


### Writing


Also continuing my phylogenetics writing today, working on explaining the models.  (current version of [manuscript .tex file](https://github.com/cboettig/Comparative-Phylogenetics/commit/53df70adad4e5c39e3a6caa7ed5684c6c036d32e#diff-0) in github Phylogenetics repository).
