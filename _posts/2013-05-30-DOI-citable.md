---
published: false
title: "DOI != citable"
layout: post
category: open-science
tags: 
- notebook-technology
- blog

---



I feel I see this kind of comment almost daily:

<blockquote class="twitter-tweet" data-partner="tweetdeck"><p>Is there a way to obtain DOI for a <a href="https://twitter.com/github">@github</a> repository? (for citing <a href="https://twitter.com/search?q=%23opensource&amp;src=hash">#opensource</a> software packages, similar to <a href="https://twitter.com/figshare">@figshare</a> objects) <a href="https://twitter.com/search?q=%23git&amp;src=hash">#git</a></p>&mdash; Ahmed Moustafa (@AhmedMoustafa) <a href="https://twitter.com/AhmedMoustafa/statuses/339727912896954369">May 29, 2013</a></blockquote>
<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

Again and again, researchers suggest that  DOI to makes something
"citable".  And this [frustrates me]() incredibly.

Don't get me wrong.  I love DOIs, and I love CrossRef.  And I bang on
the table when I have some old journal article that doesn't yet have
a DOI.  I use DOIs every day in many ways.  I use CrossRef's APIs all
the time to draw in metadata for citations in my notebook (through my
[knitcitations]() package), and to import metadata into my reference
manager [Mendeley]().  I've written my own implementations in R and
ruby, and keep an eye on their exciting new tools on the [Crossref
Github page]().  I wrote to bibsonomy when I realized they were not
using the CrossRef API to look up metadata by DOIs, and they have now
implemented this feature.  I use DOIs to look up papers I've come across,
and to share content I am reading. (Crossref's [DOI shortener]() is great
for this).  I even use DOI-based links to [embed semantic information]()
into links and citations of articles.



But I still have no idea what researchers mean when they suggest that
this makes something _citable_.

### Some background on DOIs

At its heart, a DOI is a very simple concept.  It is a "permanent
identifier".  All this means is that is is really just a URL redirect.
Type http://dx.doi.org/mnn into any browser and get redirected to where
the article actually lives.  Why does that make it permanent?  Because if
the journal decides to change their URL structure, the DOI's redirect
can just be mapped to the new address and voila, it still works. That is,
a DOI is simply a tool to fight [link-rot]().


So you might ask, why does the ability to remap the address have anything
to do with being "permanent?"  It doesn't, really.  The permenance comes
not so much from the technology as from the social contract that goes with
it.  As CrossRef's [Geoffery Bilder eloquently explains](), a publisher
can only recieve DOIs if they promise to keep these redirects up-to-date.
A publisher who fails to maintain this responsibility would presumably
lose their right to recieve DOIs.  A brilliant, simple, social incentive.

This still does not guarentee permenance -- e.g. what would happen to the
content if the publisher dissapears.  That problem is not addressed by the
DOI technology itself, but by a robust backup archiving solution, such as
[CLOCKSS](http://clocks.org), which provides a geo-politically distributed
network of backup copies for many journals.  Again the social contract
comes into play -- presumably CrossRef would not provide a publisher
with DOIs if they did not have such a robust archival solution in place.


So far we have seen two crucial functions of the DOI -- as a permanent
identifier that can be used to reach the content despite link rot,
and as an incentive to maintain good archival backups of the content
and the links to it.

### What do we mean by citations, anyway?


So what does this have to do with being citable?  Obviously these are
nice properties to have for things we cite -- but they are by no means
a requirement.  (As [Noam Ross observes](), try finding a permanent
identifier for "Personal Communication"). Books, reports, and other
grey literature frequently appear in citations, as do links to websites.
MLA even has guidelines on the proper format to [cite a tweet]() (which,
incidentally, come closer to having a permanent identifier and an archival
strategy than most other things in this list).  So what do we mean by
citable anyway?

But what about the reference list?  While a publisher may be just fine
including some link to your software, is it really cited if it isn't in
the reference list?  Journals restrict what appears in the reference list
because these references are indexed by the infamous citation counters
like Thompson-Reuters. (A frequent complaint is that many journals
do not similarly index citations appearing in the reference list of
the supplementary materials, making it difficult or impossible to give
appropiate attribution to large numbers of data providers, for instance).
Does having a DOI address this problem? 

No! While there are various ways to be included in the citation counts
of different services, none are guarenteed simply by having a DOI. So
if "indexed by TR" is what we mean by "citable", a DOI isn't it.  


Google Scholar already does it's own indexing, and the OpenCitations
project aims to create a truly open citation database.  So does TR dictate what
qualifies to go in the reference list of any journal?



## Alternative tools

There are lots of schemes that address the challenges and features a DOI provides.
That's the source of my frustration -- a DOI is often seen as the only road, and
not because of it's features, but just because it is commonly used in research 
publications.  



### Redirects

### Archiving

### Metadata extraction









