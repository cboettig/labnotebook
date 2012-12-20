---
layout: post
category: ecology
tags: warning-signals

---





ENSO EWS
========================================================

Let's just see what happens with the [MEI data](http://www.esrl.noaa.gov/psd/enso/mei/) for PDO:


```r
dat <- read.table("http://carlboettiger.info/assets/data/mei.csv", header=TRUE)
```



```r
print(xtable::xtable(head(dat)), type="html")
```

<!-- html table generated in R 2.15.2 by xtable 1.7-0 package -->
<!-- Mon Dec 17 15:31:58 2012 -->
<TABLE border=1>
<TR> <TH>  </TH> <TH> YEAR </TH> <TH> DECJAN </TH> <TH> JANFEB </TH> <TH> FEBMAR </TH> <TH> MARAPR </TH> <TH> APRMAY </TH> <TH> MAYJUN </TH> <TH> JUNJUL </TH> <TH> JULAUG </TH> <TH> AUGSEP </TH> <TH> SEPOCT </TH> <TH> OCTNOV </TH> <TH> NOVDEC </TH>  </TR>
  <TR> <TD align="right"> 1 </TD> <TD align="right"> 1950 </TD> <TD align="right"> -1.02 </TD> <TD align="right"> -1.15 </TD> <TD align="right"> -1.29 </TD> <TD align="right"> -1.06 </TD> <TD align="right"> -1.42 </TD> <TD align="right"> -1.37 </TD> <TD align="right"> -1.33 </TD> <TD align="right"> -1.06 </TD> <TD align="right"> -0.58 </TD> <TD align="right"> -0.40 </TD> <TD align="right"> -1.15 </TD> <TD align="right"> -1.25 </TD> </TR>
  <TR> <TD align="right"> 2 </TD> <TD align="right"> 1951 </TD> <TD align="right"> -1.07 </TD> <TD align="right"> -1.20 </TD> <TD align="right"> -1.21 </TD> <TD align="right"> -0.44 </TD> <TD align="right"> -0.28 </TD> <TD align="right"> 0.46 </TD> <TD align="right"> 0.74 </TD> <TD align="right"> 0.85 </TD> <TD align="right"> 0.77 </TD> <TD align="right"> 0.75 </TD> <TD align="right"> 0.73 </TD> <TD align="right"> 0.47 </TD> </TR>
  <TR> <TD align="right"> 3 </TD> <TD align="right"> 1952 </TD> <TD align="right"> 0.41 </TD> <TD align="right"> 0.13 </TD> <TD align="right"> 0.09 </TD> <TD align="right"> 0.26 </TD> <TD align="right"> -0.27 </TD> <TD align="right"> -0.64 </TD> <TD align="right"> -0.24 </TD> <TD align="right"> -0.16 </TD> <TD align="right"> 0.36 </TD> <TD align="right"> 0.31 </TD> <TD align="right"> -0.34 </TD> <TD align="right"> -0.12 </TD> </TR>
  <TR> <TD align="right"> 4 </TD> <TD align="right"> 1953 </TD> <TD align="right"> 0.02 </TD> <TD align="right"> 0.38 </TD> <TD align="right"> 0.27 </TD> <TD align="right"> 0.71 </TD> <TD align="right"> 0.84 </TD> <TD align="right"> 0.25 </TD> <TD align="right"> 0.42 </TD> <TD align="right"> 0.25 </TD> <TD align="right"> 0.52 </TD> <TD align="right"> 0.09 </TD> <TD align="right"> 0.05 </TD> <TD align="right"> 0.31 </TD> </TR>
  <TR> <TD align="right"> 5 </TD> <TD align="right"> 1954 </TD> <TD align="right"> -0.05 </TD> <TD align="right"> -0.02 </TD> <TD align="right"> 0.17 </TD> <TD align="right"> -0.51 </TD> <TD align="right"> -1.43 </TD> <TD align="right"> -1.59 </TD> <TD align="right"> -1.40 </TD> <TD align="right"> -1.47 </TD> <TD align="right"> -1.16 </TD> <TD align="right"> -1.37 </TD> <TD align="right"> -1.15 </TD> <TD align="right"> -1.11 </TD> </TR>
  <TR> <TD align="right"> 6 </TD> <TD align="right"> 1955 </TD> <TD align="right"> -0.77 </TD> <TD align="right"> -0.69 </TD> <TD align="right"> -1.13 </TD> <TD align="right"> -1.56 </TD> <TD align="right"> -1.63 </TD> <TD align="right"> -2.29 </TD> <TD align="right"> -1.93 </TD> <TD align="right"> -2.04 </TD> <TD align="right"> -1.82 </TD> <TD align="right"> -1.75 </TD> <TD align="right"> -1.83 </TD> <TD align="right"> -1.86 </TD> </TR>
   </TABLE>


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




![](http://carlboettiger.info/assets/figures/2012-12-18-6c85b56d2c-mei2012.png)

How about the data from MacDonald (2005)

[original data link](ftp://ftp.ncdc.noaa.gov/pub/data/paleo/treering/reconstructions/pdo-macdonald2005.txt)


```r
dat <- read.table("http://carlboettiger.info/assets/data/pdo-macdonald2005.csv", header=TRUE)
```


```r
print(xtable::xtable(head(dat)), type="html")
```

<!-- html table generated in R 2.15.2 by xtable 1.7-0 package -->
<!-- Tue Dec 18 17:51:38 2012 -->
<TABLE border=1>
<TR> <TH>  </TH> <TH> Year </TH> <TH> PDO_Reconstruction </TH>  </TR>
  <TR> <TD align="right"> 1 </TD> <TD align="right"> 993 </TD> <TD align="right"> 0.61 </TD> </TR>
  <TR> <TD align="right"> 2 </TD> <TD align="right"> 994 </TD> <TD align="right"> 0.40 </TD> </TR>
  <TR> <TD align="right"> 3 </TD> <TD align="right"> 995 </TD> <TD align="right"> -0.90 </TD> </TR>
  <TR> <TD align="right"> 4 </TD> <TD align="right"> 996 </TD> <TD align="right"> -0.08 </TD> </TR>
  <TR> <TD align="right"> 5 </TD> <TD align="right"> 997 </TD> <TD align="right"> 0.14 </TD> </TR>
  <TR> <TD align="right"> 6 </TD> <TD align="right"> 998 </TD> <TD align="right"> -0.30 </TD> </TR>
   </TABLE>



```r
png("macdonald2005.png")
require(earlywarnings)
a <- generic_ews(dat, detrending="gaussian")
dev.off()
```


![](http://carlboettiger.info/assets/figures/2012-12-18-6c85b56d2c-pdo-macdonald2005.png)

