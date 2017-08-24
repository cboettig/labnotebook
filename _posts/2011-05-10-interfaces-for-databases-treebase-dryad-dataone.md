---
comments: true
date: 2011-05-10 09:55:57
layout: post
slug: interfaces-for-databases-ropensci-dryad-dataone
title: 'Interfaces for databases: TreeBASE, Dryad, DataONE'
redirects: [/wordpress/archives/1660, /archives/1660]
categories:
- evolution
tags:
- ropensci
---

## Next Steps




### Treebase





	
  * [(See Sunday's post)](http://www.carlboettiger.info/archives/1632) - Phylo-ws implemented, but a few extra functions would strengthen the interface a bit: limit the number of trees returned, querying trees for branch lengths,

	
  * RaXML pipeline for returning rough branch lengths conditioned on the given topology, user documentation, more test examples.



	
  * Implement OAI-PMH test cases for treebase: For instance, query all records after a given date (or all possible other queries), i.e.


[http://treebase.org/treebase-web/top/oai?verb=ListRecords&metadataPrefix=oai_dc&after=1996-11-04T00:00:00Z](http://treebase.org/treebase-web/top/oai?verb=ListRecords&metadataPrefix=oai_dc&after=1996-11-04T00:00:00Z)

And return treebase ids that can then be handed to search_treebase to pull the phylogenies. [DONE 2011-05-11](http://carlboettiger.info/archives/1670)



	
  * Pull treebase ID from phylo-ws query and return the corresponding OAI-PMH metadata information. [DONE 2011-05-11](http://carlboettiger.info/archives/1670)




### Interfacing with Dryad:





	
  * Currently neither repository seems to always provide the key identifiers to point to the other one.  For instance, William Piel points out the same study [in TreeBASE](http://treebase.org/treebase-web/search/study/anyObjectAsRDF.rdf?namespacedGUID=TB2:S11266) and [in Dryad,](http://datadryad.org/handle/10255/dryad.8661) where neither links to the other.   Not sure why this study doesn't get listed in [Dryad's search returns](http://datadryad.org/discover?&query=&filtertype=dc.title&filter=Bridging+the+Rubicon&submit_search-filter-controls_add=Add&rpp=10&sort_by=score&order=DESC&location=l2).  Discussing with members of both teams (William, Rutger, and Harry with TreeBASE, Kevin and Ryan with Dryad) about addressing this.

	
  * [Sometimes Dryad does provide the treebase url](http://datadryad.org/handle/10255/dryad.4939?show=full), but would have to identify from the url directly (after parsing all dc:idenfier terms), as it isn't more clearly specified.

	
  * GOAL: From a TreeBASE query (for trees/phylo-ws or metadata/OAI-PMH): be able to return Dryad data and metadata associated with the study.

	
  * GOAL: From Dryad-query: return trees associated with a Dryad study by querying TreeBASE.




### Dryad Implementation GOALS:





	
  * Extend OAI-PMH interface to the [Dryad API](https://datadryad.org/wiki/API)

	
  * Current [Dryad returns ](http://www.datadryad.org/oai/request?verb=GetRecord&identifier=oai:datadryad.org:10255/dryad.1619&metadataPrefix=oai_dc)don't include clear identifiers to [the data files](http://datadryad.org/handle/10255/dryad.1621) urls.

	
  * Work with Dryad to figure out how to access data files as well as meta-data from the API.

	
  * Extend to[ DataONE API](http://mule1.dataone.org/ArchitectureDocs-current/apis/index.html)?  Presumably will also have OAI-PMH based access to metadata?





## BACKGROUND (NOTES IN PROGRESS)


A few further development goals

Define the databases, API, goal.

Define teams, discussions, wikis, lists.

Development goals listed/tracked as Issues on the Github repository


## 
