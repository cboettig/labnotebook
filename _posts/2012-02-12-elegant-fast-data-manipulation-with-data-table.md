---
comments: true
date: 2012-02-12 13:39:03
layout: post
slug: elegant-fast-data-manipulation-with-data-table
title: Elegant & fast data manipulation with data.table
redirects: [/wordpress/archives/3832, /archives/3832]
categories:
- computation
tags:
- R
modified: 2012-12-03

---

Just learned about the R [data.table package](http://cran.r-project.org/web/packages/data.table/index.html) (ht @recology_) makes R data frames into ultra-fast, SQL-like objects.



One thing we get is some very nice and powerful syntax.  Consider some simple data of replicate time series:

```r
time <- rep(1:10, 10)
replicate <- sort(time)
value <- rnorm(100)
df <- data.frame(replicate, time, value)
```






To apply a function to each set of replicates, instead of 

```r
sapply(1:max(df$replicate), function(i) 
  mean( df[df$replicate == i,]$value) 
)
```


We can use

```r
require(data.table)
dt <- data.table(df)
dt[, mean(value), by="replicate"]

```




Note that we could have passed multiple arguments to the function, `f(time, value)`, or functions of the arguments, `mean(value*time)`, etc.  While this can be much faster data-frames to begin with (see below), when the function is much more computationally intensive than "mean", it might be sensible to parallelize this command instead:



```r
require(snowfall)
sfInit(par=T, cpu=4)
sfSapply(1:10, function(i)
  mean (dt[replicate==i, value] )
)
```

Note that we could have given the second argument as a list if we needed multiple columns, i.e. `list(time, value)`.  For a provocative example, consider this example comparing the two.  Let's create a very big data frame, and also make it a data table:

```r
grpsize = ceiling(1e7/26^2) 
DF <- data.frame(x=rep(factor(LETTERS), each = 26 * grpsize), 
                 y=rep(factor(letters), each = grpsize), 
                 v=runif(grpsize * 26 ^ 2))
DT <- data.table(DF)
```


This table has three columns, each capital letter of the alphabet (fist column) paired with each lower-case letter in column B.  Let's imagine we want all the cases that have a capital "R" and lowercase "f".  Well, in classic R we might do:

```r
system.time( 
  DF[DF$x=="R" & DF$y=="f", ]
)
user  system elapsed 
  2.796   0.500   3.313 
```


We could do the same command with DF, and it would do the same "Vector Search", which is slow (order N).  we can get order log(N) scaling though with join option of data.table.  We first have to set x and y as "keys".  


```r
setkey(DT, x, y)
system.time(
  DT[J("R", "h")]
)
   user  system elapsed 
  0.012   0.000   0.014 
```

A speed-up of 233 times!  Certainly better than splitting up the analysis over 100s of processors.  **Brilliant**.





## Relationship of commands to SQL



The FAQ vignette provides a nice line-by-line comparison of SQL commands to data.table commands:



data.table      SQL
----------      --------------
`i`             where
`j`             select
`:=`            update
`by`            group by
`i`             order by (in compound syntax)
`i`             having (in compound syntax)
`nomatch=NA`    outer join
`nomatch=0`     inner join
`mult="first"`  N/A because SQL is inherently unordered
`roll=TRUE`     N/A because SQL is inherently unordered



The general form is : `DT[where,select|update,group by][having][order by][ ]...[ ]`.  A key advantage of column vectors in R is that they are ordered, unlike SQL.

