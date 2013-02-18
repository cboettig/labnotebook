---
layout: post
tags: [warning-signals, code-tricks]
categories: [ecology]
title: Warning Signals
---






 








-   bootstrapping models implemented
-   improved handling of model classes -- included T, t0, N, and X0 in
    object def
-   implemented plotting for model bootstrap
-   difficulties with changePt model fit remain. fixed one source of
    trouble -- no longer passes zero-length data to OU.lik() when
    t\_shift is outside the time interval.
    -   Still giving errors on coercing lists into doubles for the
        saddle\_node bifurcation simulated data set. --**fixed**, was
        getting t\_shift as a vector from time(X).

Code Tricks
-----------

Duncan pts out: the S3 mechanism is

     custom =
     function(x, y, ...)
     UseMethod("custom")

Then that will find and use custom.foo, etc. based on the class of the
value of x. You can have it dispatch on a different parameter, but that
is not very common. And to dispatch on the types/classes of multiple
parameters, e.g. x is a numeric vector, y is a matrix, you would need to
use S4.

See the
[setGeneric()](http://sekhon.berkeley.edu/library/methods/html/setGeneric.html "http://sekhon.berkeley.edu/library/methods/html/setGeneric.html")
function in R for S4 method (also compatible with S3 classes).

\

\

