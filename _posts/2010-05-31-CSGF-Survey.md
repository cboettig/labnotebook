---
layout: post
tags: [code-tricks]
categories: evolution
title: CSGF Survey
---






 








-   Wrote survey. Getting feedback and will send out this week.

previous comments

Wiki Tricks
-----------

Exploring use of
[mvs](http://wiki.freegeek.org/index.php/Www-mediawiki-client "http://wiki.freegeek.org/index.php/Www-mediawiki-client")
to download and upload entries from openwetware. The mediawiki client is
easy to install as described in the link. Doesn't seem to have a tool to
grab everything in my Notebook namespace, but with a little bash script
I can grab all the entries in a particular notebook:

\

~~~~ {.de1}
#! /bin/bash
mvs login -d openwetware.org -u Carl_Boettiger -w index.php
 
for j in `seq 3 5`;
{
    for i in `seq 1 9`; 
    do 
        mvs update User\:Carl_Boettiger/Notebook/Comparative_Phylogenetics/2010/0$j/0$i.wiki 
    done
 
    for i in `seq 10 31`; 
    do 
        mvs update User\:Carl_Boettiger/Notebook/Comparative_Phylogenetics/2010/0$j/$i.wiki 
    done
}
~~~~

-   login should specify -p password (omitted here for obvious reasons)
-   For some reason can't get commit to push changes back up. (See the
    link above for examples on how to commit data).

Error:

     Doing commit User:Carl_Boettiger.wiki with host: openwetware.org and lang: en
     Can't call method "isa" without a package or object reference at /usr/bin/mvs line 96.

\

-   Also looking into a personal copy of OWW:
    OpenWetWare:Software/Subwikis, which would similarly allow offline
    work.

\

\

