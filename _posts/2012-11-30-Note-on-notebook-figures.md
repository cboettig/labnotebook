---
layout: post
category: open-science
tags: 
- notebook-technology

---


## plots for the notebook

I have started uploading images to my own server, rather than flickr.  Programmatically, this is just a matter of switching the knitr upload function:

```r
opts_knit$set(upload.fun = socialR::notebook.url)
```

from my custom [flickr.url](https://github.com/cboettig/socialR/blob/299f4aeb8cc1a9b31c761dc7c9b14b1d73f7ef25/R/custom_knit.R) function (a wrapper to `Rflickr`) to a custom function [notebook.url](https://github.com/cboettig/socialR/blob/e9a30fd6381c1a8147cbaec0e3886d559de6d48c/R/notebook.R) using a system call to `cp` (to my local jekyll notebook) and `rsync` (so the figure displays before my next jekyll push).  


The new script names image by date and the first 10 characters of the sha hash, as well as the knitr chunk name.  This way multiple runs tweaking an individual file are not recorded as separate files if no commits are made to the repository, but every commit is guaranteed to link to a unique set of figures (unless the chunk is loaded from cache and does not generate a new image).  All figures also [appear sorted by date on the webserver](http://www.carlboettiger.info/assets/figures/) in the manner.  I could probably put some lightweightphotobrowser on the server, if browsing images serves any purpose.  

The real reason for the change is to maintain the images in my labnotebook directory, such that the directory is a complete archive that can exist independent of web services such as flickr.  The images aren't included in the git management for obvious reasons.  My current archiving on figshare has simple involved zipping up the markdown versions of all my posts by year (in _posts).  If I continue in this way, I should need to archive the `figures/` directory along with it.  Perhaps I should archive the entire Jekyll directory instead.[^1]


An alternative strategy would be to upload each figure to figshare directly in the same way I was doing with flickr. While this has the advantage of clockss archiving, mostly I'm not sure that I should flood my figshare account in this way.  I really don't need a different doi for every attempt to create a figure (just as I've decided not to archive each notebook entry as a separate figshare object.)  




### Plot appearance (transparency) in the notebook

It's not easy to generate figures that display nicely in both dark and light themes (well, I should just tell ggplot to use a solarized set of theme colors, but I'm too lazy to write that).  Meanwhile, just setting the transparent background to the plot, and transparent grid lines against the grey boxes seems to do pretty well:

![Example transparent plot](/assets/figures/2012-12-04-046b509f8d-unnamed-chunk-6.png)

This is accomplished with the codeblock below.  Note that we need to tell `knitr` chunks to set the background of the png device to transparent, as well as telling ggplot what we want to be transparent:

```r
opts_chunk$set(dev.args=list(bg="transparent"))
theme_notebook <- 
  theme_grey() + 
  theme(
    plot.background = element_rect(fill = "transparent", colour = NA),
    panel.grid.major = element_line(colour = "transparent")),
    panel.grid.minor = element_line(colour = "transparent"))
theme_set(theme_notebook)
```

(It appears this makes the gridlines invisible, since they appear over the grey `panel.background`.  For now, best to leave them white, which shows up against the grey background in any event).  

[^1]: One challenge this introduces is private posts (such as the reviews I write in peer review, which I sign but cannot publicly disclose).  Currently these are ignored by github (`.gitignore`) and by Jekyll (`exclude:` in `_config.yml`).  I suppose I could likewise simply tell tarball to ignore `_posts/private`.



