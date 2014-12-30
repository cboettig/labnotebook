---
layout: page
title: About this site
---

[![Build Status](https://travis-ci.org/cboettig/labnotebook.svg?branch=master)](https://travis-ci.org/cboettig/labnotebook)

Welcome to my online open lab notebook; home to all my research
scribbles.  This README documents the technical information
about this site. If you're looking for more about what this open
lab notebook is about and why I keep it, consider starting with this
[introduction](http://www.carlboettiger.info/2012/09/28/Welcome-to-my-lab-notebook.html),
or [more about me](http://www.carlboettiger.info).  *Any opinions,
findings, and conclusions or recommendations expressed in this material
are those of the author(s) and do not necessarily reflect the views of
the National Science Foundation or the University of California.*

* Site source at [cboettig/labnotebook](http://github.com/cboettig/labnotebook).
* Please report [errors or give feedback](https://github.com/cboettig/labnotebook/issues).

Site Features & Credits
=======================

* Colors and syntax highlighting with [Solarized](http://ethanschoonover.com/solarized)
* Crisp equations rendered in [Mathjax](http://www.mathjax.org/)
* Reproducible code execution with [knitr](http://yihui.name/knitr/)
* CSS based on [twitter bootstrap](http://getboostrap.com)
* Scalable CSS icons from [FontAwesome](http://fortawesome.github.com/Font-Awesome)
* Static site generation with [Jekyll](https://github.com/mojombo/jekyll)
* Markdown parsing with [pandoc](http://johnmacfarlane.net/pandoc/)
* Site and source code hosting on [Github](https://github.com/)
* Uptime monitoring from my.pingdom.com; see [status report](http://stats.pingdom.com/fy1sae94ydyi/616612)

Notebook Archiving & Data Management
====================================

The lab notebook is written and maintained in plain text (UTF-8) using
markdown. All files are kept in a version managed repository system using
[git](http://git-scm.com/), which provides unique SHA hashes to protect
against corruption. Synchronized backups of the git repository are
maintained on both local and remote servers (RAID 6) to protect against
hardware failures, as well as on the public international software
repository, GitHub [github.com/cboettig](https://github.com/cboettig).
Version history preserves a time-line of changes and protects against
user error file loss.  Archival copies of notebook entries shall be published
annually to [figshare](http://figshare.com) where they will be assigned
DOIs and preserved by the [CLOCKSS](http://www.clockss.org/clockss/Home)
geopolitically distributed 12 node global archive.

-----------------------------------------------------

Building from source
====================

_NOTE:_ This site is developed for my own needs and may be
difficult to adapt directly to another purpose.  If you are new
to Jekyll, consider starting with a basic Jekyll template such as
[jekyll-bootstrap](http://jekyllbootstrap.com/) which will be considerably
easier to adapt than working from this repository directly.

The site's
[.travis.yml](https://github.com/cboettig/labnotebook/tree/master/.travis.yml)
file contains the recipe to build this site from scratch on Travis-CI,
which is how the site is currently deployed.  As such, the script will
always provide the current steps necessary to get the site to build
(Travis-CI is based on a Ubuntu 12.04 image; these directions can be
adapted as needed).

This site repository also now includes a
[Dockerfile](https://github.com/cboettig/labnotebook/tree/master/Dockerfile)
for generating a portable docker container to generate the site.

A separate [Dockerfile for building boostrap 3.1.1
CSS](https://github.com/cboettig/labnotebook/tree/master/assets/_bootstrap-3.1.1/Dockerfile)
can be found in the `assets/_bootstrap-3.1.1` directory.


Site configuration
------------------

Fill in all elements of `_config.yml` appropriately.


API key configuration
---------------------

Several of my custom plugins require authentication credentials to the
relevant API, which are not included when forking this public repository,
for obvious reasons.  These credentials should be stored as secure YAML
files in the project source directory, and added to both `.gitignore`
and the `exclude` list of `_config.yml`.  Currently credentials are only
used for the Twitter and Google Analytics plugins. See the headers of
these plugins for more documentation.



### Custom Plugins

I have written a series of [custom Jekyll
plugins](https://github.com/cboettig/labnotebook/tree/master/_plugins/jekyll-labnotebook-plugins)
using these gems.  See the header comments of each plugin for more
details on their configuration and use. Most are written explicitly
for my notebook and may require tweaking for general use. Plugins are
frequently under development.

-----------------------------------------------------------------------------------------------------------

Copyrights & License
--------------------

All original content is placed in the public domain by Carl Boettiger to
the extent possible under law by the Creative Commons Zero declaration,
[CC0](http://creativecommons.org/publicdomain/zero/1.0/).  Plugins are
also provided under the [MIT](http://opensource.org/licenses/MIT)
license.  Please remember that attribution and citation are appreciated
where appropriate as proper scholarly practice.  (Newton, Darwin,
and Shakespeare are similarly in the public domain, but you wouldn't
plagiarize from them).  Please cite or attribute this work as:
<br/>

<div vocab="http://purl.org/dc/terms/" typeof="bibliographicCitation">
<span property="creator">Carl Boettiger</span> (<span property="date">"Page publication date"</span>), <span property="title">"Page Title"</span>, <span property="source">Lab Notebook</span>, <a property="http://creativecommons.org/ns#attributionURL" href="http://carlboettiger.info">http://carlboettiger.info</a>
</div>

<br/>
with appropriate page title and publication date as indicated.
[Greycite](http://greycite.knowledgeblog.org/) is an excellent online
tool that can generate the citation information for any particular page
given it's URL.


