---
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
"citable".  And this [frustrates me](https://twitter.com/cboettig/status/337986074624282624).

Don't get me wrong.  I love DOIs, and I love CrossRef.  And I bang on
the table when I have some old journal article that doesn't yet have
a DOI.  I use DOIs every day in many ways.  I use CrossRef's APIs all
the time to draw in metadata for citations in my notebook (through my
[knitcitations](http://github.com/cboettig/knitcitations) package), and to import metadata into my reference
manager, Mendeley.  I've written my own implementations in R and
ruby, and keep an eye on their exciting new tools on the [Crossref
Github page](https://github.com/crossref).  I wrote to bibsonomy when I realized they were not
using the CrossRef API to look up metadata by DOIs, and they have now
implemented this feature.  I use DOIs to look up papers I've come across,
and to share content I am reading. (Crossref's [DOI shortener](http://shortdoi.org/) is great
for this).  I even use DOI-based links to [embed semantic information](http://carlboettiger.info/2013/02/22/semantic-citations-for-the-notebook-and-knitr.html)
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
a DOI is simply a tool to fight [link-rot](https://en.wikipedia.org/wiki/Link_rot).


So you might ask, why does the ability to remap the address have anything
to do with being "permanent?"  It doesn't, really.  The permanence comes
not so much from the technology as from the social contract that goes with
it.  As CrossRef's [Geoffery Bilder eloquently explains](http://blogs.plos.org/mfenner/2009/02/17/interview_with_geoffrey_bilder/), a publisher
can only receive DOIs if they promise to keep these redirects up-to-date.
A publisher who fails to maintain this responsibility would presumably
lose their right to receive DOIs.  A brilliant, simple, social incentive.

This still does not guarantee permanence -- e.g. what would happen to the
content if the publisher disappears.  That problem is not addressed by the
DOI technology itself, but by a robust backup archiving solution, such as
[CLOCKSS](http://clockss.org), which provides a geo-politically distributed
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
a requirement.  (As [Noam Ross observes](https://twitter.com/noamross/status/337987521243918337), try finding a permanent
identifier for "Personal Communication"). Books, reports, and other
grey literature frequently appear in citations, as do links to websites.
MLA even has guidelines on the proper format to [cite a tweet](http://www.mla.org/style/handbook_faq/cite_a_tweet) (which,
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
appropriate attribution to large numbers of data providers, for instance).
Does having a DOI address this problem? 

#### Citation counts in DOIs

Counting citations depends on who is counting them.  The most well-known
is Thompson-Reuters, which has their own process for deciding what gets
counted (based on publisher), so no guarantee there.  Meanwhile Google
Scholar counts anything meeting it's [indexing requirements & arbitrary
selection](http://carlboettiger.info/2012/11/23/citing-lab-notebook-entries.html).
I have recently learned that CrossRef just launched it's own [internal
citation counting](https://github.com/articlemetrics/alm/wiki/Crossref),
which is available from the CrossRef metadata (totals only for the
public, publishers can resolve which articles did the citing...).
However, most proposals to make some alternative research product
"citable" by giving it a DOI use DataCite DOIs (e.g. fig**share**,
PeerJ Preprints), which lag behind in this feature.  Moving the control
of citation data beyond the grasp of particular publishing companies
like TR is undoubtedly an important step forward.  The [Open Citation
Project](http://www.jisc.ac.uk/whatwedo/programmes/inf11/jiscexpo/jiscopencitation.aspx)
is a more comprehensive, if very young, move in this direct.  (Hat tip
to Martin Fenner for explaining CrossRef citations to me).

### Additional Metadata

In addition to resolving links, DOI providers also serve a rich collection
of metadata about the publication that can be [queried by DOI](http://www.crosscite.org/cn/) or
by [other elements](https://github.com/CrossRef/cr-search) like author and title.  Rich semantic formats and
disambiguation of author names by connections to ORCID IDs are among
the many advantages of this.  Because many of these tools are publicly
accessible by through their APIs, it is easy for other developers to
build services upon them.

## Conclusions

While DOI providers have done an excellent job in ensuring persistent
URLs, archived content, and valuable metadata, these things are largely
the product of the social contract between publisher and the DOI provider.
It is not possible for an author or organization to simply "get DOIs"
for all their content. But it is not the only way to provide these
features, either.  While I understand the value in providing a simple
and reliable way to encapsulate each of these concepts as "has a DOI,"
it also appears to put these features beyond the reach of individual
researchers. If issues of persistent URLs, archived content, and rich
metadata tools are always reduced to "has a DOI," publishers become the
only path to achieve these ends. On the contrary, a rich collection of
tools is available to researchers.

So what do we mean when we say a DOI makes something 'citable?'  If this
is shorthand for the properties we would want in something citable:
persistent identifier, archival content, machine-readable metadata, than
we should start to recognize other things that share these features.
Further innovation requires valuing the features the DOI provides,
not simply a "brand name" researchers recognize.



## Alternative tools

In a [recent
post](http://purl.org/cboettig/2013/05/31/notebook-features-digital-archiving)
in a series on technical features of my open notebook, I discuss some
of the tools available to address these challenges. In particular:

* The use of [PURLs](http://en.wikipedia.org/wiki/Persistent_uniform_resource_locator) for persistent identifiers
* Git for archival redundancy
* [Greycite](http://greycite.knowledgeblog.org) for metadata extraction


Of course, if you ever need a DOI for a research product, there is always [figshare](http://figshare.com).  





