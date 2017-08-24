---
layout: post
title: Exploring Jekyll layout 
category: open-science
tags: 
- notebook-technology
- Jekyll
---

Jekyll works wonderfully with little knowledge beyond basic html/css to create `_layout` templates and then you're free to write beautiful pages and posts in markdown.  But adding more dynamic content, the kind of cool stuff avialable in so many wordpress plugins, tends to require a little understanding of the template formatting language, [Liquid](https://github.com/Shopify/liquid).  Liquid is actually super simple and powerful way to build a dynamic website.  The project's wiki provides a great introduction, starting with

* [Liquid filters and tags](https://github.com/Shopify/liquid/wiki/Liquid-for-Designers). 
* [Jekyll proves a few more useful extensions](https://github.com/mojombo/jekyll/wiki/Liquid-Extensions), though I've found the standard ones most useful.   
* Knowing the [template names](https://github.com/mojombo/jekyll/wiki/Template-Data) available in Jekyll comes in handy for this stuff. (like `site.posts` or `page.content`.  Not sure why `page.content` comes in as rendered content for posts.
* A lot of the more fancy stuff requires writing custom liquid functions, common in Jekyll plugins.  See the [Liquid extensions](https://github.com/Shopify/liquid/wiki/Liquid-for-Programmers) guide to learn the syntax for this.  
* These liquid extensions can be specified in a Ruby `.rb` script that can run arbitrary ruby commands.
* Compatibility with github: anything that doesn't require additional gems will work on Github.  

## Writing my own extension to parse feeds

I wanted a nice way to embed feeds on my Jekyll site -- preferably at Jekyll-compile rather than in javascript, to maintain the fast static site ethos.  As usual, this search begins with an [SO question on parsing feeds](http://stackoverflow.com/questions/10726916/can-i-embed-an-atom-feed-in-html5-with-the-embed-tag/10727291#10727291).  From this I learn about a nice Ruby library to do the parsing: [feedrizza](https://github.com/pauldix/feedzirra). Using a bit of knowledge from above (and a bit of hacking -- probably would have been better served if I read those things _first_ instead of _after_ trying this), I have a [plugin for feedrizza](https://github.com/cboettig/labnotebook/blob/master/_plugins/feedzirra/feedzirra.rb) which displays feeds. This could probably be greatly improved. Fetching xml slows down jekyll compiling, may disable the plugin for the time being

## Modifying layout of posts archive (lab notebook)

#### Can I add columns with post previews, like [my Wordpress notebook](http://www.carlboettiger.info/research/lab-notebook)? Mission accomplished. 

I first considered using a plugin [plugin](https://github.com/sebcioz/jekyll-only_first_p) to get the frist paragraph (based on nokogiri parsing the html/xml).  While nokogiri is quite powerful, I often don't have just the right length content in the first paragraph -- some entries just launch into a list enviornment with no paragraphs to begin with. 

Instead, it's much easier to use [built in liquid filters](https://github.com/Shopify/liquid/wiki/Liquid-for-Designers) which can already grab first n characters or n words.  Unfortunately pulls in _formatted_ post content, not pure markdown, leaving open tags.  Should probably look into some santize html filters, but don't seem to be default. To avoid this, I ended up using the `strip_html` filter, rendering unformatted but more uniformly looking previews on pages.   

Lastly, format the previews in justified columns in a smaller font-size using a little css. 

Oh, it appears there is a [nokogiri-based plugin](https://github.com/MattHall/truncatehtml) which will truncate and close html tags appropriately.

#### Some liquid example code

Arrange site-posts into three columns, entries columnwise. 


```html
{% raw %}
{% capture n  %}{{ site.posts | size | divided_by:3}}{% endcapture %}
{% capture m %} {{ n | times:2 }}{% endcapture %}
{% endraw %}

<div class="span3">
{% raw %}
{% for post in site.posts limit:n %}
{{ post | content }}
{% endfor %}
{% endraw %}
</div>

<div class="span3">
{% raw %}
{% for post in site.posts limit:n offset:n%}
{{ post | content }}
{% endfor %}
{% endraw %}
</div>

<div class="span3">
{% raw %}
{% for post in site.posts limit:n offset:m %}
{{ post | content }}
{% endfor %}
{% endraw %}
</div>
```


## Misc

* Having a sitemap is a good idea
* [A nice Jekyll tutorial](http://vitobotta.com/how-to-migrate-from-wordpress-to-jekyll/)
