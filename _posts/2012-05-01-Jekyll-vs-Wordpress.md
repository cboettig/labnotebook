---
layout: post 
title: Jekyll vs Wordpress 
subtitle: which is the better platform for an open lab notebook?
category: open-science
tags:
- notebook-technology
- Jekyll

---

I am now trying out a [Jekyll-based platform](https://github.com/mojombo/jekyll)
rather than a Wordpress based for 
my website and lab notebook.  Don't worry, the Wordpress site still remains where
it was with links intact, I've simply remapped the homepage.  For now this 
is an experiment, we'll see how it goes.  


# Why switch?

## Speed 

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
page sums up the trade-offs between these options very well. Jekyll, on the other
hand, is light as a feather.  All the content is static, like in the early days
of the web, rather than served on the fly through dynamic databases.  This means
that the site can load instantly even from a low-power server. A lot has been 
written about the advantages of static sites, which seem to be on the rise these
days, so I won't add much more here.  

## Markdown

Markdown syntax has become my Lingua Franca of day-to-day work, thanks to tools
such as knitr and pandoc.  It allows me to have files in a single format that 
are maximimally mobile, displaying well on Github, converting into LaTeX or 
MS Word manuscripts, and even running as R code.  It doesn't force me to work
in a source format that is surrounded by markup code which makes things hard
to read without rendering them, such as LaTeX or HTML, which frees me to focus
on content.  The common format means that I can take some R script I write
and surround it with meaningful comments, math, etc, which can be easily 
shared on Github and later adapted into a manuscript without worrying about formats.
(I've written about this [workflow here](http://www.carlboettiger.info/archives/4325)
and adapting it to [manuscripts here](http://www.carlboettiger.info/archives/4419)).
Now this works seemlessly on my website as well, instead of needing custom shortcode
for Wordpress syntax highlighting, etc.  For instance, here's a 
[recent code script](http://www.carlboettiger.info/ecology/2012/04/30/Sethi.html)
I just dropped into my `_posts` directory and added the yaml header.

## Reservations

My greatest reservation in this shift comes from the vibrant user and developer
community on Wordpress (Wordpress powers an estimated 14% of the top 1 million websites)
including a 
[Wordpress-for-Scientists group](https://groups.google.com/forum/#!forum/wordpress-for-scientists). 
This means that almost anything you want has already been done.  A downside is 
the need to know PHP and Wordpress-specific 
implementation to do anything the community hasn't already provided.  Thanks to
Github and it's appeal as a "hacker's blog," Jekyll has a powerful and growing 
community of it's own. It's not a content management system (CMS), and unlike 
Wordpress will doubtfully ever become one -- but several 
tools are now coming online to make Jekyll more accessible, such as 
[octopress](http://octopress.org/), [jekyllbootstrap](http://jekyllbootstrap.com/) 
and [ruhoh](http://ruhoh.com/). These provide some good examples of how to do the 
more tricky dynamic things like generating an atom feed or a list of posts by tag.
These also get away from having to generate custom CSS and HTML. However, with rich
CSS options such as twitter-bootstrap available, I've found I actually prefer writing
my own HTML templates for pages and posts. 

The other downside of a Jekyll based blog is that it may be a less effective platform
to convince others to try out a lab notebook.  The emphasis on Github and the somewhat
convoluted dependencies on Ruby surely make Jekyll a bit intimidating to new users.



# Some remaining concerns in switching

- _Wordpress can generate rss feeds for any category or tag on the fly_.  Looks like this is now [possible in Jekyll](https://github.com/pattex/jekyll-tagging). 
- _Wordpress can toggle password and privacy control for each post_. On a independently hosted site, this could be done with an `.htaccess` file and independent hosting (pointless if the source is hosted on github). I known several partially open lab notebooks would have a problem with this.  I use privacy controls occasionally when a collaborator may have reservations, and always for requested editorial reviews.  Such things can remain on my Wordpress site or off-line entirely. 
- Due in part to heavy use of plugins with short-code, migrating my existing posts out of Wordpress and into a static site seems pretty much impossible.  Presumably this should be doable at the front end HTML, if not from the database, but my attempts have been unsuccessful.  For now, old content will continue to live on my Wordpress site.

# My basic requirements for an electronic notebook

Leaving Wordpress, I have a few basic requirments for a notebook system.  Fortunately it is pretty easy to enjoy all these features in Jekyll.  

- **Dynamic posts**:  Works out of the box 
- **RSS feed**: just create an appropriate [atom.xml file](https://github.com/cboettig/labnotebook/blob/master/atom.xml) with a bit of Jekyll Liquid code.
- **Comments**: paste Disqus code into [html template](https://github.com/cboettig/labnotebook/blob/master/_layouts/default.html)
- **Categories & tags**: built-in through Jekyll's YAML frontmatter
- **Search**: Google search or Tipue
- **MathJax equations (and numbering)**: [Just add the javascript call to the html template](https://github.com/cboettig/labnotebook/blob/master/_layouts/default.html)
- **Dynamic citations**: Pandoc or my knitcitations tool, for now.
- **Syntax highlighting**: use Github notation with Redcarpet2
- **Writing posts in markdown**: native
- **Version control**: [on Github](https://github.com/cboettig/labnotebook/)
- **Visitor statistics**: [Google analytics in layout](https://github.com/cboettig/labnotebook/blob/master/_layouts/default.html)
- **embeddable content (twitter streams, feeds, etc.)** : add scripts to html templates
- **customization of appearance**  [twitter bootstrap](http://twitter.github.com/bootstrap) for the css and javascript + html templates
- **ease of use**:  Such as the ability to move around markdown documents and html layouts, and to customize things appearance without PHP. 

# Jekyll Configuration Notes 

Probably the only annoying step in setting up a Jekyll blog is getting the right versions of Ruby running.  Strictly speaking, this is unnecessary for sites hosted on Github, which will run Jekyll automatically.  I host on my Dreamhost VPS, for which it is easiest just to compile locally using Jekyll and push on the output HTML files, created in `_site`, to the server.  

- Getting [out of 1.8.7 and into 1.9.2](http://askubuntu.com/questions/91693/how-do-you-uninstall-ruby-1-8-7-and-install-ruby-1-9-2)
- Redcarpet isn't the default interpreter, but works better. However, [it's latest version has issues](http://stackoverflow.com/questions/8395347/gollum-wiki-undefined-method-new-for-redcarpetmodule).
- I find it better to use the Redcarpet2, [and a plugin](https://github.com/nono/Jekyll-plugins) that lets one use Github-flavored markdown code blocks instead of the silly liquid highlight tags (markdown should be markdown after all). Unfortunately this prevents Github's Jekyll from building the site at the moment, which doesn't yet support Redcarpet2.
- [image alignment in markdown](http://stackoverflow.com/questions/255170/markdown-and-image-alignment)
- [markdown in diqus](http://code.lancepollard.com/jquery-disqus-plugin)
- HTML layouts can import chunks from separate files given in `_include` directory using a bit of liquid code. See [an example](https://github.com/spo11/kismetik-jekyll).  Perfect for creating layouts out of different combinations of elements.  
