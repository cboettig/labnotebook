---
layout: post
title: "Extending ape::phylo class to NeXML:"
subtitle: Promoting an S3 class into S4 while maintaining existing methods 
category: evolution 
tags: 
- R
- code-tricks 
- rnexml
- ropensci
---

While working on the [RNeXML](https://github.com/ropensci/RNeXML) package, I have recently I have been puzzling over extending S3 objects to share some of the nice properties of S4 objects and methods while continuing to function with the potentially huge library of functions written to work with them.  [SO:](http://stackoverflow.com/questions/17976217/make-s4-object-act-as-an-s3-class)

To illustrate this issue, consider the S3 class `phylo` provided by the `ape` package and used by most of the 30+ packages that reverse depend or reverse import `ape`.   Despite this popularity, the S3 class has quite a few shortcomings (including inconsistent definition in ordering of it's components, see the phylobase paper).  To address these concerns, a hackathon consisting of many of the leading developers in this field created the `phylobase` package with `S4` definitions of `phylo` objects that extend the class to handle additional types of data and address various other concerns that have arisen. Unfortunately, as far as I can tell, adoption of the new format has been lacking. In my mind, the greatest limitation of the new format is the lack of compatibility with existing methods build on the S3 type.  

I never understood why phylobase did not do this. To illustrate the problem, let us load an S3 `phylo` object and then coerce it into the `phylobase` S4 type:
 

```r
library(phylobase)
library(ape)
data(bird.orders)
bird.orders4 <- as(bird.orders, "phylo4") # make ape::phylo tree into phylobase::phylo4 S4 class
```


The S4 class has explicitly defined it's own plotting method, so:


```r
plot(bird.orders4) 
```

![](http://farm8.staticflickr.com/7460/10145618405_f4b1a81df8_o.png) 


However, the original S3 plotting method fails:


```r
plot.phylo(bird.orders4) 
```

```
Error: $ operator not defined for this S4 class
```


More interesting functions, many of which may not have even existed when `phylobase` was written, operate only on the S3 class:



```r
 S <- c(10, 47, 69, 214, 161, 17, 355, 51, 56, 10, 39, 152,
             6, 143, 358, 103, 319, 23, 291, 313, 196, 1027, 5712)
bd.ext(bird.orders4, S)   # Fails 
```

```
Error: object "phy" is not of class "phylo"
```



While we can work around this with explicit coercion, this requirement is rather crude and breaks existing code users may already rely upon:


```r
bd.ext(as(bird.orders4, "phylo"), S)   # Works only after coercion 
```

```

Extended Version of the Birth-Death Models to
    Estimate Speciation and Extinction Rates

    Data: phylogenetic: as(bird.orders4, "phylo") 
             taxonomic: S 
        Number of tips: 23 
              Deviance: 290.2 
        Log-likelihood: -145.1 
   Parameter estimates:
      d / b = 2.315e-08   StdErr = 0.1542 
      b - d = 0.2765   StdErr = 0.009578 
   (b: speciation rate, d: extinction rate)
```


It appears this problem can be solved using `setOldClass`.   I've defined an the class `phyloS4` which inherits all methods for the S3 `phylo` class without having to explicitly declare those methods. In this way, we have the benefits of an S4 class while maintaining compatibility with all developers who only write functions based on the S3 class.  (as long as functions don't stupidly check the string identity `class(obj) == "phylo"`, instead of using the proper class check `is(obj, "phylo")` -- looking at you `ape::skyline` and friends....)



```r
setClass("phyloS4", 
         representation(edge = "matrix",
                        Nnode = "integer",
                        tip.label = "character",
                        edge.length = "numeric"))
setOldClass("phylo", S4Class="phyloS4")
selectMethod("show", "phylo")
removeClass("phyloS4")
```

[^1] 


Now consider using our S4 version, rather than the phylobase S4 version:  


```r
a <- new("phylo", bird.orders)
is(a, "phylo")
```

```
[1] TRUE
```

```r
bd.ext(a, S)   
```

```

Extended Version of the Birth-Death Models to
    Estimate Speciation and Extinction Rates

    Data: phylogenetic: a 
             taxonomic: S 
        Number of tips: 23 
              Deviance: 290.2 
        Log-likelihood: -145.1 
   Parameter estimates:
      d / b = 2.315e-08   StdErr = 0.1542 
      b - d = 0.2765   StdErr = 0.009578 
   (b: speciation rate, d: extinction rate)
```


Class, `show`, and `plot`, and additional (`bd.ext`) methods from the S3 class just work.  Now we want to extend the class to contain additional metadata (in my case, the `nexml` information):  

I can then build a new class, `nexmlTree` by extending this class.  Again my new class acts like an S3 `phylo` in any such functions, but adds a representation containing all the nexml data.  This approach doesn't minimize memory footprint, but usually that is not a concern for R users (otherwise coercion is always an option).  


```r
library(RNeXML)
setClass("nexmlTree", representation(nexml = "nexml"), contains="phylo")
setMethod("show", "nexmlTree", function(object) print.phylo(object))
```

```
[1] "show"
```


Again, we check a few methods: 


```r
 b <- new("nexmlTree", bird.orders, nexml = as(bird.orders, "nexml"))
is(b, "phylo")
```

```
[1] TRUE
```

```r
bd.ext(b, S)   
```

```

Extended Version of the Birth-Death Models to
    Estimate Speciation and Extinction Rates

    Data: phylogenetic: b 
             taxonomic: S 
        Number of tips: 23 
              Deviance: 290.2 
        Log-likelihood: -145.1 
   Parameter estimates:
      d / b = 2.315e-08   StdErr = 0.1542 
      b - d = 0.2765   StdErr = 0.009578 
   (b: speciation rate, d: extinction rate)
```


This provides the additional metadata while leaving us with an object that works with all existing functions. 



[^1]:I'm not quite sure why this required the `show` method to be defined such that we wouldn't get the S4 show method instead.  As a default show method seems to be the only method automatically defined for the new class, I gather it is the only one we have to overwrite in preference for the `print.phylo()` method.  
