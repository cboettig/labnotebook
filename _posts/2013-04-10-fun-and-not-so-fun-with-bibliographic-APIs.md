---
layout: post
title: "Notebook tweaks: APIs in Ruby, Github hosting"
category: open-science
tags: 
- notebook-technology
- code-tricks

---

### Crossref API and Faraday

Looking at automating vita entries. The faraday gem looks like a nice general tool for API queries in Ruby (ht Martin Fenner) 

* [Example exploration](https://github.com/cboettig/sandbox/blob/b2351f4bb211d8aff8f87440d7f6064a1ebbde98/ruby-scripts/crossref.rb)

### Mendeley API and omniauth

* Omniauth appears to be a solution for Rails apps only?  Not clear if it can be used in vanilla Ruby.  Still stumped by this case; question on [SO](http://stackoverflow.com/questions/15887366)


### Bisonomy and its API

* RSS feeds too, e.g. [ <i class="icon-rss"></i> warning-signals](http://www.bibsonomy.org/publrss/user/carl-boettiger/warning-signals)
* [Example exploration](https://github.com/cboettig/sandbox/blob/b2351f4bb211d8aff8f87440d7f6064a1ebbde98/ruby-scripts/bibsonomy.rb)


#### Bisonomy impressions

* The API is intuitive and simple; very nice
* The web interface leaves much to be desired.  (Can I sort by date added instead of publication year?  What about full text search? And the import by DOI follows the DOI to the publisher's website and attempts to scrape it (often unsuccessfully) for goodness sakes, instead of looking up the metadata through the crossref API tool [crosscite/cn](http://crosscite.org/cn/).  


## Misc Notebook infrastructure 

* Figshare submissions: Undergraduate thesis and JPs,  
* Added vita links to pdfs ([#87](https://github.com/cboettig/labnotebook/issues/87))
* Minor tweaks  

### Github hosting

Migrated hosting to Github servers, see notes in [#48](https://github.com/cboettig/labnotebook/issues/48).  



