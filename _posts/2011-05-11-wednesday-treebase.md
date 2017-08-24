---
comments: true
date: 2011-05-11 15:12:14
layout: post
slug: wednesday-ropensci
title: 'Wednesday: Treebase'
redirects: [/wordpress/archives/1670, /archives/1670]
categories:
- evolution
tags:
- ropensci
---

[TREEBASE PACKAGE](https://github.com/cboettig/treeBASE):





	
  * Modified treebase package to return the treebase id in the phylo class as phy$id, so that I can use the id to query the appropriate meta data.

	
  * Modified the package with the option to return only max number of trees,

    
        try(xpathApply(search_returns, paste("//rdf:li[position()< ", max_trees, "]", sep=""),
                 function(x){
    ...




	
  * Modified to check for branch lengths and remove trees without branch lengths from the returned set. Still has to download all trees, so in this case max_trees is the number attempted, not the number returned.




#### XPATH AND METADATA


Trying to learn XPath from the [W3 tutorial](http://www.w3schools.com/xpath/xpath_syntax.asp) in order to parse the OAI-PMH output (like this, for a single [treebase entry](http://treebase.org/treebase-web/top/oai?verb=GetRecord&metadataPrefix=oai_dc&identifier=TB:s1234)). Not much success.  Oooh, Duncan introduced me to getNodeSet() and xmlToList(), now I can query the metadata for the tree(!)

    
         tree <- search_treebase("1234", "id.tree")
         metadata(tree$id)





	
  * Since the metadata  API is quite small, (see [treebase wiki on OAI-PMH](http://sourceforge.net/apps/mediawiki/treebase/index.php?title=OAI-PMH)) just about done with treebase implementation, short of testing, documentation and use cases.

	
  * Grabbing study by date could be useful (supports at least "until" and "after".)  Can "ListRecord" or "GetIdentifier".  The latter can be useful to get ids to feed into search_treebase(), allowing the user to query all studies after a certain date, for instance. (DONE -- see examples.)

	
  * And now the treebase server for OAI-PMH seems to be down. Maybe a sign I should return to some real work.

	
  * Managing the to-do lists for treeBASE under [github-issues](https://github.com/cboettig/treeBASE/issues) (much more sensible than flipping through notebook pages).




## DRYAD


Implemented the basic Dryad metadata query GetRecord given an ID.  (forms the api query and parses output).  Uses the same OAI function as the treebase query:

    
    dryad_metadata("10255/dryad.12")


Now I just need:



	
  * a way to get Dryad IDs from the TreeBASE query, (server-side issue)

	
  * a way to grab the doi pointing to each data file (not the paper doi, or the study doi.  This is returned in $relation, along with other stuff such as the journal title, so will need a grep on doi at the moment).

	
  * A way to get from the webpage returned to get the actual url of the data (<del>also a server-side issue </del>) Actually was already in the documentation on the wiki.   [DONE, see 2011-05-12](http://www.carlboettiger.info/archives/1692)




## RFlickr





	
  1. Revisiting Rflickr now that Duncan has added write permissions.  install.packages("Rflickr", repos = "[http://www.omegahat.org/R](http://www.omegahat.org/R)")

	
  2. Look up key and secret for my [registered app](http://www.flickr.com/services/apps/by/cboettig) (others must[ register an app](http://www.flickr.com/services/apps/create/apply))

	
  3. Authenticate with write permissions -- Go quickly after issuing this command into browser and approve access before the timeout. NOTE: PERMISSION IS SINGULAR - - won't error if it is plural.   tok <- Rflickr::authenticate(api_key, secret, permission="write") 

	
  4. We can use the full [flickr api](http://www.flickr.com/services/api/) just as described, except that we need to start everything with secret, tok, and then as specified in the API (api_key, other options).  I.e. for [flickr.people.getInfo](http://www.flickr.com/services/api/flickr.people.getInfo.html) we would do: flickr.people.getInfo(secret, tok, api_key, "30385402@N05")

	
  5. Instead we can use the clever interface to avoid having to give these keys each time.  (See documentation): we make a session once: > session = flickrSession(secret, tok, api_key)

	
  6. and can now call with session$ and skip the "flickr" everywhere it occurs, and skip the keys, i.e.:  session$people.getInfo("46456847@N08")

	
  7. Note: we could have left flickr in too: session$flickr.people.getInfo("46456847@N08").  Partial matching in R is fantastic.

	
  8. All this is great <del>but having trouble with write permissions still.</del>.. farther than[ last time](http://www.carlboettiger.info/archives/1355) though.  Working, should have used singular, as noted above.  ToDo: integrate into socialR package.




## Wordpress, RWordpress


There's a [JSON API for Wordpress](http://wordpress.org/extend/plugins/json-api/), that allows downloading post data, also optionally making posts, editing posts and tags, etc from the API.  An implementation of this in R would be straight forward using RCurl and RJSONIO.  Duncan has an RWordpress package (on Omegahat) that does this the official/direct way for blogs as well.


## CHATS AND READING


Discussing with Brian Anackner some ways of looking for evidence of correlations in transition rates using contrasts. Taking an example from [cite source='pubmed' rel="cito:DisagreesWith"]16261729[/cite] the method proposed in [cite source='pubmed' rel="cito:UsesMethod"]7583692[/cite], which combines independent contrasts in discrete and continuous traits. Say categorical traits are E and N and continuous trait is affinity for precipitation level. This method pairs them so that contrasts are taken only between E and N, and in the the same order each time, E - N (or vice versa). It seems to me this simply suggests that large values means E's tend to be found more often in higher-precipitation climates.

Rebecca Best suggests I take a look at [cite rel="cito:UsesMethod"]10.1890/10-1264.1[/cite].




## UPGRADING TO A VPS


Time to upgrade this site to a [virtual private server on DreamHost](http://www.dreamhost.com/hosting-vps.html).  We'll see how it goes, hopefully things get faster now.


## mathjax


Meanwhile, Jason Moore suggested just adding the mathjax to the header file, as [described on the MathJax homepage](http://www.mathjax.org/docs/1.1/platforms/index.html).  Doesn't need any libraries installed as it uses their CDN, and so is quite fast.  Won't convert my wp-latex but will work with inline equations, $y=mx+b$, and displayed equations.  Wonder if I'll have to manually edit the header file if I upgrade my theme.

\[\frac{1}{\Bigl(\sqrt{\phi \sqrt{5}}-\phi\Bigr) e^{\frac25 \pi}} =
1+\frac{e^{-2\pi}} {1+\frac{e^{-4\pi}} {1+\frac{e^{-6\pi}}
{1+\frac{e^{-8\pi}} {1+\ldots} } } }\]

$$\begin{aligned}
\nabla \times \vec{\mathbf{B}} -\, \frac1c\, \frac{\partial\vec{\mathbf{E}}}{\partial t} & = \frac{4\pi}{c}\vec{\mathbf{j}} \\   \nabla \cdot \vec{\mathbf{E}} & = 4 \pi \rho \\
\nabla \times \vec{\mathbf{E}}\, +\, \frac1c\, \frac{\partial\vec{\mathbf{B}}}{\partial t} & = \vec{\mathbf{0}} \\
\nabla \cdot \vec{\mathbf{B}} & = 0 \end{aligned}$$

    
    $ $    
    $$ $$ or $$ $$  




To give credit where it's due: now, powered by:
[
![Powered by MathJax](http://www.mathjax.org/badge-square-3.png)
](http://www.mathjax.org/)
