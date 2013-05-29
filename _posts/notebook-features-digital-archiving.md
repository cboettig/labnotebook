---
title: "Notebook features: digital archiving"
layout: post
category: open-science
tags: 
- notebook-technology
- blog

---



Archival preservation of digital scholarly content is an important
challenge throughout the research community.  As the notebook is the
permanent record of my regular scholarly endeavors, this provides
the opportunity to experiment with tools and techniques for digital
archiving while also better preserving the notebook. In the experimental
spirit that drives all my exploration here, I am testing several ways
to accomplish this.  In so doing, I learn which approaches are easiest
to implement, to use, and gather feedback from, while also hedging my
bets in the event that any given strategy should fail.


Archiving digital content involves two fundamental challenges that can
be difficult to satisfy simultaneously: providing a robust backup copy
of the _content_, and providing a consistent location (such as a URL)
where the content can be retrieved.  

### A custom domain

The simplest archival measure employed in the notebook comes from hosting
through my own domain, [carlboettiger.info](http://carlboettiger.info)
rather than an external server.  By controlling the domain structure
myself, I am not tied to a University server that can be altered
by an IT department without my knowledge, thereby breaking my links.
When I choose to move platforms, as I did in migrating from [Wordpress to
Jekyll](/2012/09/19/migrating-from-wordpress-to-jekyll.html),
I could ensure that links would be appropriately mapped.
This was not the case when I started my open notebook on
the OpenWetWare platform, since links are all mapped to the
[openwetware.org](http://openwetware.org) domain which I obviously
cannot control, even though I could at least migrate my content.  [HTML
redirects](https://github.com/cboettig/labnotebook/blob/8481569132142c850e585a2fc8c12a671527cd4f/_plugins/redirects.rb)
make sure links still resolve when I change structure (e.g.
[carlboettiger.info/archives/211](/archives/211)).
I don't have to worry about moving my domain when I change institutions,
and can seamlessly migrate to a different server or DNS provider to get
better rates or uptime performance.

Of course these advantages are also the greatest weaknesses of this
approach -- they all depend entirely on me. I could make or forget to make
any number of changes that could cause this all to break.  Time has shown
that even the best-intentioned researchers are not the best curators of
there own data, and no doubt I am no exception. How can the content and
its identifying addresses outlive me or my interest in it?


### PURLs: preserving identifiers

[PURLs](http://purl.org), or Persistent Uniform Resource Locators,
provide a DOI-like mechanism for addressing the challenge of link-rot.  As [Geoffrey Bilder eloquently
argues](http://blogs.plos.org/mfenner/2009/02/17/interview_with_geoffrey_bilder/),
the technological solution is quite simple, the real challenge lies on
the social side of the implementation -- a social contract that promises 
content providers will maintain their identifiers if they want to continue
to receive identifiers.  Though users must register to be able to create 
PURLs, PURL does not provide such enforcement.  

The PURLs solution is a bit more web-native solution than DOIs, in being
more democratic, using a URL structure, and being built upon widely distributed 
servers and open-source web technology.  Not surprisingly, other web-native
systems such as most of the major semantic web ontology providers rely on 
PURLs, e.g. Dublin Core uses [purl.org/dc/terms/](http://purl.org/dc/terms/).
The PURL [FAQ](http://purl.oclc.org/docs/faq.html) provides a great overview.

Implementing PURLs for the notebook was very straight-forward.  After registering
as a user at [purl.org](http://purl.org) I applied for my own top-level domain:
`cboettig`, which I then mapped to my current domain, [carlboettiger.info](http://carlboettiger.info)
By enabling partial redirects, each page on my site will also be resolved using 
this top-level domain followed by my existing page structure.  Following my existing
structure is not necessary -- I could map each page to an arbitrary path in my domain, but 
would have to enter these somewhat manually.  While the partial redirect is simpler to 
implement, it does require that I maintain the rest of the link structure.  


In this way, [purl.org/cboettig/lab-notebook.html](http://purl.org/cboettig/lab-notebook.html) now 
resolves to [carlboettiger.info/lab-notebook.html](http://carlboettiger.info/lab-notebook.html).
Likewise, each page in the notebook can be similarly resolved from the purl.org
domain instead of my personal carlboettiger.info domain.  
Should I ever somehow lose control of carlboettiger.info, I could re-assign my PURL
to redirect to my new domain URL.  This provides DOI-like technology
of permanent identifiers for every page in the notebook.  



### GitHub: preserving content and versions

Committing content to an external repository is the recommended way
to avoid link-rot from the user errors and website changes that so
frequently plague self-archiving of scholarly content. Keeping multiple
copies of content in geographically distinct locations is the time-honored
approach of digital archiving.  Git and GitHub make this easy.  Not only
does this mean that a backup copy is publicly available and forkable
online, but it is also easy to clone copies on each of the machines I
work on and rely on git to keep them in sync.  Should Github disappear,
a little `git remote add` and everything will be effortlessly deployed
with complete history elsewhere.


The notebook has two Github repositories: the "source-code" consisting of plain-text
(markdown) content and Jekyll-based templates on [labnotebook](http://github.com/cboettig/labnotebook), 
and a second for the rendered HTML [cboettig.github.com](http://github.com/cboettig/cboettig.github.com)
(which also now hosts the website). 


While a custom domain and PURLs provide persistent _locators_ for the content,
distributed copies on Git help archive the content itself.  Should my domain 
vanish or Github disappear, copies of the content, complete with version history,
would remain distributed across various machines with a copy of the repository.  
Links to Github would break in that process, unless we had remapped 
all links from the notebook to Github using PURLs. 



### fig**share**

One of the most comprehensive approaches I have come across so far
uses fig**share**. This offers the most promising avenue for content
preservation, but is weakest in managing the URIs and associating them
with the original content.  All fig**share** content is archived by
[CLOCKSS](http://clockss.org), an international library cooperation
providing redundant and geopolitically distributed backup of the archives
around the world (and used by many academic journals, both subscription
based & open access).  Should fig**share** vanish from the face of the
planet, it will trigger the release of all of its content to resolve
through the CLOCKSS servers, with the same appearance and resolving at
the same URLs as the original figshare content.  Presumably the DOIs
provided to figshare content will also continue to resolve there.

It would certainly be preferable to have the notebook archived by CLOCKSS
directly, since the association between the original online content
at carlboettiger.info is lost in archiving the entries on figshare.
More problematically, the content as archived on fig**share** is not
recognized by search engines, etc., as a separate HTML pages to index,
but merely as a bundle of attached text files. On the upside, the content
becomes part of the global scientific datasets preserved and indexed by
fig**share** with appropriate metadata, etc., increasing the chances for
discovery through that venue. Also, fig**share** provides a convenient
API that can help automate deposition.

Deciding just what to archive in the fig**share** database is also less
straight forward than it may seem.  I have gone through a few iterations:

1. Archiving the markdown.  
2. Archiving external images with Data URIs.  
3. Archiving the HTML versions of pages alone
4. Archiving the whole git repository, `_site` HTML included (?)

I began by archiving the markdown files that I write to create each entry.
These are plain-text files that can be easily read in any text editor,
even if the conventions for rendering them as HTML are lost.  Like HTML,
figures are linked to external files, and are thus not captured by
this solution.  To work around this, I adopted the trick of using [Data
URIs](http://carlboettiger.info/2013/01/24/Data-URIs-for-image-archives.html)
to embed images.  This places a binary encoding of the image
in the text itself, which can be rendered by almost any browser as the
appropriate image.  While this keeps the content together, the long
data URI strings are rather out-of-place inside a plain text document.
Further, the markdown loses all of the valuable semantics that are
automatically added to each page when Jekyll renders them to HTML. As
Phil Lord argues, if there's any format that future archivists can read
successfully -- it will be HTML. Consequently I've settled on archiving
the HTML versions of each notebook entry, with images embedded as Data
URIs.  Each HTML file contains rich metadata in the header, sidebar,
and footer, that give more information about the content and its context
in the notebook (relative path, categories and tags, timestamps and SHA
hashes, etc). I have archived these entries in annual chunks following
the year/month/day directory structure already employed on the site.

There is still additional external content used to render the
site -- CSS and javascript files -- that are not captured in this
approach. Though entries actually render [just fine without the css](),
it would certainly be possible to include this material in the archive
(though some Javascript comes from external CDNs).  This does make for a
bit larger and more cluttered archive, and more to the point is a rather
crude solution to a problem already solved by Internet archiving programs
such as CLOCKSS or internetarchive.org.


Lastly there is the concern of preserving the version history of
entries.  Though fig**share** provides versioning of its content,
this doesn't capture finer resolution of individual page changes
available through the Github repository.  At the expense of creating
an ever more cumbersome archival object, one could include the
`.git` history, either for the HTML rendered version (which lives at
[cboettig.github.com](https://github.com/cboettig/cboettig.github.com/))
or the source files used to create it
([labnotebook](https://github.com/cboettig/labnotebook)).


### What about persistent locators then?

Of course this fails to address the preservation of externally
linked content. The most frequent outbound links point to other
publications through, usually their DOIs, which we hope will take care of
themselves. 


The most important externally linked content in the notebook entries are the links to
scripts, functions, and manuscripts in the various project repositories
on Github.  The simplest solution is to embed the most important scripts
in the notebook entries themselves.  Archiving the project repositories
is an additional challenge, but if a user can recover a copy of the
project repository (along with it's `.git` history) then it would be
possible to identify the linked file using the SHA hash from these
links (by matching it against the SHAs in the log).  See my entry on
[SHA hashes](/2013/05/03/notebook-features-hashes-providing-an-immutable-and-verifiable-research-record.html)
for more on this topic. 


## Conclusions

Digital archiving is a challenging problem that is not completely
addressed by any one of these approaches.  In the end, robust archiving
will be best left in the hands of its experts.  Unfortunately, the best
examples currently available (such as CLOCKSS, national libraries, etc.)
will not archive a researcher's web page directly.  The solutions explored
here are not perfect, but they are free and simple to implement. I'd 
love to hear what others think.  


### See also 

* [DigitalPreservation.gov](http://www.digitalpreservation.gov/ndsa/)
* [The Internet Archive](http://internetarchive.org)
