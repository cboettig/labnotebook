---
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

I now use the dynamic documentation software
called knitr to write most entries that shore results and figures. The
code to replicate the results is included automatically, ensuring that
what I say I did and what code I actually ran to get the results are
always consistent.  

As the code required for any given analysis can be quite involved, it 
is not pratical to provide free-standing scripts in this way.  Instead,
I write the algorithms as functions provided by an R package dedicated 
to the project, e.g. [nonparametric-bayes](http://github.com/cboettig/nonparametric-bayes), [multiple-uncertainty](http://github.com/cboettig/multiple_uncertainty),
or [warning-signals](http://github.com/cboettig/earlywarning), which is version-managed on Github.  The code 
displayed in the post can then be limited to the specific calls to 
analysis, data manipulation, and plotting functions unique to the 
exploration shown, without repeating the code for all algorithms involved.

The code for the analyses is also stored on github using the same 
dynamic documentation approach with knitr.  These scripts are found
in the `inst/examples` directory of my packages.  This approach allows
a given analysis to evolve with my research in a more tractable way than
simply pasting updated copies as successive notebook entries.  The
notebook entries then become a place for me to synthesize the results
of a script.  


Though the package functions are usually backwards-compatible, proper 
reproducibility is only attained by having the version of the package 
from time of the result.  This is easily accomplished by the seemless
integration of Github and R using the devtools package. Consider a figure
from a page of the notebook, such as the final histogram plot from [this entry](http://www.carlboettiger.info/2012/12/20/results-comparing-gp-to-parametric.html).  The entry links to the script responsible for the figure,
[https://github.com/cboettig/nonparametric-bayes/blob/9d5cd1f027bdfe5f356dce83756726c95a6fcdd8/inst/examples/myers-exploration.md](https://github.com/cboettig/nonparametric-bayes/blob/9d5cd1f027bdfe5f356dce83756726c95a6fcdd8/inst/examples/myers-exploration.md)

We can install the entire research compendium at exactly the state it was at 
the time of the analysis using the hash (long chain of seemingly random characters, 
see the entry on [hashes]()) using the clever `devtools` R package,

```r
install_github("nonparametric-bayes", "cboettig", "9d5cd1f027bdfe5f356dce83756726c95a6fcdd8") 
```

We can then copy and paste the code linked from the figure to replicate
the results.  This provides a fast and effective way replicate the
work appearing in or linked to any entry.  More importantly perhaps,
this approach also allows one to repeat any given analysis with the most
recent version of an algorithm and compare the results, since the package
structure provides a logical seperation between algorithm and analysis.
In practice such fine-grained control and invistigation is more important
than simply being able to regenerate what has already been done without
any further input.

(This is not, however, entirely failsafe. The package may depend on
other packages, which themselves may have changed.  For my use cases, it
is a deal more reliable than running the current version of a package
that is actively changing during my research.  Readers interested
in even more robust replication and verification should take a look
at Roger Peng's package `stashR` package and associated publications
`r citet(citation("stashR"))`.



Collaborative benefits of the Git/Github model
----------------------------------------------





Online access, Offline access 
-----------------------------


Edit anywhere.  Though many sites that have the benefit of online access
through browser-based editors like the Wordpress dashboard, this brings
the corresponding disadvantages that they cannot be accessed or edited
without a decent internet connection, and typically require users to work
in their browser-based editor rather than their prefered text-editing
environment, such as vim (though of course technical work-arounds are
avaialble).  This site sits in a local repository where it can easily
be edited offline.





Archiving 
---------

(#2 reproducible, #3 facilitate communication over long run).

As the permenant record of my scholarly endeavors, the notebook is
archived on figshare.  This is less straight forward than it may seem,
and has gone through a few iterations:

1. Archiving the markdown.  
2. Archiving external images with Data URIs.  
3. Archiving the HTML versions of pages alone
4. Archiving the whole git repository, `_site` HTML included (?)



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







Elegant multi-device display 
-----------------------------



Researchers are most familiar with consuming scientific content in
print form. Today using pdfs that preserve the print-oriented,
page-driven concepts.

PDFs appear to have certain additional advantages, such as being an immutable copy, providing offline access and decentralized distribution. 
Many software tools exist to add markup to pdfs extract their metadata 
to citation software and even their full text to a local database that
can be queried (e.g. Mendeley). All of these desirable qualities can
be maintained and improved upon in a web-based format (e.g. see my post on [cryptographic hashes]() for immutable and verifiable versioning). Meanwhile, the disadvantages of PDF relative to the potential of web-based content are manifold.  (Tim Burners-Lee's [five-star rating system for linked data](http://5stardata.info) captures this rather well).  

However, the primary reason for the preeminence of PDF formats is probably the most trivial: *Appearance*.  Clutter is probably the leading reason most researchers prefer PDF content to HTML-based versions `r citep("http://www.quora.com/Why-do-scientists-tend-to-prefer-PDF-documents-over-HTML-when-reading-scientific-journals")`.  Fortunately, appearance
is also fast becoming the greatest handy-cap of the PDF format, thanks to the rise of mobile devices.  


Given the importance of a visually appealing, uncluttered appearance 
in communicating scientific content, the notebook has thus also been
a platform for me to experiment with layout and design. I've taken
several steps in an effort to provide an clean, responsive design 
that is readable on any size device and renders reasonably well to
print or PDF formats. I don't have professional training in these things, and have very little idea how effective my attempts have been, but would certainly welcome feedback and critique.  After all, the notebook
is merely a place to experiment.  Here are some of the design considerations currently guiding the layout.  

Print media use columns to ensure that lines of text are constrained
to around 60 characters, a length found to be optimal for easy reading.
Columns conserve pages but are are inconvenient for screen-based reading
as they increase the need to scroll back and forth on smaller displays.
Printing costs keep fonts small and decrease the use of color. The notebook uses a single-column layout with continuous scrolling for posts and pages.  Column width is fluid but padded with enough empty space to avoid long lines.  On small devices text can use the whole width available.  

Only the landing pages for the lab-notebook and project-specific landing pages organize content across

Twitter-Bootstrap CSS provides a responsive design for different media formats.  The top navbar remains fixed on large monitors, providing easy navigation, but scrolls out of the way on smaller devices, and also collapses to an expandable button to avoid overflow.  Metadata is provided in a sidebar to the right of the text; which I try to keep as minimal as possible.  


Many academic publishers neglect good typography in the HTML versions
of their articles, though this is changing in newer journals such as [peerJ]() and [eLife]() (which are both great sources of inspiration).  



Features such as pop-up text giving the full citation save the reader
from scrolling to the bottom of a page and losing their place.

CSS provides a print format with a layout appropriate for print media.
The separation of content and style allows for seamless generation of
these different layouts to suit the user.  Even within a given medium
the reader can set viewing preferences such as a light or dark theme.


Solarized colors



