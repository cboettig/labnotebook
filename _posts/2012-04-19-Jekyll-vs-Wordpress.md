---
layout: posts 
title: Jekyll vs Wordpress 
subtitle: which is the better platform for an open lab notebook?
category: OpenScience
---

I am now trying out a Jekyll-based platform rather than a Wordpress based for 
my website and lab notebook.  Don't worry, the Wordpress site still remains where
it was with links intact, I've simply remapped the homepage.  


### Why switch?

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
page sums up the trade-offs between these options very well. Jekyll is a way to have
the best of both worlds -- speed, reliability at minimal cost and the customizations 
possible on a self-hosted Wordpress site, and much more.  

Jekyll is a static blog engine -- it achieves the dynamic nature of a blog and
other Web 2.0 tools that rely on databases by simply compiling (or "baking") plain 
HTML files from the source every time and edit is made to the site. Remarkably, 
even for a large site this can be done in less time than a typical dynamic 
database-driven site can load a single page.  Because the HTML is built in advance,
when a user visits the site it can load instantly with essentially no demand on
the server. (This is essentially what dynamic websites attempt to accomplish by
caching).  


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


### My basic requirements for an electronic notebook

- Dynamic (Blog) posts and static pages, 
- RSS feed, 
- Comments, 
- Categories & tags, 
- Search, 
- MathJax equations, 
- Dynamic citations, 
- Syntax highlighting, 
- Writing posts in markdown, 
- Version control, 
- Visitor statistics,
- embeddable content (twitter streams, feeds, etc.),
- customization of appearance,
- ease of use

I'm glad that Wordpress.org and Jekyll both meet these requirements.  


### Some remaining concerns in switching

- _Wordpress can generate rss feeds for any category or tag on the fly_.  Looks like this is now [possible in Jekyll](https://github.com/pattex/jekyll-tagging). 
- _Wordpress can toggle password and privacy control for each post_. On a independently hosted site, this could be done with an `.htaccess` file and independent hosting (pointless if the source is hosted on github). I known several partially open lab notebooks would have a problem with this.  I use privacy controls occasionally when a collaborator may have reservations, and always for requested editorial reviews.  Such things can remain on my Wordpress site or off-line entirely. 
- Due in part to heavy use of plugins with short-code, migrating my existing posts out of Wordpress and into a static site seems pretty much impossible.  Presumably this should be doable at the front end HTML, if not from the database, but my attempts have been unsuccessful.  For now, old content will continue to live on my Wordpress site.

### Jekyll Configuration Notes 

Probably the only annoying step in setting up a Jekyll blog is getting the right versions of Ruby running.  Strictly speaking, this is unnecessary for sites hosted on Github, which will run Jekyll automatically.  I host on my Dreamhost VPS, for which it is easiest just to compile locally using Jekyll and push on the output HTML files, created in `_site`, to the server.  



* Getting [out of 1.8.7 and into 1.9.2](http://askubuntu.com/questions/91693/how-do-you-uninstall-ruby-1-8-7-and-install-ruby-1-9-2)
* Redcarpet isn't the default interpreter, but works better. However, [it's latest version has issues](http://stackoverflow.com/questions/8395347/gollum-wiki-undefined-method-new-for-redcarpetmodule).
* Actually I find it better to use the latest Redcarpet, [and a plugin](https://github.com/nono/Jekyll-plugins) that lets one use Github-flavored markdown code blocks instead of the silly liquid highlight tags (markdown should be markdown after all). 
* [image alignment in markdown](http://stackoverflow.com/questions/255170/markdown-and-image-alignment)
* [markdown in diqus](http://code.lancepollard.com/jquery-disqus-plugin)

* HTML layouts can import chunks from separate files with a bit of liquid code:

```
{% include file.html %}
```

Where `file.html` lives in the `_includes` directory. See [an example](https://github.com/spo11/kismetik-jekyll)
