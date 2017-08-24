---
comments: true
date: 2011-09-07 21:28:03
layout: post
slug: memory-management-cron
title: memory management, cron
redirects: [/wordpress/archives/2546, /archives/2546]
categories:
- computation
tags:
- notebook-technology
---

Create the memcheck.sh script that will write a mem.log file with the data, and a[ gnuplot script](http://t16web.lanl.gov/Kawano/gnuplot/datetime-e.html) that will plot it.

[gist id=1201994]

Then set up a cron job.  First, set the editor to something functional:

    
    export EDITOR=vi


then, crontab -e to edit the cron table.  Add this line to run the command every 2 minutes (see [wikipedia entry](http://en.wikipedia.org/wiki/Cron#Examples) for quick intro), and plot it every 15 minutes:

    
    */2 * * * * /home/cboettig/./memcheck.sh
    */15 * * * * gnuplot /home/cboettig/memplot.gnu


See resulting [plot](http://www.carlboettiger.info/mem.png).
