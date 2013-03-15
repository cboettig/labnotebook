---
layout: post
published: false
category: open-science
tags: 
- notebook-technology
- blog

---


In keeping this open lab notebook, I have sought to address three goals (in addition to all the traditional reasons for keeping a lab notebook)

1. Provide an educational resource
2. Experiment with scientific infrastructure and tools for sharing and replicating research
3. Facilitate the rapid and open dissemination of scientific research

which are coincidentally evocative of [NSF's Broader Impacts](http://www.nsf.gov/pubs/2007/nsf07046/nsf07046.jsp) areas.  In this series of posts I plan to explore and illustrate some of my experiments with number 2 on this list, "experimenting with scientific infrastructure" -- namely, some of the web-based tools that advance the potential of this platform substantially beyond the utility of the venerable paper bound notebook.  Many of these have been documented in the notebook itself as I experiment with them (see [#notebook-technology](http://www.carlboettiger.info/tags.html#notebook-technology)).  Not all of those experiments pan out and older tools and techniques are often replaced with newer ones as I explore, and these posts are usually more technical notes written to help me think through and remember what I'm trying out.  In order to provide a more accessible snapshot of notebook features, I thought it might be helpful to write a series of posts describing these tools and techniques.  



1. **knitr**  (#2, reproducible) I now use the dynamic documentation software called knitr to write most entries that shore results and figures. The code to replicate the results is included automatically, ensuring that what I say I did and what code I actually ran to get the results are always consistent. 

1. **version history** I also version manage all changes to any entry using GitHub. Each page is linked to its Github source history, which will display a list of all previous edits to the post with an easy-to-read commit log and highlighted diffs.  This is often considered an essential part of an open lab notebook, where changes to the notebook are documented and preserved.  While wikis, google docs, dropbox, wordpress plugins, or just regular backups can provide version history of pages, none come close to comparison with a full version management system such as git. 

History with Hashes: an immutable and verifiable record

[The magic of SHA hashes](http://www-cs-students.stanford.edu/~blynn/gitmagic/ch08.html) 

Rather than store all content in a mysql database, the underlying data structure for the notebook is essentially a flat collection of files.  Neither any particular technology or skill is required to understand or parse the content.  (This is a natural feature of Jekyll, in which these files are easily human readable thanks to markdown).  

1. **Collaborative benefits of the Git/Github model**.  An earlier post has covered how this notebook uses Git for version management and displaying version history. A second benefit of having the notebook data on a github repository  





Online access, Offline access
-----------------------------


Edit anywhere.  Though many sites that have the benefit of online access through browser-based editors like the Wordpress dashboard, this brings the corresponding disadvantages that they cannot be accessed or edited without a decent internet connection, and typically require users to work in their browser-based editor rather than their prefered text-editing environment, such as vim (though of course technical work-arounds are avaialble).  This site sits in a local repository where it can easily be edited offline.  





Archiving
---------

(#2 reproducible, #3 facilitate communication over long run).  

As the permenant record of my scholarly endeavors, the notebook is archived on figshare.  This is less straight forward than it may seem, and has gone through a few iterations: 

1. Archiving the markdown. 
2. Archiving the HTML.  
3. Archiving external images with Data URIs.  
4. Archiving the whole git repository, `_site` HTML included.  



Fast and cheap static content
-----------------------------

One goal in exploring technology for the notebook is to identify approaches that can easily be employed by other scholars with a minimum investment of resources.  To begin with, the site is built entirely on free and open source technology.  Even such software can still require substantial hardware resources to deploy when feature laden, which can lead to high web hosting bills, slow response times and site downtime.  The latest incarnation of the notebook is also the lightest, delivering the rich features described in this series using minimal requirements provided for free by several hosting options today.  

The notebook involves a lot of dynamic content - feed excerpts are drawn from my Mendeley literature library, my twitter comments, and my github activity, new posts appear on the lab-notebook page while also updating the pages for categories and tags, and posts show their pageviews.  Many websites today rely on dynamically generated pages in which the content is drawn from mysql databases and php scripts, which put substantial demands on the server.  This results in significant cost and downtime.  


For nearly two years this site operated on Wordpress running on a virtual private server at a cost of around $30 a month.  Today the site is built each time a new entry is submitted, updating all the dynamic content into static HTML files through Jekyll.  This allows the site to be served from platforms that do not require expensive memory, database access and PHP scripts -- the site can be deployed for about $1/mo on Amazon S3 static hosting, or for free on Github. Page load times are much faster and uptime is improved.  Javascript can be included in static sites, as it uses the resources of the viewer's browser rather than the hosting server, providing for more interactive features such as the Mathjax equation rendering, tooltips, and analytics.  No essential content is provided solely through javascript to ensure that readers without javascript or machine-parsing tools do not miss it.   

nearlyfreespeech.net will also provide free webhosting of static content.  

More tools for communicating / sharing


Social network integration
--------------------------

Plugins for Mendeley, Github, Twitter


RSS/Atom feed
-------------


Mobile devices 
--------------

(#3, rapid & open dissemination)  

Beautiful equations with Mathjax
--------------------------------


Site search
-----------

Many ways.  Local tools provide the most powerful approach.  

1. grep/sed in the file repository.  
2. Javascript-based search.  
3. Google's index.  


Visitor analytics
-----------------

Analytics plugin for public pageviews


Commenting
----------

Commenting is actually the weakest system, as the data is not easily accessible to archiving or management.  
