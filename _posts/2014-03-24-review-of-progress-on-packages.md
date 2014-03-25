---
layout: post
category: ecology
tags: 
- ropensci

---


A lot of the past week has been focused on some catching up and tidying
up in my active projects in metadata manipulation and publishing tools,
`EML`, `RNeXML`, and `rfigshare`. The full story of the week and half
unfolds on github, but summarizing progress here.  


rfigshare 
---------

Changes to `httr` interface orginally broke `rfigshare`, though
working with @hadley the original mechanism was restored through
`sign_oauth1.0()`.  The changes provided a much nicer mechanism
for handling `oauth` authentication without having to specify tokens
directly, and resulted in a relatively straightforward overhaul of the
authentication mechanism in the package, while still preserving the
package API.  During this process I also tackled a bunch of outstanding
issues, such as: pretty-printing results, fixing behavior of search and
adding authors, getting embeddable image URLs and flushing out the test
suite and activiting full travis integration of the tests.  See package
[NEWS](https://github.com/ropensci/rfigshare/blob/master/NEWS) for a
more complete list (v0.2-9 and v0.3).  This version is now on CRAN.

In the process I learned a bit more about `httr`'s oauth handling.


RNeXML 
------

Main focus has been moving manuscript text foward, flushing out a more
complete description of package functions, organization, and use cases.
In particular this has focused on:

- Outlining the tiered levels of metadata manipulation (from the
elementrary `get_metadata()` to the XPath and SPARQL queries) and metadata
generation (from `title` and `creator` to automatic taxonomic reference
links using taxize to building on existing and custom ontologies; and the
related example of extending the schema itself using metadata (simmap).

- Finalizing and writing out this simmap example was the other goal,
illustrating extending the package.

Lost too much time on some of the fine points of travis integration
with package dependencies on specific users and branches of Github,
on omegahat, and cases where apt-get cannot get background dependencies
automatically.


EML 
---

Still need to continue mansucript writing and extending functionality;
meanwhile minor changes to reflect updates to rfigshare and to travis
integration.

rfishbase
---------

Some momentum on rfishbase2.0 thanks to involvement from @tpoi


