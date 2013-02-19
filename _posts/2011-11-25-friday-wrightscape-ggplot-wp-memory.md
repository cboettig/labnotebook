---
comments: true
date: 2011-11-25 20:32:59
layout: post
slug: friday-wrightscape-ggplot-wp-memory
title: 'Friday: wrightscape, ggplot, wp memory'
redirects: [/wordpress/archives/3393, /archives/3393]
categories:
- computation
- evolution
---

## more sub-model comparisons


wrightscape sub-models:



	
  * a1 independent alphas, global theta, sigmas

	
  * bm "brownie" (alpha = 0, indep sigmas)

	
  * a2 independent alpha, theta, global sigma

	
  * s1 indep sigma, global alpha, theta

	
  * s2 indep sigma, theta, global alpha




### Basic Nelder Mead


![]( http://farm8.staticflickr.com/7142/6402641965_cf632aa2cf_o.png )



### Simulated annealing


associated parameter estimates

![]( http://farm8.staticflickr.com/7015/6403260959_04a0f06d73_o.png )




This approach is really not finding a very robust solution.

![]( http://farm7.staticflickr.com/6119/6402646435_b77d7d2548_o.png )





## Plotting with stats_summary()


Using stats_summary instead of melt and cast computations and line and ribbon geometries for adding statistical layers to plots.  For instance, from plots.R in SDP code:


```R

ggplot(data = subset(dat, variable == "unharvested"),
           aes(time, value, group = L1)) + geom_line(alpha=.2) +
  # shows the mean +/i mult * sd , requires Hmisc
  stat_summary(fun.data = mean_sdl, geom="smooth", mapping=aes(group = 1), mult=1)

```


Note that this needs thee aesthetic mapping (group=1) to know what to do. I'm not clear exactly why.

Note also that "mult" is an additional option, and is passed to the function, mean_sdl, specifying the multiplier in front of the standard deviation.

The documentation of possible function definitions in stat_summary aren't entirely clear. This can take fun.y to apply the function across y values, for instance, to calculate just the mean:


```R

ggplot(data = subset(dat, variable == "unharvested"),
       aes(time, value, group = L1)) + geom_line(alpha=.2) +
    stat_summary(fun.y = mean, geom="line", mapping=aes(group = 1))

```


Note that we've also changed the geometry to line, since we're not returning ymin/ymax information.

We could add separate functions for the lower and upper bounds, fun.ymin and fun.ymax instead. Again we'd need a geometry that knew what to do with these -- for instance, "smooth" or "errorbar".

There's quite a collection of convenient functions whose wrappers are provided through the package Hmisc, such as the mean_sdl choice shown here, which are illustrated well in the stat_summary examples.


## Wordpress memory management





	
  * [tcp-memory-usage](http://wordpress.org/extend/plugins/tpc-memory-usage/) plugin

	
  * Increased available memory in wp-config.php ([instructions](http://codex.wordpress.org/Editing_wp-config.php)).


Wow, my [saga continues](http://support.rstudio.org/help/discussions/problems/1169-installing-server-edition-by-source-on-debian-lenny) for RStudio server running on Debian Lenny...
