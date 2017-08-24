---
layout: post
categories: open-science
tags: 
- notebook-technology
- Jekyll
- blog
---

Thanks to a recent bugfix in the [exitwp](https://github.com/thomasf/exitwp) scripts I was able to export all my Wordpress entries.  The script pulls the entries from the Wordpress database and formats them in markdown, along with extracting all metadata such as timestamp, tags, categories, publication status, and Wordpress id number, which are all embedded as YAML header information.  

### Why migrate the old entries?

When I moved to the Jekyll notebook, I left the Wordpress site standing with all its existing content and simply remapped the home pages. While it was nice to have the Wordpress system as a fall back while I got used to Jekyll, it meant that I couldn't benefit from the faster and lighter nature of Jekyll while much of my traffic occurred on the Wordpress pages.  I was running a dedicated virtual private server for the Wordpress hosting, and still the site wasn't very responsive.  To get an idea, try "flipping through the pages" of the new Jekyll notebook using the "next" and "previous" post buttons.  The new pages load immediately, making it easy to flip through looking for some word or image I can't find with tags or searches. Flipping through pages is the time-honored way of interacting with paper notebooks, so I'm glad that the new system is responsive enough to imitate this well.  


### Converting shortcodes from Wordpress Plugins

Migrating files using `exitwp` is a relatively seamless affair.  Unfortunately, my Wordpress posts make rather heavy use of plugins, which work through shortcodes that still appear in the converted files, such as `[flickr]`, `[latex]`, `[code lang="r"]`, and `[cite]`, for image embedding, equation embedding, syntax highlighting, and citations by DOI, respectively.  While a suite of Jekyll plugins exist for each of these tasks, I'd like my regular posts to be pure markdown (other than the YAML header), making it easy to migrate or reuse the content in the future in different platforms.  Here is the [R script I used for converting my shortcodes](https://github.com/cboettig/sandbox/blob/c489da83ca7a78345b7981be4de5933ae7d63ac0/shortcodes.R), as described below.  

#### Syntax Highlighting short-codes

For instance, several markdown extension languages including, Github-flavored markdown, already allow for syntax-highlighting with fenced code blocks.  I wrote a short script to replace all (most) of the shortcodes in use on my Wordpress site.  (Over the years, I'd actually used a variety of different syntax highlighting plugins, making it necessary to match a variety of different shortcodes).  Other than matching a lot of patterns, this was pretty straight forward.  

#### flickr images

My workflow pushes all the images and graphs I create to flickr when the script runs.  (I could also automatically push the images to Wordpress, or simply to my own site, but started using flickr pretty early on for this.  The SOAP API is excellent, as is the Rflickr R package)  Images were embedded into my Wordpress site using the shortcode and image ID number. To generate stand-alone markdown, I wanted tp replace all the image codes with the flickr URLs to the images, which is a trivial task with the API and Rflickr.

#### LaTeX/Mathjax Equations

Again I had used a variety of shortcodes for latex plugins before discovering MathJax, so I had to handle a variety of syntaxes here. Previously I've tried to write equations in a manner compatible with the redcarpet markdown parser that powers Github-Flavored Markdown (see the [corresponding Jekyll plugin](https://github.com/nono/Jekyll-plugins)), e.g. surrounding equations with `<div>` blocks to avoid the parser mangling them.  Instead, I've found it easier now to switch to pandoc for my markdown parser (and [corresponding Jekyll Plugin](https://github.com/dsanson/jekyll-pandoc-plugin)).  Pandoc uses the basic TeX `$` and `$$` for inline and display equations, rendering it into the MathJax (and modern LaTeX standard) `\(` and `\[` on conversion. Being pandoc-compatible is quite nice, making it easy to create an e-book, epub, or latex-based pdf of my notebook.  I hate having to use a markdown syntax that isn't compatible with most other extended markdown parsers, but with so many different, inconsistent parsers this cannot be easily avoided. Regardless, replacing the various shortcodes to the Pandoc syntax is just a simple regexpr step.

#### Citations

Many of my posts relied on kcite to generate bibliographies for the post using DOIs.  A short call to my [knitcitations](http://www.carlboettiger.info/2012/05/30/knitcitations.html) package allowed me to generate the parenthetical citations and bibliographies instead. In principle this step could be run at the time I compile the site with Jekyll.  Pages would be valid `.Rmd`, needing knitr as "markdown" interpreter. This is an intriguing way to go, but probably too complicated for the moment.  Running additional R code would be nice, but could slow the time needed to build the site, even with knitr's caching.  Meanwhile, converted pages simply have the citations already processed and the bibliography added in as HTML at the end of the post.  

### URL Redirects

My Jekyll site uses the SEO recommended structure of year/month/day/page-title for URLs, while my Wordpress site used simple random id numbers.  To ensure that links to the old Wordpress pages resolve to the newly migrated pages, I added a little Jekyll plugin, [redirects.rb](https://github.com/cboettig/labnotebook/blob/master/_plugins/redirects.rb). One of the elegant things about Jekyll is the ability to create such plugins that do this just the way you would image doing so -- creating auxiliary pages at each of the redirect URLs with a simple redirect command. To install, place `redirects.rb` in `_plugins`, `redirects.html` in `_layouts`, and in `_config.yml` add the line `redirects: yes` (see [site source](https://github.com/cboettig/labnotebook)).


### Comments

I am using Disqus as the comment engine for entries.  Since URLs change in the above step and I do not provide a unique disqus code to each page, I am attempting to migrate comments using the [Disqus "migrate threads" tool](http://help.disqus.com/customer/portal/articles/286778-using-the-migration-tools), which simply takes a csv file listing old and new urls in consecutive columns.  Will have to wait and see if this works.  


### Private entries

Several entries on the Wordpress site were marked private, and only visible after administrative login. Most of these entries are actually solicited journal reviews of various manuscripts which I cannot make public. `exitwp` marks these posts as `published: false` in the metadata, so it is easy to remove them from the Jekyll source site. They can be managed in a separate Github-excluded directory (so that they cannot be seen on the website source pages on Github either) that can be `.htaccess` password protected.  

### Categories and Tags

Categories and tags are handled automatically in the conversion.  One of the greatest things about having all the content on a common system is the ability to share a common tag-pool.  

### RSS

If you follow the notebook through RSS feeds, all the migrated posts will be showing up as new unread entries, as the atom feed dates entries by when they appear, not the stated post date.  My apologies!

### Rough edges

A couple posts have rare shortcodes which are probably easier to correct by hand.  My apologies for any rough edges resulting from the conversion (or the exchange of markdown parsers).  Hopefully I'll get these ironed out in the near future, but feel free to leave a comment on the page or the issues tracker on any such errors.  
