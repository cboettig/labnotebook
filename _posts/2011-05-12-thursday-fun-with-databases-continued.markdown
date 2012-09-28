---
comments: true
date: 2011-05-12 20:32:26
layout: post
slug: thursday-fun-with-databases-continued
title: 'Thursday: Fun with databases continued'
redirects: [/wordpress/archives/1692, /archives/1692]
categories:
- evolution
---

## Dryad


Hilmar pointed out the documentation for machine access to Dryad files[ on the wiki](https://www.nescent.org/wg_dryad/Data_Access), much nicer than guessing from the XML. (Good thing too, since it's a bit more complicated than I thought).  Wiki describes four steps:



	
  1. Get the dryad short-identifier for the datafile

	
  2. look up the METS reference using that identifier

	
  3. parse the XML returned by METS to find the bitstream url

	
  4. Query the bitstream url and presto!  Data on demand.


In R:

[gist id=969706]

Will have to return to this for a more complete implementation of the API once TreeBASE includes the Dryad ids.  TreeBASE is also implementing the PRISM standard for metadata in phylo-ws, though apparently Dryad is moving away from PRISM to BIBO.


## Treebase





	
  * Added man pages for [TreeBASE](https://github.com/cboettig/treeBASE), put up new [download](https://github.com/cboettig/treeBASE/archives/master) version 0.0-2.

	
  * Added more error handling to TreeBASE calls.

	
  * Working on examples to ultra-metricize all trees that have branch lengths, currently with chronoMPL.  Some difficulties -- trees that report to have branch lengths but are mostly NAs, and one tree that errors in multi2di even within try().




## Rflickr





	
  * Rflickr is working, had wrong call to permission.  Have to add into socialR now.




## RMendeley





	
  * Finished up public API side for RMendeley, troubleshooting now -- Mendeley's API seems to be ignoring some of my options.


See [github activity for record](https://github.com/cboettig).
