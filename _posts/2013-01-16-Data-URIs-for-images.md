---
layout: post
category: open-science
tags: site-configuration
published: false

---

Have been back in manuscript writing mode for while, making for little by the way of notebook entries.  But in reading I came across the concept of [data URIs]() for images, and the concept is so clever and useful for the lab notebook as to warrant some discription.  


Figures have been one of the standing challenges of the 

To display figures in an electronic notebook requires that they are uploaded somehow. 

## Background

<<<<<<< HEAD
I began by uploading images manually while the notebook was in wiki format on OpenWetWare.  Soon I discovered that it was much easier to upload them programmatically.  To accomplish this, I used Flickr as the image hosting service, which provided a convenient API for automating the process which integrated nicely with R.  When `knitr` appeared on the scene and became central to my workflow, I was pleased to discover that it already supported automatic uploads using the imgur service, and was easy to extend to Flickr, Wordpress or other server. 

Unfortunately, external content does not lend itself to archiving well.  Archiving a web based platform requires 
=======
I began by uploading images manually while the notebook was in wiki format on OpenWetWare.  Soon I discovered that it was much easier to upload them programmatically.  To accomplish this, I used Flickr as the image hosting service, which provided a convenient API for automating the process which integrated nicely with R.  When `knitr` appeared on the scene and became central to my workflow, I was pleased to discover that it already supported automatic uploads using the imgur service, and was easy to extend to Flickr, Wordpress or other server.  
>>>>>>> image-uri

Since I have moved to Jekyll, notebook entries have become more portable objects independent of the web servers and software.  The contents of each entry is contained as a markdown file in the `_posts` directory.  These plain-text, UTF-8 files are transformed into the HTML for the notebook posts, but can also be browsed directly in their repository, an advantage over database based methods. 

## Difficulties

The challenges with this approach are most obvious in considering the archiving the notebook.  

Does not display on Github markdown files.  
