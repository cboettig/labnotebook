---
layout: post
published: false
category: open-science
tags: notebook-technology

---

(Each should link to a post)

Constantly exploring features in  the Notebook -- check out the issues log for a list of implemented and pending activities.   

1. **Mobile devices** 

1. **knitr**  I now use the dynamic documentation software called knitr to write most entries that shore results and figures. The code to replicate the results is included automatically, ensuring that what I say I did and what code I actually ran to get the results are always consistent. 

1. **version history** I also version manage all changes to any entry using GitHub. Each page is linked to its Github source, which will display the history of any edits to the post.  This is often considered an essential part of an open lab notebook, where changes to the notebook are documented and preserved.  While wikis, google docs, dropbox, wordpress plugins, or just regular backups can provide version history of pages, none come close to comparison with a full version management system such as git. [The magic of SHA hashes](http://www-cs-students.stanford.edu/~blynn/gitmagic/ch08.html) 

Having a git repository, rather than a mysql database, as the underlying data structure for the notebook  

1. **Collaboration and issue tracking** on Github.  

1. **Fast static content** The notebook involves a lot of dynamic content - feed excerpts are drawn from my Mendeley literature library, my twitter comments, and my github activity, new posts appear on the lab-notebook page while also updating the pages for categories and tags, and posts show their pageviews.  Many websites today rely on dynamically generated pages in which the content is drawn from mysql databases and php scripts, which put substantial demands on the server.  This results in significant cost and downtime.  For nearly two years this site operated on Wordpress running on a virtual private server at a cost of around $30 a month.  Today the site is built each time a new entry is submitted, updating all the dynamic content into static HTML files through Jekyll.  This allows the site to be served from platforms that do not require expensive memory, database access and PHP scripts -- the site can be deployed for about $1/mo on Amazon S3 static hosting, or for free on Github. Page load times are much faster and uptime is improved.  Javascript can be included in static sites, as it uses the resources of the viewer's browser rather than the hosting server, providing for more interactive features such as the Mathjax equation rendering, tooltips, and analytics.   

1. **Online access** Edit anywhere

1. **Offline access** Many sites that have the benefit of online access, editable from any browser, have the corresponding disadvantages that they cannot be accessed or edited without a decent internet connection, and typically require users to work in their browser-based editor rather than their prefered text-editing environment, such as vim (though of course technical work-arounds are avaialble).  This site sits in a local repository where it can easily be edited offline.  

1. **Visitor analytics**

1. **Archiving** As the permenant record of my scholarly endeavors, the notebook is archived 

1. **Beautiful equations with Mathjax**

1. **Machine parsing**
1. **Meta-data embedding** 

