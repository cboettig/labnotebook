---
layout: default
title: About this site

---



* [carlboettiger.info](http://carlboettiger.info) is hosted by [Dreamhost](http://dreamhost.org)
* Source files can be found in its Github repository: [labnotebook](http://github.com/cboettig/labnotebook)
* Please report any errors or other feedback in the [Issues Tracker](https://github.com/cboettig/labnotebook/issues)

Site Features & Credits
=======================

* Colors and syntax highlighting with [Solarized](http://ethanschoonover.com/solarized) color schemes
* Static site generation by [Jekyll](https://github.com/mojombo/jekyll)
* Equations rendered in [Mathjax](http://www.mathjax.org/)
* Reproducible, formated code from [knitr](http://yihui.name/knitr/)
* CSS generated with [twitter bootstrap](http://twitter.github.com/bootstrap/)
* [Custom plugins](https://github.com/cboettig/jekyll-labnotebook-plugins) for Twitter, Mendeley, Github
* Site hosting by [Dreamhost](http://dreamhost.org)
* Source code hosting on [Github](https://github.com/)



Installing Jekyll
=================

This site is built by Jekyll, a static site generator which creates html pages from markdown files.  These instructions for building the site from source, based on my Ubuntu 12.04 platform.  


Install Ruby version >= 1.9

```bash
sudo apt-get install ruby1.9.1-full
```

Make sure the [latest version is selected](http://askubuntu.com/questions/91693/how-do-you-uninstall-ruby-1-8-7-and-install-ruby-1-9-2)

```bash
sudo update-alternatives --config ruby
sudo update-alternatives --config gem
```

Install Jekyll and the dependencies needed for a few plugins.

```bash
sudo gem install jekyll redcarpet2 feedzirra nokogiri twitter octokit pandoc-ruby
```


In the root directory of the project, run `jekyll --server`, if successfull, after a few seconds the site should be available by pointing your browser to `localhost:4000`.  The additional gems are required for various plugins; see below for more information.  Due to these additional requirements, this site cannot be automatically rendered on Github's pages.  Compile the site locally and copy the html files in `_site` to the `gh-pages` branch of a Github repository for Github-based hosting.  

Jekyll Dependencies 
-------------------

The site relies on following additional ruby gems (not available on the Jekyll copy provided on Github's gh-pages) to compile successfully.  

#### Required Gems

* [redcarpet2](https://github.com/vmg/redcarpet/) -- Providing support for [Github-flavored markdown](http://github.github.com/github-flavored-markdown/)
* [feedzirra](https://github.com/pauldix/feedzirra) -- Grab and format rss feed information  
* [nokogiri](https://github.com/sparklemotion/nokogiri) -- parse HTML and XML 
* [twitter](https://github.com/sferik/twitter) Ruby bindings to the Twitter API
* [octokit](https://github.com/pengwynn/octokit) Ruby bindings to the Github API
* [pandoc-ruby](https://github.com/alphabetum/pandoc-ruby) Ruby implementation of pandoc markdown interpreter (an alternative to redcarpet2)



#### Third Party Plugins 

Plugins are provided in the site source, so cloning this repository will give you a copy of them. In addition to my own plugins, I'd like to credit other developers for the following plugins:

* [redcarpet2 plugin](https://github.com/nono/Jekyll-plugins)
* [pandoc](https://github.com/dsanson/jekyll-pandoc-plugin)
* [redirects](https://github.com/pelosi/marran.com/blob/master/_plugins/redirects.rb)
* [tag-cloud](https://gist.github.com/2290195) 
* my own custom [jekyll-plugins](https://github.com/cboettig/jekyll-labnotebook-plugins)



License
-------

[CC0](http://creativecommons.org/publicdomain/zero/1.0/)
