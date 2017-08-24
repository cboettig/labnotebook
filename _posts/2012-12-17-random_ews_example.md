---
layout: post
category: ecology
tags: warning-signals

---





ENSO EWS
========================================================

Let's just see what happens with the [MEI data](http://www.esrl.noaa.gov/psd/enso/mei/) for PDO:


```r
dat <- read.table("http://www.carlboettiger.info/assets/data/mei.csv", header=TRUE)
```




<!-- html table generated in R 2.15.2 by xtable 1.7-0 package -->
<!-- Mon Dec 17 15:31:58 2012 -->

For the moment let's ignore annual structure and just collapse this into timeseries sampled bimonthly.  


```r
require(reshape2)
dt <- melt(dat, id="YEAR")
X <- dt$value
Z <- X[!is.na(X)]
Z <- data.frame(1:(length(Z)-1), Z[1:(length(Z)-1)])
```



```r
png("mei.png")
require(earlywarnings)
a <- generic_ews(Z, detrending="gaussian")
```




![](/assets/figures/2012-12-18-6c85b56d2c-mei2012.png)

How about the data from MacDonald (2005)

[original data link](ftp://ftp.ncdc.noaa.gov/pub/data/paleo/treering/reconstructions/pdo-macdonald2005.txt)


```r
dat <- read.table("http://www.carlboettiger.info/assets/data/pdo-macdonald2005.csv", header=TRUE)
```



```r
png("macdonald2005.png")
require(earlywarnings)
a <- generic_ews(dat, detrending="gaussian")
dev.off()
```


![](/assets/figures/2012-12-18-6c85b56d2c-pdo-macdonald2005.png)

