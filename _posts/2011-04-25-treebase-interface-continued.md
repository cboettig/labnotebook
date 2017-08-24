---
comments: true
date: 2011-04-25 10:11:31
layout: post
slug: ropensci-interface-continued
title: TreeBASE interface continued...
redirects: [/wordpress/archives/1496, /archives/1496]
categories:
- evolution
---

Returning to exploration of treeBASE interface and my attempt to implement an R interface the API ([earlier entry](http://www.carlboettiger.info/archives/1382))

[Rutger Vos](http://rutgervos.blogspot.com/) has gotten me started, pointing out that the handling of the metadata interface is done separately from the handling of the content (phylogenies and matrices).


## Meta data


Meta-data interface uses the [Open Archives Initiative Protocol for Metadata Harvesting (OAI-PMH)](http://www.openarchives.org/pmh/) which has a [beginners tutorial](http://www.oaforum.org/tutorial/english/page1.htm).  The tutorial provides broad background about the initiative and the basic xml schema, but I didn't find it particularly accessible or get a clear idea of how interacting with the protocol works.

There's a wiki for the [OAI-PMH in TreeBASE](https://sourceforge.net/apps/mediawiki/treebase/index.php?title=OAI-PMH) that doesn't have much information, but suggests that it has support for 6 functions:



	
  * Identify

	
  * List Metadata formats

	
  * List Sets

	
  * List Records

	
  * Get Records (matching certain conditions such as id)

	
  * List Identifiers


which are look like they are accessed by providing a url which returns an xml form with the information.  Not sure what software is expected/avaliable to read/parse this information.

First step: see If I can get some example queries working from a desktop inquiry to a human-readable output.


## Tree Data


Access to the tree data is provided by phylows, which has a bit more extensive [entry on the treebase wiki](https://sourceforge.net/apps/mediawiki/treebase/index.php?title=API).

The interface also specifies a url which begins with purl and returns a page of the treebase website, i.e.

[http://purl.org/phylo/treebase/phylows/study/find?query=dcterms.contributor=Huelsenbeck+or+dcterms.contributor=Ronquist](http://purl.org/phylo/treebase/phylows/study/find?query=dcterms.contributor=Huelsenbeck+or+dcterms.contributor=Ronquist)

The query can be specified to return rss format instead,

[http://purl.org/phylo/treebase/phylows/taxon/find?query=dcterms.title==%22Homo%20sapiens%22&format=rss1&recordSchema=tree](http://purl.org/phylo/treebase/phylows/taxon/find?query=dcterms.title==%22Homo%20sapiens%22&format=rss1&recordSchema=tree)

Will have to learn to specify these urls, but so far I gather that the query above searches for terms Homo Sapiens in the title and requests a return fromat of rss and schema of being a tree(?)

Would have guessed the first url could be returned as a rss object as well by adding:
[ &format=rss1&recordSchema=tree](http://purl.org/phylo/treebase/phylows/study/find?query=dcterms.contributor=Huelsenbeck+or+dcterms.contributor=Ronquist&format=rss1&recordSchema=tree)

but no such luck.

I think the goal will be to parse this output using one of the R interfaces to RSS/RDF.  Not sure the connection between RSS and RDF here, but looking at [Rrdf](http://biostar.stackexchange.com/questions/2069/how-do-i-import-rdf-data-into-r) as an option.

The output can be a Nexus tree or a NeXML tree, the latter having the advantage of being RDFa compliant (but much less commonly used).  Looks like this'll be a steep learning curve...


## First successes


Gabriel Becker got me started on accessing files from urls and xml parsing with a simple code snippet, so now I am up and running.  For instance, I can grab every tree contributed by Price to TreeBASE and load them into R, s[ee example](https://github.com/cboettig/Comparative-Phylogenetics/blob/f24c2011b848d83bdfa66aee89ad65e03a502211/treebase/demos/treebase.R).

Code is now in development in my [treebase](https://github.com/cboettig/Comparative-Phylogenetics/tree/master/treebase) directory (in Comparative Phylognetics) on github. Ready to start mapping out what functions should be implemented.



	
  * Audience readable notebook entry about the package

	
  * List of possible queries with examples

	
  * Function to turn queries into phylows urls.

	
  * Function to parse xml and grab the nexus files or import character matrices.


Update or upload metadata information?  Does tree have branch lengths?  Summary statistics about tree (number of taxa, etc).  Generate independent database of this information?


## Background and Useful references





	
  * Rutger's [slides](http://www.slideshare.net/rvosa/phyloinformatics-and-the-semantic-web).

	
  * [Treebase Wiki on the API](https://sourceforge.net/apps/mediawiki/treebase/index.php?title=API)

	
  * [Types of possible queries](https://spreadsheets.google.com/pub?key=rL--O7pyhR8FcnnG5-ofAlw)





