---
layout: post
title: Notes on Jekyll setup and configuration
---


## Modifying notebook page

Add columns, like Wordpress notebook? 
- Get first paragraph with [plugin](https://github.com/sebcioz/jekyll-only_first_p)
- Nope.  Instead, it's much easier to use built in liquid filters which can already grab first n characters or n words, and then markdownify.  
- Must modify to get even-length excerpts.
- Use bootstrap columns and loop over post index values 1-3, 4-6, 7-9 in columns? Done
- Move first post into top display position



Liquid to compute code sizes

```html
{% capture n  %}{{ site.posts | size | divided_by:3}}{% endcapture %}
{% capture m %} {{ n | times:2 }}{% endcapture %}
```

## Writing an extension

* Extensions require some knowledge of Liquid.  First read about [Liquid tags](https://github.com/Shopify/liquid/wiki/Liquid-for-Designers)
and then learn the syntax to write [Liquid extensions](https://github.com/Shopify/liquid/wiki/Liquid-for-Programmers) specifying new tags.  
* Liquid is a Ruby library (gem).  These liquid extensions can be specified in a Ruby `.rb` script that can run arbitrary ruby commands.
* Plugins that don't require extra ruby libraries should work on github's Jekyll engine


* My [SO question on parsing feeds](http://stackoverflow.com/questions/10726916/can-i-embed-an-atom-feed-in-html5-with-the-embed-tag/10727291#10727291)

* A nice Ruby library to do the parsing: [feedrizza](https://github.com/pauldix/feedzirra) 
* [My plugin for feedrizza](https://github.com/cboettig/labnotebook/blob/master/_plugins/feedzirra/feedzirra.rb)
* Fetching xml slows down jekyll compiling, may disable the plugin for the time being

## Misc

* Having a sitemap is a good idea
* [A nice Jekyll tutorial](http://vitobotta.com/how-to-migrate-from-wordpress-to-jekyll/)
