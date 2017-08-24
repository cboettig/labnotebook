---
comments: true
date: 2011-02-16 23:04:50
layout: post
slug: citation-tools-future-of-publishing
title: Citation tools & Future of Publishing
redirects: [/wordpress/archives/1021, /archives/1021]
categories:
- open-science
tags: 
- notebook-technology
- open-science 
- semantics
- blog

---

There has been a lot of rapid development in scientific tools based  on a Wordpress platform recently, perhaps spurred in part by the recent  [Beyond-the-PDF](https://sites.google.com/site/beyondthepdf/) and [sessions in Science Online](http://blogs.plos.org/mfenner/2011/01/11/having-fun-with-citations-at-scienceonline2011/) conferences.  A new [discussion group](https://groups.google.com/forum/#!forum/wordpress-for-scientists) has emerged around these tools, [as described by Martin Fenner](http://blogs.plos.org/mfenner/2011/02/04/discussing-wordpress-for-scientists/).

I have been exploring better tools for citation management within my  lab notebook. Recently I have been using the [papercite plugin ](http://wordpress.org/extend/plugins/papercite/)to add citations from my BibTeX files, which are generated from Mendeley, as I [described earlier](http://www.carlboettiger.info/archives/570).  This has a few performance issues on server load and memory, and a somewhat limited format/appearance options, but more importantly lacks some of the features of being developed in these other citation packages.

To begin, see Martin's very compelling piece on  [citations are links](http://blogs.plos.org/mfenner/2010/12/11/citations-are-links-so-where-is-the-problem/).  Certainly a link (_i.e._, to the pdf article) can be  _part _of a citation, but there's a lot that can be done once we start thinking of the citation itself as a link.  Wordpress has a nice interface to handle and organize links, which until now has mostly puzzled me as a overdeveloped blogroll.  The [Import BibTeX](http://wordpress.org/extend/plugins/bibtex-importer/) plugin can read my bibliography files and transform each citation into a link in the Wordpress interface, attaching categories corresponding to the source type and to tags I add, (such as to which Mendeley collection the article belongs).  Then the [Link to Link](http://wordpress.org/extend/plugins/link-to-link/) plugin makes it easy to search and insert these references into my posts.  Currently this can't be done using the bibtex keys, which is a minor bother.

Here's where things start to get more interesting.  The links can embed machine-readable semantic information that adds meta-data to the citation, such as if the citation provides background, methods, supports or disagrees with a claim being made.  This can be made visible to the user, but more interestingly this can also be tracked by a computer, which allows for the generation of much more detailed citation statistics.  A standard Citation Typing Ontology has been developed and described by David Shotton[cite source='doi']10.1186/2041-1480-1-S1-S6[/cite] and [CiTO is now implemented ](http://blogs.plos.org/mfenner/2011/02/14/how-to-use-citation-typing-ontology-cito-in-your-blog-posts/)in Link to Link code.  While Link to Link seems to have the 10 most common citation types, the ontology provides many more, as listed in the  [CiTO types](http://imageweb.zoo.ox.ac.uk/pub/2009/citobase/cito-20091124-1.4/cito-content/owldoc/) documentation.

Finally, the automatic bibliographic information is displayed by the [Kcite](http://wordpress.org/extend/plugins/kcite/) plugin, currently using the DOI or PMID, which integrates with the Link to Link code.  Having installed both plugins and checked the configuration boxes in link to link which allow it to use the kcite shortcode and CiTO syntax, I'm able to highlight some text, select the citation through the search box opened by clicking the Link to Link icon and have it automatically insert the Kcite shortcode using the DOI:

    
    [cite source='doi' rel=cito:cites]10.1186/2041-1480-1-S1-S6[/cite]
    


At the moment this doesn't quite work as it seems the rel=cito text disrupts the kcite intepretation of the shortcode.  Without this it renders correctly.

Note that in general Link to Link with CiTO works with anything with a URL, and will still embed the CiTO information in the link if no DOI is available, just not add the kcite bibliography.

Also not sure why the kcite bibliography includes the link to the json format, seems it shouldn't display this.  Still active discussion on the mailing list on these topics, and it's been quite impressive to see how fast development has been moving on these so far.


### THings I'd like to see





	
  * How to expose/search CiTO meta-data.

	
  * kcite option for citing by (Author,year) footnote text, not just by number, like so [1].

	
  * Basic fixes: Kcite currently errors with the rel=cito:cites text.  Should at least ignore that text until support is built in for CiTO.  Apparently link2link should be rendering this with quotes: rel=cito:'cites'.

	
  * toggle json display.




### Why store Citations in a link library in Wordpress?





	
  * Link2Link requires uploading Bibtex file to add the reference to wordpress link library.  Mendeley automatically generates the bibliography -- would be great if this could be automatically placed online (i.e. by dropbox) and read in by Wordpress rather than having to manually update.  Having to import bibtex every time I add a new article, and then search for the added article via link2link, is rather inefficient.  Can merely grab the doi from Mendeley and insert with kcite.

	
  * The most obvious advantage of having the references in the Wordpress link library is the ability for link2link to search them and grab the DOI, though searching Mendeley for the DOI is just as easy.  So why else would this be useful?  A few thoughts:

	
  * The link library allows for adding semantic markup to the link, though currently Wordpress  does this only for [XFN](http://codex.wordpress.org/Defining_Relationships_with_XFN) (XHTML Friends Network), designed to describe people.  Having CiTO directly in the link editor beside XFN would be nice, though not particularly more functional.

	
  * Potential to use blogroll functions of wordpress to display the library listed in the links, though in general Mendeley groups seem a much more powerful way to do this.


