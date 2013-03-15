---
comments: true
date: 2011-05-08 18:39:49
layout: post
slug: building-a-semantic-notebook
title: Building a semantic notebook
redirects: [/wordpress/archives/1626, /archives/1626]
categories:
- open-science
tags:
- notebook-technology
- open-science
- semantics
---

What would a semantic lab notebook look like?  What would be possible with such a structure, ideally?  What is already possible now?  There's a lot that can be done with an electronic notebook that adds value over a paper notebook: browsing by categories and tags, embedding links, time-stamping entries, searching the full text, and having automated trackbacks or pingbacks when a post is mentioned in another post or appears elsewhere on the web.  Despite these advantages, I think a lot more could be possible with a semantic notebook -- where links can be identified with an ontology describing the relationship.  I've found a couple current tools very promising, and would be interested in developing some of these much further.  


There's been a lot written about the potential for linked data and a semantic web elsewhere <a rel="http://purl.org/spar/cito/discusses", resource="http://dx.doi.org/10.2200/S00334ED1V01Y201102WBE001">(Heath & Bizer, 2011)</a>, here I outline what's already possible and what I'd like to see in the context of a lab notebook. My notebook links three primary content sources: literature citations, graphs, and code; as I've [described before](http://www.carlboettiger.info/archives/211).  A more semantic version could make the connections between these elements explicit and machine readable, opening the door to many more possibilities.  
  
![](http://www.carlboettiger.info/assets/files/mynotebook-300x123.png)


### Citations:




#### Existing capabilities


A lot of linked-data meta-data is already supported for citations, but a lot more could be possible.  In my notebook, the citations are included by DOI whenever possible, using the [KCite](http://wordpress.org/extend/plugins/kcite/) plugin (EDIT: now using my [knitcitations](https://github.com/cboettig/knitcitations/iss) package).  [DOI's are linked data](http://inkdroid.org/journal/2011/04/25/dois-as-linked-data/).  Further information can be added to any link using the CITO ontology.  <a rel="http://purl.org/spar/cito/usesMethodIn", resource="http://dx.doi.org/10.1186/2041-1480-1-S1-S6">Shotton (2010)</a>.  The link-to-link plugin,  <a rel="http://prul.org/spar/cito/discusses" resource='http://wordpress.org/extend/plugins/link-to-link'>(Fenner 2011)</a>, can in addition to DOIs can add indicate the reason for the citation.  [Link-2-Link](http://wordpress.org/extend/plugins/link-to-link/installation/) adds the citation to the link library in Wordpress, and can import bibtex documents, though this tends not to be as convenient as citing directly from DOI when it is available.  I'm not sure if [KCite](http://wordpress.org/extend/plugins/kcite/) will include the cito relationship if it is written in without [Link-2-Link](http://wordpress.org/extend/plugins/link-to-link/installation/), as:

    [cite source='doi' rel='cito:discusses']10.1186/2041-1480-1-S1-S6[/cite]
    




#### Desired capabilities:


It would be nice to do a lot more though.  First, it would be great to be able to browse this data efficiently.  It would be great to parse the whole notebook to generate citation statistics, with the ability to identify such things as: which articles I most cite, what reasons I most cite for (from CiTO), links to posts where I disagree with an article, what authors I most cite ((more challenging since it involves looking up information not directly embedded into the post)), etc.

Next, it would be great to be able to include more information in linked data format and pull in information available from other sources.  Most of my citations are correspond to objects in my Mendeley library, where they have added tags, notes, date added to my library, categories, groups, as well as the full suite of further data and reader statistics exposed by Mendeley (such as illustrated in [ReaderMeter](http://readermeter.org/) and [Mendeley API](http://dev.mendeley.com/)).


### Images and Code:




#### What's already possible


Graphs (stored on Flickr) have a direct correspondence to the code that generated them (stored on Github).  This connection could be exposed through some semantic mark-up, identifying which code corresponds to which images and vice versa, as well as identifying such meta-data as when the code was committed or the image generated, author, tags, version, and relationship with other versions and codes.  This meta-data already exists for the most part, but cannot be queried by a machine (give me older/newer versions of this code, or all results run from this code, etc).  Both code and images have stable identifiers/urls.  Within code, versions and dependencies are already handled explicitly, though not perhaps in a machine-readable way.  Code is assigned to different repositories, images to different tags, both with timestamps for commits.  These connections between code an results have been discussed by Gavish and Donoho in [universal identifiers for computational results](http://www.stanford.edu/~vcs/AAAS2011/), among others, but could be particularly powerful using semantic markup.  



#### Making this semantic


The simplest goal would be to extract the information that these links refer to code or refer to images, presumably possible by domain information / plugin short code identification.  Following these links then, some metadata is already exposed by Flickr or github in RDF.  [Flickr returns ](http://inspector.sindice.com/inspect?url=http%3A%2F%2Fwww.flickr.com%2Fphotos%2Fcboettig%2F5692100650&content=#SIGMA)the title, license, and identifiers.  Github[ seems to return](http://inspector.sindice.com/inspect?url=http%3A%2F%2Fgithub.com%2Fcboettig%2FComparative-Phylogenetics%2Fblob%2Ff75d2f79b0469112bf2635e321006e1079fa2c41%2Ftreebase%2FR%2Ftreebase.R&content=) only the title.  Ideally, having come across any graph in the notebook, one could obtain some identifier which would recover other instances where the image has appeared, identify the code that created it (with the code revision history) and pages that link to the code, as well as author information, license (software and image), platform information, etc.


### Other content


There's a lot of other content that is not treated here.  References to people are an obvious candidate for semantic content, though FOAF and XFN (built into Wordpress links) don't seem to capture the notions of "adviser," "labmate," or "co-author," etc.  Pulling up all references to a particular person in the notebook might be useful.

Markup for identifying data analyzed in a post would also be useful.  Like articles, [data is more and more frequently being assigned a DOI](http://datacite.org/), so the goal is simply to couple the post id, graphs and code that analyze the data more tightly to this identifier.  A different solution may be necessary for unpublished data, or for indicating the subset or combination of published data sets used.

Aquiring DOIs for computational results and posts from the California Digital Library's [EZID](http://www.cdlib.org/services/uc3/ezid/index.html) would make richer meta-data tracking possible.  This might be possible to implement for figures through FigShare as well.


### Other Wordpress Plugins


Basic meta-data about the post can be included through the Wordpress plugin [wp-rdfa](http://dev.squarecows.com/projects/wp-rdfa/),  providing FOAF relationships for admin/editors/authors in the wordpress  database and Dublin Core relationships to identify the authors and post  title, but are quite limited. A variety of other Wordpress plugins  also provide semantic support, including  [ontos feeder](http://www.ontos.com/o_eng/index.php?cs=1), [zlinks](http://fgiasson.com/blog/index.php/2007/09/01/blogs-wordpress-zitgist-and-the-semantic-web/), [WPMU-talis-triples-uploader](http://wordpress.org/extend/plugins/wpmu-talis-triple-uploader/) ([Talis](http://www.talis.com)), but I'm not sure any provide the kind of  capacity I discuss above (most attempt to automatically link content from other web sources).  This semantic [inspector tool](http://inspector.sindice.com/index.jsp) is quite useful, as well as a rich example of markup of a scientist's page [from Egon](http://egonw.github.com/).


### Feedback?


I'm curious what others think about these possibility, what they'd like to see in a semantic notebook, and if anyone would be interested in helping further develop these tools, at least in a Wordpress context.


