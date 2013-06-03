---
title: Archiving the lab notebook on figshare
subtitle: Advantages and challenges
layout: post
category: open-science
tags: 
- notebook-technology
- blog


---

## Robust archiving through CLOCKSS

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


## Challenges

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

### What content? What format? 

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

### How about site assets?

There is still additional external content used to render the
site -- CSS and javascript files -- that are not captured in this
approach. Though entries actually render [just fine without the css](http://stackoverflow.com/questions/14046738),
it would certainly be possible to include this material in the archive
(though some Javascript comes from external CDNs).  This does make for a
bit larger and more cluttered archive, and more to the point is a rather
crude solution to a problem already solved by Internet archiving programs
such as CLOCKSS or internetarchive.org.

### Versioning?

Lastly there is the concern of preserving the version history of
entries.  Though fig**share** provides versioning of its content,
this doesn't capture finer resolution of individual page changes
available through the Github repository.  At the expense of creating
an ever more cumbersome archival object, one could include the
`.git` history, either for the HTML rendered version (which lives at
[cboettig.github.com](https://github.com/cboettig/cboettig.github.com/))
or the source files used to create it
([labnotebook](https://github.com/cboettig/labnotebook)).


### Connecting to the original instances?

Of course this fails to address the preservation of externally
linked content. The most frequent outbound links point to other
publications through, usually their DOIs, which we hope will take care of
themselves. The most important externally linked content in the notebook entries are the links to
scripts, functions, and manuscripts in the various project repositories
on Github.  The simplest solution is to embed the most important scripts
in the notebook entries themselves.  Archiving the project repositories
is an additional challenge, but if a user can recover a copy of the
project repository (along with it's `.git` history) then it would be
possible to identify the linked file using the SHA hash from these
links (by matching it against the SHAs in the log).  See my entry on
[SHA hashes](/2013/05/03/notebook-features-hashes-providing-an-immutable-and-verifiable-research-record.html)
for more on this topic. 

## Links to the archives

Current and previous archives of my lab notebook can be found on figshare
by year. Older versions of these archives have taken a different approach,
including just archiving the markdown files.  The links use the DOI
and point to the most recent version. (At this time linking to explicit
versions with FigShare's DataCite DOI links doesn't appear to be working)

* [Lab Notebook, 2010](http://dx.doi.org/10.6084/m9.figshare.96916)
* [Lab Notebook, 2011](http://dx.doi.org/10.6084/m9.figshare.96919)
* [Lab Notebook, 2012](http://dx.doi.org/10.6084/m9.figshare.106620)




