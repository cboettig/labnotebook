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



reproducible code 
-----------------

**knitr**  I now use the dynamic documentation software
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




Version history 
---------------

I also version manage all changes to any entry using GitHub. Each page
is linked to its Github source history, which will display a list of
all previous edits to the post with an easy-to-read commit log and
highlighted diffs.  This is often considered an essential part of
an open lab notebook, where changes to the notebook are documented
and preserved.  While wikis, google docs, dropbox, wordpress plugins,
or just regular backups can provide version history of pages, none come
close to comparison with a full version management system such as git.

History with Hashes: an immutable and verifiable record

[The magic of SHA
hashes](http://www-cs-students.stanford.edu/~blynn/gitmagic/ch08.html)




Rather than store all content in a mysql database, the underlying data
structure for the notebook is essentially a flat collection of files.
Neither any particular technology or skill is required to understand
or parse the content.  (This is a natural feature of Jekyll, in which
these files are easily human readable thanks to markdown).


Collaborative benefits of the Git/Github model
----------------------------------------------

An earlier
post has covered how this notebook uses Git for version management and
displaying version history. A second benefit of having the notebook data
on a github repository





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
2. Archiving the HTML.  
3. Archiving external images with Data URIs.  
4. Archiving the whole git repository, `_site` HTML included.



Fast and cheap static content 
-----------------------------

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

nearlyfreespeech.net will also provide free webhosting of static content.

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


Elegant display on all devices 
------------------------------

(communicating science)

Researchers are most familiar with consuming scientific content in
print form, or today using pdfs that preserve the print-oriented,
page-driven concepts.

Visually appealing, uncluttered appearance.  Cluttered

Print media use columns to ensure that lines of text are constrained
to around 60 characters, a length found to be optimal for easy reading.
Columns conserve pages but are are inconvenient for screen-based reading
as they increase the need to scroll back and forth on smaller displays.
Printing costs keep fonts small and decrease the use of color.

Clutter may be one of the primary reasons academics
continue to prefer pdf content to HTML-based versions `r citep("http://www.quora.com/Why-do-scientists-tend-to-prefer-PDF-documents-over-HTML-when-reading-scientific-journals")`.


The notebook takes several steps to provide a clean, uncluttered layout.
I actually don't know how effective this is -- after all, the notebook
is merely a place to experiment with these concepts.

Column width can go beyond 60 characters on widescreen displays.
Solarized theme provides relatively low contrast.  High contrast theme?


Many academic publishers negelect good typography in the HTML versions
of their articles, though this is changing.

[peerJ]()


Designing a layout that renders consistently and readably across multiple
devices, from large desktop monitors to tablets and smartphones.


Features such as pop-up text giving the full citation save the reader
from scrolling to the bottom of a page and losing their place.

CSS provides a print format with a layout appropriate for print media.
The seperation of content and style allows for seamless generation of
these different layouts to suit the user.  Even within a given medium
the reader can set viewing preferences such as a light or dark theme.






