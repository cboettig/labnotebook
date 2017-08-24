---
layout: post
tags: [pmc]
categories: evolution
title: Follow-up on Parametric Bootstrapping
---






 








-   Continuing on yesterday's discussion of parametric boostrapping
    implementation. Peter sent some very helpful comments and agreed to
    having them here for reference; I've added some links.

"I've read up a bit on the bootstrap just now. First off, although
parametric and nonparametric bootstrapping has always seemed very
different to me, they fit in the same natural framework. The general
idea is that in reality, there's some real parameters x and some
probability distribution P that's given us some data. We get an estimate
x' from that data. To estimate confidence (or what-have-you) in x', we
get some estimate P' of \*the probability distribution\*, and use P' to
make a bunch more fake data, to which we apply the estimation
procedures, etcetera. We could get P' by assuming a parametric model and
plugging in x'. Or, we could resample from the data, or permute it,
etcetera.

I suppose that you've seen the
['boot'](http://cran.r-project.org/web/packages/boot/index.html "http://cran.r-project.org/web/packages/boot/index.html")
package in R? It does both parametric and nonparametric bootstrapping,
and its function boot.ci() computes confidence intervals in some
sophisticated ways. Sophisticated ways? Why do we need to be more
sophisticated? Well, the simple, straightforward method that we were
using in the discussion is fine, really, but there's some corrections to
it that make it better. Briefly, the bootstrap introduces (small)
biases. Some references are:

    "Bootstrap confidence intervals", a review,
      http://www.jstor.org/stable/2246110
    "Better bootstrap confidence intervals", describing the method BCa,
      http://www.jstor.org/stable/2289144

(and which does \*not\* come after the above article, btw) both by
Bradley Efron. Note that here ABC refers to "approximate bootstrap", not
"approximate bayesian".

One message is that one needs about 1,000 bootstrap replicates to get
good confidence intervals.

One interesting note from the first article: the "standard" confidence
intervals are not transformation invariant: often it is advisable to
apply some transformation (e.g. tanh\^{-1}) to the data to get the
intervals. The BCa bootstrap intervals are, by contrast, transformation
invariant."

-   The boot() function from the R package looks like a straight-forward
    way to implement these methods, though I will probably rely mostly
    on the standard method discussed yesterday which is basically a
    direct implementation of the Confidence Interval definition and
    hence a more transparent statistic for the user than the fancy
    methods. If I implement it with the boot() function, it will be easy
    for the user to obtain which-so-ever they want and for me to explore
    how they differ in practice in any case.

\

