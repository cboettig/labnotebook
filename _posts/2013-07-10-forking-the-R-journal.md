---
published: false
layout: post
category: open science
tags:
- R
- blog
---



All I really wanted to do is cite a paper in _the R Journal_, which is peer-reviewed, open access (CC-BY), LaTeX based and without author charges.  Sure, I could do that already, but I like being able to programmatically generate citation metadata from a URL -- we do have this thing called the internet now, and citations are just links, right?  Unfortunately, nice as it is, the R journal doesn't have HTML landing pages for articles that embed the metadata.  

This makes it harder for Google Scholar to index the articles, and means that we cannot extract citation metadata from the URL using a tool like [greycite][].  Until now.  

I wrote to Editor-in-Chief Hadley Wickam about this, who responded in the best way possible: making the journal website's Github repo public.  Fork, clone, a little hacking for a ruby plugin and a little liquid code, and voila, html landing pages for _the R Journal_ with embedded metadata.  Check out the source code for how this works -- it's really quite straight forward since the metadata is already available in `_config.yaml`.

The really exciting thing about this is the basic idea of forking a journal website and improving it.  There's a lot we could do to improve the R journal.  I think that ideally we'd have HTML5 versions of the articles as well, something that would be straight forward if authors used knitr of course, but I realize that's a bigger shift.  One could also automatically enhance the HTML with quite a bit more semantic content, we could have animations, links the Rnw files, etc etc.  I'd be happy to help and I'm sure others would too.  R-journal is great but it could be so much more as an example and test-bed of innovation in statistical publishing.

Well, now that the journal is open for pull requests, hack away!

[greycite]: http://greycite.knowledgeblog.org
