---
published: false
layout: post

---


R allows you to specify `>=` in a package dependency, not `==`.  The Comprehensive R Archive Network, CRAN, makes no requirement that package authors do not break their previous function API.  For instance, if version 0.1 of the package had a function

```r
foo <- function(x, y = 5){
  ...
}
```

then one could add new functionality in say, version 0.2 without breaking the existing API with a definition that looked like:

```r
foo <- function(x, y = 5, z = NULL){
}
```

since any earlier function call such as `foo(5)` or `foo(3,4)` would give the same results.  However, changes like this break earlier calls:

```r
foo <- function(x, z, y = 4)
```

since the order of the arguments have changed, since `z` is not an optional argument, and since the default to `y` has changed.  Any such changes break the replicability of earlier code.  Now this would not be a problem if I could specify a particular version in the dependency, e.g. Depends: foobar == 0.1


Current CRAN guidelines state: 

> A package or ‘R’ can appear more than once in the ‘Depends’ field, for example to give upper and lower bounds on acceptable versions.

Any use of this will throw a NOTE, not sure if CRAN would object.  If the upper bound is not the most recent version on CRAN however, presumably CRAN will not take the package. Check seems to check against what is installed on the local system (which I believe does not support having multiple versions installed at once).  
