---
comments: true
date: 2011-05-08 23:16:24
layout: post
slug: sunday-a-few-ropensci-r-package-updates
title: 'Sunday: a few Treebase R package updates'
redirects: [/wordpress/archives/1632, /archives/1632]
categories:
- evolution
tags:
- ropensci
---

Working on a few updates to the TreeBASE package.  This flushes out the basic functionality provided by the phylo-ws API now. Needs a bit more testing of the possible queries and some bells and whistles options.  Meanwhile, going to start looking at the metadata side with the [OAI-PMH](http://www.openarchives.org/pmh/) API.  With this I should be able to grab metadata associated with a tree or the tree associated with the metadata.  Should also be able to extend the queries over to other databases such as Dryad.



	
  * Looking into what might currently exist: apTreeshape (Bortolussi _et. al._ 2005) had a dbtrees function which has [since been removed](https://stat.ethz.ch/pipermail/r-sig-phylo/2010-September/000767.html).  Scott Chamberlain has is also [exploring this a bit](http://r-ecology.blogspot.com/2011/05/treebase-trees-from-r.html), sounds like a good person to talk to.

	
  * Fixed many of the XML parsing errors and warnings by moving to RCurl for queries:


    
    # Use
     tt = getURLContent(query, followlocation = TRUE)
    #instead of
     con = url(query)
     tt = readLines(con, warn = FALSE)
     close(con)


	
  * This adds RCurl as a dependency.  (Following Duncan's suggestion to keep from polluting the namespace, I've moved dependencies into imports instead).

	
  * implemented the remaining use cases, needs testing of these other query types still.  A few extra tests have been added to the demos.

	
  * Automatically matches section, rather than specifying as a third argument.

	
  * Implemented handling for boolean logic, not clear that the API handles these cases correctly?  Seems to do OR, but treats AND and NOT as if it was also OR.

	
  * Joined Treebase-devel@lists.sourceforge.net.  Should probably post about this work and ask about this boolean trouble.

	
  * Made output a multiPhylo object.




## To-Do





	
  * Should add faculties to return only trees with branch lengths, etc. [DONE 2011-05-11](http://carlboettiger.info/archives/1670)

	
  * Should figure out how to pull metadata from returned matches.  Possibly grab the TB id number, and then use a separate query to pull that up. [DONE 2011-05-11](http://carlboettiger.info/archives/1670)

	
  * Consider maximum number of returns on a query. [DONE 2011-05-11](http://carlboettiger.info/archives/1670)

	
  * Hm: Given a id like TB2-S2377 number (study id), why do these both return unrelated trees, and what is a id.tree?


studies <- search_treebase("2377", by="id.study")
tree <- search_treebase("2377", by="id.tree")

	
  * Treebase [wiki entry](http://sourceforge.net/apps/mediawiki/treebase/index.php?title=API) for the phylo-ws api

	
  * leveraging predicates?  What's [this section of the wiki](http://sourceforge.net/apps/mediawiki/treebase/index.php?title=API#Output_formats) really about?




## Metadata and OAI-PMH





	
  * Needs to get study id from the phylows query and then look up the metadata.  See [treebase wiki](http://sourceforge.net/apps/mediawiki/treebase/index.php?title=OAI-PMH).  (Pretty sparse, maybe I should add something).  [DONE 2011-05-11](http://carlboettiger.info/archives/1670)


Example queries:

	
  * [http://treebase.org/treebase-web/top/oai?verb=GetRecord&metadataPrefix=oai_dc&identifier=TB:s1234](http://treebase.org/treebase-web/top/oai?verb=GetRecord&metadataPrefix=oai_dc&identifier=TB:s1234)

	
  * [http://treebase.org/treebase-web/top/oai?verb=ListRecords&metadataPrefix=oai_dc&after=1996-11-04T00:00:00Z](http://treebase.org/treebase-web/top/oai?verb=ListRecords&metadataPrefix=oai_dc&after=1996-11-04T00:00:00Z)




## References


- Bortolussi N, Durand E, Blum M and Francois O (2005).
"Aptreeshape: Statistical Analysis of Phylogenetic Tree Shape."
*Bioinformatics*, **22**.
ISSN 1367-4803, <a href="http://dx.doi.org/10.1093/bioinformatics/bti798">http://dx.doi.org/10.1093/bioinformatics/bti798</a>.
