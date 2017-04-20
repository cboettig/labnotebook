---
title: Migrating to Hugo and blogdown
author: ~
date: '2017-04-19'
slug: ''
categories: []
tags: []
draft: yes
path: ''
---

After OpenWetWare (2010), Wordpress (2010 - 2012) and Jekyll (2012 - 2017), I move platforms once again: now to Hugo.  Why the move? As usual, this site remains a way for me to explore new technologies, but the cutting edge is by no means the allure which leads me to migrate.  Rather, I find myself ever trying to move towards simpler platforms, what's easier to maintain, free to host, easier to replicate, and what makes best use of the most widely available and well-maintained existing software and avoids unncessary custom hacks.  Nevertheless I still want the clean content model of a static website generator with reasonable control over content and structure.  

For a while Jekyll fit this reasonably well.  Designed as the hacker's platform, it was easy to customize and extend, but thanks to its association with GitHub, mainstream enough to be widely recognized and support a great deal of additional functionality.  


Hugo does not (currently) support pandoc markdown, relying instead on Go's markdown parser, `blackfriday`.  `blackfriday` supports the basic extensions found on GitHub (tables, checkboxes), but differing flavors of markdown have always been a nuciance and R's standardization around pandoc has been welcome.




```{r}
sessionInfo()
```
