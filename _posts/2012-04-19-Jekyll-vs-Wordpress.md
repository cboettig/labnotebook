---
layout: posts 
title: Jekyll vs Wordpress
subtitle: which is the better platform for an open lab notebook?
category: OpenScience
---

## Basic requirements

RSS feed, categories & tags, 

## Advantages of Jekyll

Simplicity.  Speed.  Portability.  

Wordpress has a wealth of themes and plugins, setting a low bar for customization (no need to know html/javascript if the plugin exists) but simultaneously making a higher bar if what you want isn't readily avaliable (writing your own requires knowledge of php and wordpress development).  The CSS and javascript provided by twitter-bootstrap provides a far more flexible platform to create custom and interactive layouts.  

## Concerns in switching

- Wordpress can generate rss feeds for any category or tag on the fly. 
- Wordpress can toggle password & privacy control for each post. 

# Draft




# Jekyll Notes 


HTML layouts can import chunks from separate files with a bit of liquid code:

```
{% include file.html %}
```

Where `file.html` lives in the `_includes` directory. See [an example](https://github.com/spo11/kismetik-jekyll)
