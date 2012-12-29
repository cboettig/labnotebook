---
layout: default
title: About this site
date: 2012-11-09

---



* Site source on Github: [cboettig/labnotebook](http://github.com/cboettig/labnotebook).
* Please [report errors or give feedback](https://github.com/cboettig/labnotebook/issues).

Site Features & Credits
=======================

* Colors and syntax highlighting with [Solarized](http://ethanschoonover.com/solarized) 
* Crisp equations rendered in [Mathjax](http://www.mathjax.org/)
* Reproducible code execution with [knitr](http://yihui.name/knitr/)
* CSS based on [twitter bootstrap](http://twitter.github.com/bootstrap/)
* Scalable css icons from [FontAwesome](http://fortawesome.github.com/Font-Awesome)
* Static site generation with [Jekyll](https://github.com/mojombo/jekyll)
* Markdown parsing with [pandoc](http://johnmacfarlane.net/pandoc/) 
* Twitter, Mendeley & Github [custom plugins](https://github.com/cboettig/labnotebook/tree/master/_plugins)
* [Carbon-neutral site](http://www.dreamhost.com/green.cgi) hosting by [Dreamhost](http://dreamhost.org)
* Source code hosting on [Github](https://github.com/)
* Uptime monitoring from my.pingdom.com [Recent Status](http://stats.pingdom.com/fy1sae94ydyi)
* CDN from [cloudflare](https://www.cloudflare.com/)

Notebook Archiving & Data Management
====================================

The lab notebook is written and maintained in plain text (UTF-8) using markdown. All files are kept in a version managed repository system using [git](http://git-scm.com/), which provides unique SHA hashes to protect against corruption. Synchronized backups of the git repository are maintained on both local and remote servers (RAID 6) to protect against hardware failures, as well as on the public international software repository, Github [github.com/cboettig](https://github.com/cboettig).  Version history preserves a time-line of changes and protects against user error.  Archival copies of notebook entries shall be published annually to [figshare](http://figshare.com) where they will be assigned DOIs and preserved by the [CLOCKSS](http://www.clockss.org/clockss/Home) geopolitically distributed 12 node global archive.


Building from source
====================

This site is built by Jekyll, a static site generator which creates html pages from markdown files.  Here are the instructions for building the site from source, based on my Ubuntu 12.04 platform.  Feel free to adapt this configuration to your own needs.  

Clone the site source-code from github:

```bash
git clone https://github.com/cboettig/labnotebook.git
```


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
sudo gem install jekyll feedzirra nokogiri twitter octokit pandoc-ruby
```


In the root directory of the project, run `jekyll --server`, if successfull, after a few seconds the site should be available by pointing your browser to `localhost:4000`.  The additional gems are required for various plugins; see below for more information.  Due to these additional requirements, this site cannot be automatically rendered on Github's pages.  Compile the site locally and copy the html files in `_site` to the `gh-pages` branch of a Github repository for Github-based hosting.  

Jekyll Dependencies 
-------------------

The site relies on following additional ruby gems (not available on the Jekyll copy provided on Github's gh-pages) to compile successfully.  

#### Required Gems

* [feedzirra](https://github.com/pauldix/feedzirra) -- Grab and format rss feed information  
* [nokogiri](https://github.com/sparklemotion/nokogiri) -- parse HTML and XML 
* [twitter](https://github.com/sferik/twitter) Ruby bindings to the Twitter API
* [octokit](https://github.com/pengwynn/octokit) Ruby bindings to the Github API
* [pandoc-ruby](https://github.com/alphabetum/pandoc-ruby) Ruby implementation of pandoc markdown interpreter (an alternative to redcarpet2)

Note: Markdown is wonderful, but a huge headache due to it's many flavors.  I began using [redcarpet2](https://github.com/vmg/redcarpet/) via the [redcarpet2 plugin](https://github.com/nono/Jekyll-plugins) which powers [Github-flavored markdown](http://github.github.com/github-flavored-markdown/), but have exchanged this for Pandoc.  Pandoc markdown relies on a logically consistent internal grammar (leave it to the philosphers to write mathematically rigorous parser), something the original and some adaptations seriously lack.  On a pratical note, Pandoc is useful for it's wide support of conversion to other formats, including pdf and word docs for publication.  


#### Third Party Plugins 

Plugins are provided in the site source, so cloning this repository will give you a copy of them. The site uses the following plugins:

* [pandoc](https://github.com/dsanson/jekyll-pandoc-plugin)
* [redirects](https://github.com/pelosi/marran.com/blob/master/_plugins/redirects.rb)
* [tag-cloud](https://gist.github.com/2290195) 
* my custom [jekyll-plugins](https://github.com/cboettig/labnotebook/tree/master/_plugins/jekyll-labnotebook-plugins)



License
-------

All original content is licensed by Carl Boettiger under the Creative Commons Zero license, [CC0](http://creativecommons.org/publicdomain/zero/1.0/).  This license is uniquely appropriate for data, code, and written content, and facilitates distribution & reuse.  Please remember that attribution and citation are appreciated where appropriate as proper scholarly practice.  (Newton, Darwin, and Shakespeare are similarly in the public domain, but you wouldn't plagiarize from them).  Cite or attribute this work as:

<div vocab="http://purl.org/dc/terms/" typeof="bibliographicCitation">
<span property="creator">Carl Boettiger</span> (<span property="date">2012</span>). <span property="title">Lab Notebook</span>, <a property="http://creativecommons.org/ns#attributionURL" href="http://carlboettiger.info">http://carlboettiger.info</a> 
</div>

[Greycite](http://greycite.knowledgeblog.org/) can generate the citation information for any particular page given it's URL.  
