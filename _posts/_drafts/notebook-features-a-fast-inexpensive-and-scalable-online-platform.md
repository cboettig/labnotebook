---
title: "A fast, inexpensive, and scalable online platform"
layout: post
published: false
category: open-science
tags:
- notebook-technology
- blog

---


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
hosting, or *for free* on Github (as I do now).


Page load times are much
faster (often faster than 90\% of the web, including [www.google.com](http://google.com))
and uptime is improved ([see current uptime statistics](http://stats.pingdom.com/fy1sae94ydyi/616612)). Github now
provides it's own [Content Delivery Network](http://en.wikipedia.org/wiki/Content_delivery_network), or CDN, which provides
copies of content on it's servers distributed around the globe for faster
load times.


Javascript can be included in static sites, as it uses
the resources of the viewer's browser rather than the hosting server,
providing for more interactive features such as the Mathjax equation
rendering, tooltips, and analytics.  No essential content is provided
solely through javascript to ensure that readers without javascript or
machine-parsing tools do not miss it.

http://nearlyfreespeech.net will also provide free webhosting of static content.



