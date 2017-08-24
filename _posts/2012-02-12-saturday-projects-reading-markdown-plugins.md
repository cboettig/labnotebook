---
comments: true
date: 2012-02-12 13:40:37
layout: post
slug: saturday-projects-reading-markdown-notebook-technology
title: 'Saturday: projects, reading, markdown notebook-technology'
redirects: [/wordpress/archives/3818, /archives/3818]
categories:
- ecology 
tags:
- notebook-technology
- warning-signals
- ropensci
---

Greatly enjoyed seeing this perspective on power laws (Stumpf & Porter, 2012) Or as Richard McElreath put even more concisely,

>  People get amazed by power laws but never by normal distributions. Seems like some max ent outcomes astonish while others don't. When so many mechanisms aggregate to common densities, I'd hope we'd stop trying to argue that we can go backwards from pattern to process so easily.


## Projects

* fishbase [example query for Peter](https://github.com/ropensci/rfishbase/commit/a1a9e0307288871b82caca921e9751bdc56b1942)
* Commit edits to warningsignals paper, send to Alan.  
* Things to show in warningsignals vignette/appendix: Increasing data improves estimates. Improves for autocorrelation 


## Reading


* Remembered seeing this example, [scientific communication](http://worrydream.com/#!/ScientificCommunicationAsSequentialArt) as sequential art, a year or so ago but took a while to find it. Why [can't I search](http://webapps.stackexchange.com/questions/23797/advanced-search-options-for-my-links-in-delicious) my delicious links appropriately?
* [Data journalism](http://datajournalism.stanford.edu/), another nice take on visualizations
* [Hadley's tidy R](http://vimeo.com/33727555)


## some R tricks

Moved this one to a separate entry, see [Elegant & fast data manipulation with data.table](http://www.carlboettiger.info/archives/3832)

I always forget how to do this. 
[gist id=1805250]





## Some plugin notes



Tried writing this in markdown, using [markdown-quicktags](http://wordpress.org/extend/plugins/markdown-quicktags) plugin.  Seems to work with most of my short-codes but creates trouble with the equations.  The "render" option converts the escaped brackets used by mathjax into html symbols. It also seems to convert symbol inside the equations, even when inside shortcodes instead of bracket notation.  [Filed error](http://wordpress.org/support/topic/plugin-markdown-quicktags-breaks-mathjax-syntax?replies=1#post-2620618)

Render stores the post source as html. Need to render or post will display markdown instead of formatting.  A different option is plugins that convert the displayed content.  Such plugins store the source as markdown, so if the plugin stops working, all posts appear in markdown instead of being properly rendered.

Rendering can create a mix of html and markdown in the edit, which can be a big headache too.



### A second attempt



Trying [markdown-on-save](http://wordpress.org/extend/plugins/markdown-on-save/).  Much less obtrusive in that it does not change the editor, just uses the default html editor with a check-box to indicate if the document is in markdown.



It also renders the equations without any trouble, inline: $$ F = ma$$ and displayed, 
$$ dX = \sigma dB_t $$
  Brilliant.



It appears that leaving in html-style links in the text also does not create an issue, these render correctly as well.


## References


- Stumpf M and Porter M (2012).
"Critical Truths About Power Laws."
*Science*, **335**.
ISSN 0036-8075, <a href="http://dx.doi.org/10.1126/science.1216142">http://dx.doi.org/10.1126/science.1216142</a>.
