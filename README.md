---
title: About this site
---

<!--
[![Build Status](http://server.carlboettiger.info:88/api/badge/github.com/cboettig/cboettig.github.io/status.svg?branch=master)](http://server.carlboettiger.info:88/github.com/cboettig/cboettig.github.io)
-->


Overview
========

[This site](http://carlboettiger.info) is built with Jekyll and hosted on GitHub Pages. Site source at
[cboettig/cboettig.github.io](http://github.com/cboettig/cboettig.github.io).
Please report [errors or feedback
here](https://github.com/cboettig/cboettig.github.io/issues). The
`cboettig.github.io` repository hosts the main pages,
while my lab notebooks are now hosted from separate
GitHub repositories by year as [described in this
post](http://www.carlboettiger.info/2015/01/01/notebook-maintenance-and-scaling.html).
For more about the open lab notebook, please see [this introduction](http://www.carlboettiger.info/2012/09/28/Welcome-to-my-lab-notebook.html)

Site Features & Credits
=======================

* Static site generation with [Jekyll](https://github.com/jekyll/jekyll)
* Site and source code hosting on [Github](https://github.com/)
* Colors and syntax highlighting with [Solarized](http://ethanschoonover.com/solarized)
* Crisp equations rendered in [Mathjax](http://www.mathjax.org/)
* Reproducible code execution with [knitr](http://yihui.name/knitr/) and [servr](http://github.com/yihui/servr)
* CSS based on [twitter bootstrap](http://getboostrap.com)
* Scalable CSS icons from [FontAwesome](http://fortawesome.github.com/Font-Awesome) and [Academicons](https://github.com/jpswalsh/academicons)
* Uptime monitoring from my.pingdom.com; see [status report](http://stats.pingdom.com/fy1sae94ydyi/616612)
* Markdown parsing with [pandoc](http://johnmacfarlane.net/pandoc/)
- Portable build environment using [Docker](https://docker.com)
- Automatic builds using [Circle-CI](https://circleci.com)


Notebook Archiving & Data Management
====================================

The lab notebook is written and maintained in plain text (UTF-8) using
markdown. All files are kept in a version managed repository system using
[git](http://git-scm.com/), which provides unique SHA hashes to protect
against corruption. Synchronized backups of the git repository are
maintained on both local and remote servers to protect against
hardware failures, as well as on the public international software
repository, GitHub [github.com/cboettig](https://github.com/cboettig).
Version history preserves a time-line of changes and protects against
user error file loss.  Archival copies of notebook entries shall be published
annually to [figshare](http://figshare.com)


-----------------------------------------------------

Building from source
====================

This site is built automatically using
Docker and Drone CI, as [described in this
post](http://www.carlboettiger.info/2015/01/07/automated-knitr-in-jekyll.html).
This site repository also now includes a
[Dockerfile](https://github.com/cboettig/labnotebook/tree/master/Dockerfile)
for generating a portable docker container to generate
the site. A separate [Dockerfile for building boostrap 3.1.1
CSS](https://github.com/cboettig/labnotebook/tree/master/assets/_bootstrap-3.1.1/Dockerfile)
can be found in the `assets/_bootstrap-3.1.1` directory.

_NOTE:_ This site is developed for my own needs and may be difficult to
adapt directly to another purpose.  If you are new to Jekyll, consider
starting with a Jekyll theme such as [Poole](http://getpoole.com/).


-----------------------------------------------------------------------------------------------------------

Copyrights & License
====================

All original content unless otherwise specified is placed
in the public domain by Carl Boettiger to the extent
possible under law by the Creative Commons Zero declaration,
[CC0](http://creativecommons.org/publicdomain/zero/1.0/).  Please remember
to cite or attribute this content where appropriate.

---------------------------------------------------------------------------------------------------------------

*Any opinions, findings, and conclusions or recommendations expressed
in this material are those of the author(s) and do not necessarily
reflect the views of the National Science Foundation or the University
of California.*


