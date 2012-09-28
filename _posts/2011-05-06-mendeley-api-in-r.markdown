---
comments: true
date: 2011-05-06 11:21:10
layout: post
slug: mendeley-hpc-in-r
title: Mendeley API in R
redirects: [/wordpress/archives/1614, /archives/1614]
categories:
- open-science
---

Started to implement the [Mendeley API](http://apidocs.mendeley.com/home/public-resources) in R, with much help and guidance from Prof. [Duncan Temple-Lang](http://www.stat.ucdavis.edu/~duncan/) in the Stats dept.  [R](http://www.r-project.org/) is a widely used statistical software environment, and this should facilitate real-time statistical analysis of the rich amount of publication data available in Mendeley.

My motivation is primarily pedagogical at the moment- Mendeley seems to have a nice modern API with both public and authentication-required elements (using OAuth).  Writing out the API gives me some good practice making GET requests in RCURL and handling JSON returns, and experiencing the bumps that go with this kind of work.

Duncan got us started with examples for [search](http://apidocs.mendeley.com/home/public-resources/search-terms) and [author](http://apidocs.mendeley.com/home/public-resources/stats-authors) stats, which are pretty straight forward to extend to the rest of their domain.  I've extended this to other stats functions (somehow tags returns empty, and publications returns the wrong format, a[ known issue](https://groups.google.com/d/topic/mendeley-open-api-developers/9rUZQBM7giQ/discussion)).

Implemented the other search methods, though could add some more functions to assist in parsing the returned data structure (returns a list with elements documents (whose elements are the entries), and various totals, as indicated). Seem to be functioning well.

Will have to come up with some interesting use cases, so far just the kind of things a human could do from the web interface, but hey, came across my grandpa's paper from [1950](http://api.mendeley.com/research/observations-on-the-flight-motor-of-diptera/).

We will have to get R's OAuth package working with CURL options in order to start exploring the user-specific methods.  More to follow, meanwhile, better get back to some research.

ADDED: Development now [up on github](https://github.com/cboettig/RMendeley).  Note package depends on [RCurl](http://cran.r-project.org/web/packages/RCurl/index.html) 1.6 (development version, hopefully up soon).
