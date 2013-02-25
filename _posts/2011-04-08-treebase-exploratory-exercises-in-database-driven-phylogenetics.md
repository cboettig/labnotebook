---
comments: true
date: 2011-04-08 15:18:02
layout: post
slug: ropensci-exploratory-exercises-in-database-driven-phylogenetics
title: 'TreeBase: exploratory exercises in database-driven phylogenetics'
redirects: [/wordpress/archives/1382, /archives/1382]
categories:
- evolution
tags: 
- ropensci
---

Taking a look at the [TreeBase](http://www.treebase.org/treebase-web/urlAPI.html) database for potential project with Gabe & Duncan's Large Data seminar.  It would be interesting to get a working knowledge of the database and the API, making large-scale meta-analyses easy.  Many studies seem to select taxa based on what they have in their own lab rather than re-use existing phylogenies, not because it is better suited to answering the questions but because it is more familiar.  Access to larger data-sets than typically available in any individual lab, and the ability to test hypotheses across multiple phylogenies could be rather useful.

A nice tutorial on what can be done with the existing data could be quite useful; my cursory search for such a tutorial didn't turn up much.  The ability to grab and re-analyze any set of phylogenetic trees through a pipeline in R would be very useful.


## Overview of capabilities




> In addition to the web interface, TreeBASE can be accessed programmatically  		through a stateless web service interface and URL architecture. This  		interface can deliver data in several different formats, including NEWICK,  		NEXUS, JSON, NeXML.





	
  * a [PhyloWS](http://evoinfo.nescent.org/PhyloWS) RESTful API. A detailed description 			of [TreeBASE's PhyloWS 			implementation](https://sourceforge.net/apps/mediawiki/treebase/index.php?title=API) is on the TreeBASE wiki.

	
  * [OAI-PMH](http://www.openarchives.org/pmh/) metadata harvesting interface is available, though under development.  			A detailed description is on the [TreeBASE wiki](http://sourceforge.net/apps/mediawiki/treebase/index.php?title=OAI-PMH).

	
  * SQL data dumps -- coming soon.

	
  * Treebase [claims](http://treebase.org/treebase-web/about.html) to have character data as well as phylogenies.  No obvious way to query for these.  Also has sequence data.




## Potential exerices





	
  1. Would be good to begin with a statistical summary of TreeBase: number of data sets, average size, taxa, coverage, frequency with which various methods were used, fraction that are time-calibrated, fraction that are species trees vs gene trees, number of sequences used etc.

	
  2. No idea how hard it would be to establish an R implementation/interface to the API, but could be quite useful, particularly for comparative phylogenetics.

	
  3. Would be useful to have a pipeline that could grab the phylogenies from within R given search terms or the study id, along with appropriate meta-data (publication information, taxa, etc).




## Accompanying literature database:





	
  * There's a rather nice database of all 2604 papers published containing phylogenetic trees with entries in TreeBase, cataloged in the [Mendeley group](http://www.mendeley.com/groups/734351/treebase/papers/).

	
  * Each has tags to the entries in TreeBase (note that all objects have been given new id's in the current (version 2) TreeBase, so should search by those.  Make sure to discard current search results (button) before searching again.



	
  * Can search the Mendeley collection (if I imported all the papers, then could do full-text search of the articles).

	
  * Potential to interface with other databases, including Wikipedia (see next section, below).




## Some perspectives from Rod Page


[Towards a Taxonomically Intelligent Database](http://taxonomy.zoology.gla.ac.uk/publications/tech-reports/Edinburgh.pdf)



**[Why aren't we there yet?](http://www.slideshare.net/rdmpage/why-arent-we-there-yet)**

View more [presentations](http://www.slideshare.net/) from [Roderic Page](http://www.slideshare.net/rdmpage)



And another excellent presentation from Rod for a more general web database perspective:



**[Going Digital](http://www.slideshare.net/rdmpage/going-digital)**

View more [presentations](http://www.slideshare.net/) from [Roderic Page](http://www.slideshare.net/rdmpage)





