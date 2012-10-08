---
comments: true
date: 2011-05-06 19:24:03
layout: post
slug: reproducible-research-large-data-sets-and-si2
title: 'Reproducible Research, Large data sets, and SI2 '
redirects: [/wordpress/archives/1592, /archives/1592]
categories:
- open-science
---

What follows are my notes from May 6th, 2011 expressing the ideas that would ultimately coalesce into the [rOpenSci](ropensci.org) project.  Much of this was turned into an email to Duncan and Todd, whose feedback was invaluable in working through this, and several others.  (The reference to SI2 refers to [an NSF call](http://www.nsf.gov/pubs/2011/nsf11539/nsf11539.htm) from about that time, which also stimulated my thinking on this matter.) Since then I've learned quite a bit about these tools, with which I now feel quite comfortable.  I stumbled across this private note in my notebook today, and figured it could take it's place as part of my public notebook.    




### Goals:




> I'd love to know something about how to interface with common web-based APIs.  Somehow I feel that means knowing about OAuth, JSON, CURL, knowing what HTTP GET and PUT commands and millions of other things are.  I feel like there are some basic building blocks that if I knew, I could look at pages l[ike this one,](http://apidocs.mendeley.com/home/public-resources/search-terms) and say, oh, I know how to implement that capability in R.  Unfortunately I still feel like a fish out of water without a clue where to start on most of this.  No one in my department or anyone else that I regularly interact with does this kind of stuff, with the possible exception of statcompsci, so I don't know where to start.  I'm also a bit worried that actually implementing anything that could successfully be distributed to other users would require more than I'd be capable of, and I should figure out how to get a team of people involved.

Why am I interested in this stuff anyway?  Two (related) reasons: I'm very interested in structuring scientific workflow around reproducible research, and I'm very interested in large data.  The two go hand in hand in many ways.

I'm interested in large data applications (like this TreeBASE project) because my field has somehow managed to have some of the most progressive policies in data archiving and data sharing (through DataDryad, and DataONE, with [mandatory archiving](http://carlboettiger.info/archives/502) in many of our journals) while simultaneously having the some of the least-well trained scientists to tackle them.  I organized a workshop around this stuff in my department, hardly anyone came but the [video archives](http://carlboettiger.info/archives/1284) have been popular online...)

About a year and a half ago, I began an experiment of keeping an open lab notebook (initially on a wiki, now with wordpress).  This brought me into interactions with an online community that is very interested in web-based tools for science, open science, data sharing, collaborative research, social media, etc., which has inspired me to learn more about how these tools could help me work with greater efficiency and greater impact.

I'd really like to figure out what's worth learning, what's worth finding people who already know and collaborating, and how to do each.





#### SI2 people to contact?





	
  * Duncan Temple Lang

	
  * Todd Vision

	
  * Heather Piwowar,

	
  * Ethan White,

	
  * Patricia Cruze

        
  * Rutger Vos,




