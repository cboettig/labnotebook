---
layout: post 
title: Jekyll vs Wordpress 
subtitle: which is the better platform for an open lab notebook?
category: OpenScience
---

I am now trying out a Jekyll-based platform rather than a Wordpress based for 
my website and lab notebook.  Don't worry, the Wordpress site still remains where
it was with links intact, I've simply remapped the homepage.  


# Why switch?



Wordpress was great, meeting most of my needs for a customizable site that I 
couldn't really accomplish in my first online notebook on 
[OpenWetWare](http://openwetware.org). Unfortunately, despite caching and 
a variety of other optimization steps, Wordpress remains very demanding
of computational power, and consequently both expensive and unstable to traffic
bursts. Relying on Wordpress.com would avoid this, but loses some of the 
customization and flexibility -- particularly plugins for 
[MathJax](http://mathjax.org) and 
[kcite](http://wordpress.org/extend/plugins/kcite/), as well as anything 
needing a script.  The 
[Wordpress.com vs Wordpress.org](http://en.support.wordpress.com/com-vs-org/)
page sums up the trade-offs between these options very well. 



Jekyll is a way to have the best of both worlds: speed, reliability and minimal cost 
coupled with boundless flexibility. Wordpress, like many Web2.0 applications,
relies on a database to dynamically build pages when they are called.  This makes 
the platform flexible but also slow and heavy.  Jekyll builds a static site ahead
of time out of markdown files that contain the site's content, with just a tiny
bit of pain-text metadata at the top saying how the page or post should appear.
The actual layout is given as an HTML template that has little tags on where to 
insert the text. Because the HTML is built in advance,
when a user visits the site it can load instantly with essentially no demand on
the server. (This is essentially what dynamic websites attempt to accomplish by
caching). Surprisingly, compiling even a large website takes only a second.   


My greatest reservation in this shift comes from the vibrant user and developer
community on Wordpress (Wordpress powers an estimated 14% of the top 1 million websites)
including a 
[Wordpress-for-Scientists group](https://groups.google.com/forum/#!forum/wordpress-for-scientists). 
This means that almost anything you 
want has already been done.  A downside is the need to know PHP and Wordpress-specific 
implementation to do anything the community hasn't already provided.  Thanks to
Github and it's particular appeal to the developer community as a "hacker's blog"
Jekyll has a powerful and growing community of it's own. It's not a content management
system (CMS), and unlike Wordpress will doubtfully ever become one -- but several 
tools are now coming online to make Jekyll more accessible, such as 
[octopress](http://octopress.org/), [jekyllbootstrap](http://jekyllbootstrap.com/) 
and [ruhoh](http://ruhoh.com/). These provide some good examples of how to do the 
more tricky dynamic things like generating an atom feed or a list of posts by tag.
These also get away from having to generate custom CSS and HTML -- however, with rich
CSS options such as twitter-bootstrap available, I've found I actually prefer writing
my own HTML templates for pages and posts. 

Still, the emphasis on Github and the somewhat convoluted dependencies on Ruby surely
make Jekyll a bit intimidating to new users looking to set up a simple website or lab 
notebook.  On the plus side, very little of what one learns to create a Jekyll site
is specific to Jekyll, making it both faster to learn coming from some web development
background and useful beyond the immediate application here.  


# My basic requirements for an electronic notebook

- Dynamic (Blog) posts and static pages 
- RSS feed 
- Comments 
- Categories & tags 
- Search 
- MathJax equations (and numbering) 
- Dynamic citations 
- Syntax highlighting 
- Writing posts in markdown 
- Version control 
- Visitor statistics
- embeddable content (twitter streams, feeds, etc.),
- customization of appearance
- ease of use

I'm glad that Wordpress.org and Jekyll both meet these requirements.  


# Some remaining concerns in switching

- _Wordpress can generate rss feeds for any category or tag on the fly_.  Looks like this is now [possible in Jekyll](https://github.com/pattex/jekyll-tagging). 
- _Wordpress can toggle password and privacy control for each post_. On a independently hosted site, this could be done with an `.htaccess` file and independent hosting (pointless if the source is hosted on github). I known several partially open lab notebooks would have a problem with this.  I use privacy controls occasionally when a collaborator may have reservations, and always for requested editorial reviews.  Such things can remain on my Wordpress site or off-line entirely. 
- Due in part to heavy use of plugins with short-code, migrating my existing posts out of Wordpress and into a static site seems pretty much impossible.  Presumably this should be doable at the front end HTML, if not from the database, but my attempts have been unsuccessful.  For now, old content will continue to live on my Wordpress site.

# Jekyll Configuration Notes 

Probably the only annoying step in setting up a Jekyll blog is getting the right versions of Ruby running.  Strictly speaking, this is unnecessary for sites hosted on Github, which will run Jekyll automatically.  I host on my Dreamhost VPS, for which it is easiest just to compile locally using Jekyll and push on the output HTML files, created in `_site`, to the server.  

- Dynamic posts -- out of the box 
- RSS feed -- just create an appropriate [atom.xml file](https://github.com/cboettig/cboettig.github.com/blob/master/atom.xml) with a bit of Jekyll Liquid code.
- Comments -- paste Disqus code into [html template](https://github.com/cboettig/cboettig.github.com/blob/master/_layouts/default.html)
- Categories & tags -- built-in through YML frontmatter
- Search -- Google search or Tipue
- MathJax equations (and numbering) -- [Just add the javascript call to the html template](https://github.com/cboettig/cboettig.github.com/blob/master/_layouts/default.html)
- Dynamic citations -- Pandoc or my knitcitations tool, for now.
- Syntax highlighting -- use Github notation with Redcarpet2
- Writing posts in markdown -- native
- Version control -- [on Github](https://github.com/cboettig/cboettig.github.com/)
- Visitor statistics -- [Google analytics in layout](https://github.com/cboettig/cboettig.github.com/blob/master/_layouts/default.html)
- embeddable content (twitter streams, feeds, etc.) -- add scripts to html templates
- customization of appearance -- [twitter bootstrap](http://twitter.github.com/bootstrap) for the css and javascript + html templates
- ease of use -- The ability to move around markdown documents and html layouts. 



- Getting [out of 1.8.7 and into 1.9.2](http://askubuntu.com/questions/91693/how-do-you-uninstall-ruby-1-8-7-and-install-ruby-1-9-2)
- Redcarpet isn't the default interpreter, but works better. However, [it's latest version has issues](http://stackoverflow.com/questions/8395347/gollum-wiki-undefined-method-new-for-redcarpetmodule).
- I find it better to use the Redcarpet2, [and a plugin](https://github.com/nono/Jekyll-plugins) that lets one use Github-flavored markdown code blocks instead of the silly liquid highlight tags (markdown should be markdown after all). Unfortunately this prevents Github's Jekyll from building the site at the moment, which doesn't yet support Redcarpet2.
- [image alignment in markdown](http://stackoverflow.com/questions/255170/markdown-and-image-alignment)
- [markdown in diqus](http://code.lancepollard.com/jquery-disqus-plugin)
- HTML layouts can import chunks from separate files given in `_include` directory using a bit of liquid code. See [an example](https://github.com/spo11/kismetik-jekyll).  Perfect for creating layouts out of different combinations of elements.  
