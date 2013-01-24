---
comments: true
date: 2012-02-28 15:01:42
layout: post
slug: warning-signals-in-fish-collapse
title: Warning Signals in Fish Collapse
redirects: [/wordpress/archives/3984, /archives/3984]
categories:
- ecology
tags:
- warning-signals
---

Description: an example trying to detect early warning signals  in data from fisheries collapses

Set up markdown format and image uploads.  

```r

render_wordpress()
opts_knit$set(upload = TRUE)
opts_knit$set(imgur.key = getOption(&amp;quot;imgur&amp;quot;))

```


Load required libraries

```r

require(warningsignals)
require(ggplot2)
require(reshape2)

```





##  Load the data 



```r

scotia &amp;lt;- read.csv(&amp;quot;../../data/rawdata/sau_scotia.csv&amp;quot;)

```






##  Visualize data  




```r

dat_scotia &amp;lt;- melt(scotia, 
    id = &amp;quot;Year&amp;quot;)
p_scotia &amp;lt;- ggplot(dat_scotia, 
    aes(Year, value, fill = variable)) + 
    geom_area()
print(p_scotia)

```

![]( http://farm8.staticflickr.com/7053/6793294944_74aa429a37_o.png )





##  Compute some indicators 



Define some indicators

```r

window_var &amp;lt;- function(X, 
    windowsize = (length(X)/2)) {
    out &amp;lt;- sapply(0:(length(X) - 
        windowsize), function(i) {
        var(X[(i + 1):(i + 
            windowsize)])
    })
    c(rep(NA, length(X) - 
        length(out)), out)
}

window_autocorr &amp;lt;- function(X, 
    windowsize = (length(X)/2)) {
    out &amp;lt;- sapply(0:(length(X) - 
        windowsize), function(i) acf(X[(i + 
        1):(i + windowsize)], 
        lag.max = 1, plot = F)$acf[2])
    c(rep(NA, length(X) - 
        length(out)), out)
}

```




Reformat the data, uses data.table to perform computations over species

```r

require(data.table)
fish &amp;lt;- data.table(subset(dat_scotia, 
    Year &amp;lt; 1992))
tmp &amp;lt;- data.frame(species = fish$variable, 
    Year = fish$Year, Stock = fish$value, 
    variance = fish[, window_var(value), 
        by = &amp;quot;variable&amp;quot;]$V1, 
    acor = fish[, window_autocorr(value), 
        by = &amp;quot;variable&amp;quot;]$V1)

dat &amp;lt;- melt(tmp, 
    id = c(&amp;quot;Year&amp;quot;, &amp;quot;species&amp;quot;))

```




Cod are approaching a crash, but lobster are going strong, but both seem to show the same pattern.  

```r

ggplot(subset(dat, 
    species %in% c(&amp;quot;Atlantic.cod&amp;quot;))) + 
    geom_point(aes(Year, 
        value)) + facet_grid(variable ~ 
    species, scales = &amp;quot;free_y&amp;quot;)

```

![]( http://farm8.staticflickr.com/7184/6793295294_1396a8d33d_o.png )

```r

ggplot(subset(dat, 
    species %in% c(&amp;quot;American.lobster&amp;quot;))) + 
    geom_point(aes(Year, 
        value)) + facet_grid(variable ~ 
    species, scales = &amp;quot;free_y&amp;quot;)

```

![]( http://farm8.staticflickr.com/7178/6793296188_f94e773654_o.png )



Note the indicator patterns vary widly and rather arbitrarily among species 

```r

dt &amp;lt;- data.table(dat_scotia)
indicator &amp;lt;- data.frame(dt[, 
    window_var(value), 
    by = &amp;quot;variable&amp;quot;], Year = dat_scotia$Year)
ggplot(indicator) + 
    geom_line(aes(Year, 
        V1)) + facet_wrap(~variable, 
    scales = &amp;quot;free_y&amp;quot;)

```

![]( http://farm8.staticflickr.com/7050/6793296484_669a826cc7_o.png )




