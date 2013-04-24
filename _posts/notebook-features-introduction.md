---
title: "Notebook features: an introduction"
layout: post
published: false
category: open-science
tags: 
- notebook-technology
- blog

---


In keeping this open lab notebook, I have sought to address three goals
(in addition to all the traditional reasons for keeping a lab notebook)

1. Provide an educational resource 
2. Experiment with scientific infrastructure and tools for sharing and replicating research
3. Facilitate the rapid and open dissemination of scientific research

which are coincidentally evocative of [NSF's Broader
Impacts](http://www.nsf.gov/pubs/2007/nsf07046/nsf07046.jsp) areas.
In this series of posts I plan to explore and illustrate some of
my experiments with number 2 on this list, "experimenting with
scientific infrastructure" -- namely, some of the web-based tools
that advance the potential of this platform substantially beyond the
utility of the venerable paper bound notebook.  Many of these have
been documented in the notebook itself as I experiment with them (see
[#notebook-technology](http://www.carlboettiger.info/tags.html#notebook-technology)).
Not all of those experiments pan out and older tools and techniques
are often replaced with newer ones as I explore, and these posts are
usually more technical notes written to help me think through and remember
what I'm trying out.  In order to provide a more accessible snapshot of
notebook features, I thought it might be helpful to write a series of
posts describing these tools and techniques.


* Reproducible Research: embedding code and dynamic documents
* Hashes: providing an immutable and verifiable record of research
* Understanding use: notebook analytics

* Collaborative benefits of the Git/Github model
* Online access, Offline access 
* 
* 



reproducible code 
-----------------

Collaborative benefits of the Git/Github model
----------------------------------------------





Online access, Offline access 
-----------------------------


Edit anywhere.  Though many sites that have the benefit of online access
through browser-based editors like the Wordpress dashboard, this brings
the corresponding disadvantages that they cannot be accessed or edited
without a decent Internet connection, and typically require users to work
in their browser-based editor rather than their prefered text-editing
environment, such as vim (though of course technical work-arounds are
available).  This site sits in a local repository where it can easily
be edited off-line.





Archiving 
---------


A Fast and cheap online platform 
--------------------------------

One goal in exploring technology for the notebook is to identify
approaches that can easily be employed by other scholars with a minimum
investment of resources.  To begin with, the site is built entirely on
free and open source technology.  Even such software can still require
substantial hardware resources to deploy when feature laden, which can
lead to high web hosting bills, slow response times and site downtime.
The latest incarnation of the notebook is also the lightest, delivering
the rich features described in this series using minimal requirements
provided for free by several hosting options today.

The notebook involves a lot of dynamic content - feed excerpts are drawn
from my Mendeley literature library, my twitter comments, and my github
activity, new posts appear on the lab-notebook page while also updating
the pages for categories and tags, and posts show their pageviews.  Many
websites today rely on dynamically generated pages in which the content
is drawn from mysql databases and php scripts, which put substantial
demands on the server.  This results in significant cost and downtime.

For nearly two years this site operated on Wordpress running on a virtual
private server at a cost of around $30 a month.  Today the site is built
each time a new entry is submitted, updating all the dynamic content into
static HTML files through Jekyll.  This allows the site to be served from
platforms that do not require expensive memory, database access and PHP
scripts -- the site can be deployed for about $1/mo on Amazon S3 static
hosting, or for free on Github. Page load times are much faster and uptime
is improved.  Javascript can be included in static sites, as it uses
the resources of the viewer's browser rather than the hosting server,
providing for more interactive features such as the Mathjax equation
rendering, tooltips, and analytics.  No essential content is provided
solely through javascript to ensure that readers without javascript or
machine-parsing tools do not miss it.

http://nearlyfreespeech.net will also provide free webhosting of static content.

More tools for communicating / sharing


Social network integration 
--------------------------

Plugins for Mendeley, Github, Twitter


RSS/Atom feed 
-------------


Beautiful equations with Mathjax 
--------------------------------

Math also in RSS feeds and readers without javascript.


Visitor analytics 
-----------------

Analytics plugin for public pageviews


Commenting 
----------

Commenting is actually the weakest system, as the data is not easily
accessible to archiving or management.



Link, Tag 
---------

Along with search, Links and tags are one of those fundamental advantages
of an electronic laboratory notebook, just as they are fundamental to
the web itself.

Links and tags both help save time, avoid duplication of effort, and
add structure.

Unlike physical notebooks or folders, tags allow

Both links and tags in the notebook are semantically enhanced, allowing
machines to benefit from these structures as well as human readers.


Site search 
-----------

Many ways.  Local tools provide the most powerful approach.

1. grep/sed in the file repository.  2. Javascript-based search.
3. Google's index.







Readable, multi-device typography 
--------------------------------

