---
comments: true
date: 2011-05-11 15:12:14
layout: post
slug: wednesday-treebase
title: 'Wednesday: Treebase'
redirects: [/wordpress/archives/1670, /archives/1670]
categories:
- evolution
tags:
- treebase
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
![](data:image/png;base64,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)
](http://www.mathjax.org/)
