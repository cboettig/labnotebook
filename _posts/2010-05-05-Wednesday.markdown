---
layout: post
tags: [tribolium]
categories: [ecology]
title: Wednesday
---






 








-   Structured populations part of project migrated to
    [github](http://github.com/cboettig/structured-populations "http://github.com/cboettig/structured-populations")
    from the google code page.
-   Finally switched to using STL for linked list in simulation.
-   Have working simulation function
-   ensemble run function also calculates the probability based on
    kernel-density estimation from the replicates.
-   Working on likelihood calculation.

Code progress
-------------

-   Lots of fun trying to get full structured population simulator
    working accurately. See [git
    log](http://github.com/cboettig/structured-populations/commits/master "http://github.com/cboettig/structured-populations/commits/master")
    for details, but ended up abandoning two separate versions of
    custom-written C linked lists and just switched entire code over to
    C++ to use the STL's linked list, which finally worked like a charm.

Exploring Github
----------------

-   Github pages: gh-pages lets you create webpage associated with the
    project. The page isn't automatically linked from the actual project
    page though, and though is easy to set up initially requires editing
    with a mix of ruby/html and fancy processing. Doesn't seem
    particularly promising as I hoped, since all subsequent editing has
    to be done in raw mode. Can also create user pages this way. See
    [sample
    page](http://cboettig.github.com/structured-populations/ "http://cboettig.github.com/structured-populations/")
    for this project.

-   Much more promising: project page displays the readme, which can
    have [advanced
    markup](http://github.com/guides/readme-formatting "http://github.com/guides/readme-formatting"),
    i.e. will try formatting readme files in
    [markdown](http://daringfireball.net/projects/markdown/syntax "http://daringfireball.net/projects/markdown/syntax"),
    should be easy to learn, similar but not matching mediawiki. See the
    [github guide on
    markdown](http://github.github.com/github-flavored-markdown/ "http://github.github.com/github-flavored-markdown/"),
    does some extra github related functions, [see live
    demo](http://github.github.com/github-flavored-markdown/preview.html "http://github.github.com/github-flavored-markdown/preview.html").

-   RSS feed anything -- commit logs, etc. Follow other users or
    projects, rss feed automatically to git dashboard.

-   Lots more on [Git
    guides](http://github.com/guides/home "http://github.com/guides/home").

\

