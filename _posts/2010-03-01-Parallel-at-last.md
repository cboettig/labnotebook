---
layout: post

categories: [ecology]
title: Parallel at last
---






 








-   svn revision 27 should have functional parallel code! Certainly I've
    gotten much better at openmp in the past few days. Difficult to
    maintain a general API that is agnostic to the model details and
    still knows enough about the data formats to declare them
    appropriately for each thread. My lesson for my future coding: by
    writing with parallelization concepts in mind from the start I
    should be able to significantly reduce the overhead time when I go
    back and add openmp directives. Gillespie API still needs perfecting
    but should be able to push ahead with the science now.

-   still need to add const qualifiers and expand documentation.

Science Goals
-------------

-   Next steps are the analytic approximations for the expected variance
    about the warning signals (variance of the variance estimate
    essentially). This also should be implemented in the code, which is
    more straight forward.

\

* * * * *

[HTML Comment Box](http://www.htmlcommentbox.com) is loading comments...

\

\

