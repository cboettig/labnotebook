---
comments: true
date: 2012-02-21 19:20:40
layout: post
slug: tues-research--managing-for-resilience-talk-future-of-libraries-etc
title: 'Tues: Research, seminar (managing for resilience), talk (future of libraries),
  etc...'
redirects: [/wordpress/archives/3909, /archives/3909]
categories:
- ecology
- evolution
- open-science
tags: 
- warning-signals
- ropensci
- pmc
- seminar
---

## research Stuff
#### warningsignals

	
* Exceeded wall time on NERSC, readjusting and running this again.


#### treebase
	
* Working on treebase manuscript.
* Treebase Rewrote handling of server errors, added pauses to reduce load, etc.

#### PMC

* A user pointed out my support for "white" model was incomplete. Fix is now on github (install instructions for development version are also now on github), will push to CRAN soon.

* Another user points out that pmc support for additional functions would be nice, such as rbrownie, fit.discrete. So true. Mixing and matching these methods may be a bit tricky without a higher level abstraction than pmc is applying.




#### Server


Happily upgraded to kcite 1.5.  [Many nice features](http://www.russet.org.uk/blog/2012/02/kcite-spreads-its-wings).  Still looking forward to cito integration, generic handling of links (i.e. websites).  Also since it's javascript now, doesn't format in google reader, unlike 1.3 (nor does mathjax rendering).  May still have to edit tweak my css a bit (maybe have numbered list format for bibliography, or make the bibliography line into header format).

Server didn't recover after crash, looks like a local apache2 install got in the way of dreamhost apache.  hope this worked: `/usr/sbin/update-rc.d -f apache2 remove`



## Managing for Resilience


Notes from reading seminar


#### Old paradigms


Species based. (Endangered species act, etc)


#### Approaches

  * functional response traits. But: Difficult to measure. difficult to anticipate consequences. Hobbs _et. al._ 2006
  * Habitat structure & complexity. But:
  * Indicators. But: difficult to get right data. Or even experimental disturbance (van Nes & Scheffer, 2007).
  * (Allen _et. al._ 2011) Indicators. Planning. Adaptive management framework.

#### Threshold management


South African National Parks examples (strategic adaptive management in Kruger). Management plan has:

  1. "Vision statement",
  2. hierarchy of goals,
  3. thresholds of potential concern


Example threshold concerns: invasive species. Fire level.


## Future of libraries

	
  * A presentation by candidate for UC Davis library director, [MacKenzie Smith](http://www.mit.edu/~kenzie/), whose resume sports amazing digital science projects at Harvard & MIT and work with Creative Commons.
  * Jonathan Eisen has a [nice summary](http://phylogenomics.blogspot.com/2012/02/notes-for-talk-by-mackenzie-smith.html), also a new notetaking style he's trying out for open lab notebooks.
  * Scale-on-demand, print-on-demand ebooks for UC library?
  * Journals subscriptions are 80% of current costs. Open Access would fix this.  Most major publishers now see (gold) open access as inevitable.  Library may contribute to author's publication costs?
  * Library catalog is no longer about what the U has, but what the world has. focusing on UC Davis strengths.
  * Newer collections need our attention, e.g. research data!   Organize, visualize, publish data. Should be just as recognized as core goal of future libraries.
  * Libraries deal with the information overload, provide enterprise knowledge management services.  Examples include:
    * Text mining tools
    * Scale up team science
    * Current Research Information Systems.  automate cv's etc.
  * Structurally libraries not built for today's goals: group coursework, technology.
  * New vision of library as high-tech center: visualization walls, 3D caves, 3D printers.
  * Legal barriers / IP will be a major challenge facing future libraries.


## References


- van Nes E and Scheffer M (2007).
"Slow Recovery From Perturbations as A Generic Indicator of A Nearby Catastrophic Shift."
*The American Naturalist*, **169**.
ISSN 0003-0147, <a href="http://dx.doi.org/10.1086/516845">http://dx.doi.org/10.1086/516845</a>.

- Allen C, Cumming G, Garmestani A, Taylor P and Walker B (2011).
"Managing For Resilience."
*Wildlife Biology*, **17**.
ISSN 0909-6396, <a href="http://dx.doi.org/10.2981/10-084">http://dx.doi.org/10.2981/10-084</a>.



-  Novel Ecosystems: Theoretical And Management Aspects of The New Ecological World Order, Richard J. Hobbs, Salvatore Arico, James Aronson, Jill S. Baron, Peter Bridgewater, Viki A. Cramer, Paul R. Epstein, John J. Ewel, Carlos A. Klink, Ariel E. Lugo, David Norton, Dennis Ojima, David M. Richardson, Eric W. Sanderson, Fernando Valladares, Montserrat Vila, Regino Zamora, Martin Zobel,  (2006) *Global Ecology And Biogeography*, **15**    [10.1111/j.1466-822X.2006.00212.x](http://dx.doi.org/10.1111/j.1466-822X.2006.00212.x)
