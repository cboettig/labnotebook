---
layout: post
title: 
subtitle: 
category: evolution 
tags: 
- R
- code-tricks 
- rnexml
---

Recently I have been puzzling over extending S3 objects to share some of the nice properties of S4 objects and methods while continuing to function with the potentially huge library of functions written to work with them.  [SO:]()

To illustrate this issue, consider the S3 class `phylo` provided by the `ape` package and used by most of the 30+ packages that reverse depend or reverse import `ape`.   Despite this popularity, the S3 class has quite a few shortcomings (including inconsistent definition in ordering of it's components, see the phylobase paper).  To address these concerns, a hackathon consisting of many of the leading developers in this field created the `phylobase` package with `S4` definitions of `phylo` objects that extend the class to handle additional types of data and address various other concerns that have arisen. Unfortunately, as far as I can tell, adoption of the new format has been lacking. In my mind, the greatest limitation of the new format is the lack of compatibility with existing methods build on the S3 type.  

I never understood why phylobase did not do this. To illustrate the problem, let us load an S3 `phylo` object and then coerce it into the `phylobase` S4 type:
 
```{r}
library(phylobase)
library(ape)
data(bird.orders)
bird.orders4 <- as(bird.orders, "phylo4") # make ape::phylo tree into phylobase::phylo4 S4 class
```

The S4 class has explicitly defined it's own plotting method, so:

```{r}
plot(bird.orders4) 
```

However, the original S3 plotting method fails:

```{r}
plot.phylo(bird.orders4) 
```

More interesting functions, many of which may not have even existed when `phylobase` was written, operate only on the S3 class:


```{r}
 S <- c(10, 47, 69, 214, 161, 17, 355, 51, 56, 10, 39, 152,
             6, 143, 358, 103, 319, 23, 291, 313, 196, 1027, 5712)
bd.ext(bird.orders4, S)   # Fails 
```


While we can work around this with explicit coercion, this requirement is rather crude and breaks existing code users may already rely upon:

```{r}
bd.ext(as(bird.orders4, "phylo"), S)   # Works only after coercion 
```

It appears this problem can be solved using `setOldClass`.   I've defined an the class `phyloS4` which inherits all methods for the S3 `phylo` class without having to explicitly declare those methods. In this way, we have the benefits of an S4 class while maintaining compatibility with all developers who only write functions based on the S3 class.  (as long as functions don't stupidly check the string identity `class(obj) == "phylo"`, instead of using the proper class check `is(obj, "phylo")` -- looking at you `ape::skyline` and friends....)


```{r}
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

```
a <- new("phylo", bird.orders)
is(a, "phylo")
bd.ext(a, S)   
```

Class, `show`, and `plot`, and additional (`bd.ext`) methods from the S3 class just work.  Now we want to extend the class to contain additional metadata (in my case, the `nexml` information):  

I can then build a new class, `nexmlTree` by extending this class.  Again my new class acts like an S3 `phylo` in any such functions, but adds a representation containing all the nexml data.  This approach doesn't minimize memory footprint, but usually that is not a concern for R users (otherwise coercion is always an option).  
```{r}
setClass("nexmlTree", representation(nexml = "nexml"), contains="phylo")
setMethod("show", "nexmlTree", function(object) print.phylo(object))
```

Again, we check a few methods: 

```{r}
 b <- new("nexmlTree", bird.orders, nexml = as(bird.orders, "nexml"))
is(a, "phylo")
bd.ext(b, S)   
```

This provides the additional metadata while leaving us with an object that works with all existing functions. 



[^1]:I'm not quite sure why this required the `show` method to be defined such that we wouldn't get the S4 show method instead.  As a default show method seems to be the only method automatically defined for the new class, I gather it is the only one we have to overwrite in preference for the `print.phylo()` method.  
