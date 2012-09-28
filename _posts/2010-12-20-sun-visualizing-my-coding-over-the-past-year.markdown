---
comments: true
date: 2010-12-20 00:05:10
layout: post
slug: sun-visualizing-my-coding-over-the-past-year
title: 'Sun: Visualizing my coding over the past year'
redirects: [/wordpress/archives/641, /archives/641]
categories:
- open-science
- evolution
---

Not really working today, as holidays approach, but came across the Gource toolkit for creating video visualization from git development (inspired by the [Mendeley's example](http://vimeo.com/17919684)).  So in the spirit of year-in-review reflections, here's my development from the past year (just for the phylogenetic statistics work).    


Quality is a little too poor to read file names, more entertaining than practical.  Other user icons appear in December corresponding with my move to running the code from Amazon cloud.  The lower cluster includes the demos directory, the upper the R code, so gives some indication of extensions to methods vs testing applications.  Captures my bursty code development, though perhaps not as well as the [github graphs](https://github.com/cboettig/Comparative-Phylogenetics/graphs/impact). 



#####  Notes for making the video 


A couple steps.  First just running gource (in ubuntu universe repositories) on the repository directory launches the video, used gtk-recordMyDesktop to capture the film (no luck with piping to ffmpeg).  Then truncated, changed format, uploaded to youtube.  Truncation and format conversion are simple bash commands:

    
    
    # Shorten film 
     ffmpeg -sameq -ss 0 -t 900 -i testvideo.ogv gource.ogv
    # convert to avi
     mencoder gource.ogv -nosound -ovc xvid -xvidencopts pass=1 -o gource.avi
    
