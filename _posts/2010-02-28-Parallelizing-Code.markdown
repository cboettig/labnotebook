---
layout: post

categories: [ecology]
title: Parallelizing Code
---






 








### A solution!

-   After a good bit more exploring permutations of openmp commands and
    experimenting with code (should have been done in a branch version
    so would be in the version management, instead done in my local
    experimental sandbox so will have to implement and merge into real
    code still!) was able to understand the root of my problem and pose
    a coherent question.
-   Posting that question on stack overflow [solved my
    problem](http://stackoverflow.com/questions/2352895/how-to-ensure-a-dynamically-allocated-array-is-private-in-openmp "http://stackoverflow.com/questions/2352895/how-to-ensure-a-dynamically-allocated-array-is-private-in-openmp")
    in under an hour. Two for two on fast and thorough solutions there,
    a fantastic resource.
-   As I understand it, the += strategy still risks collisions, perhaps
    these can be avoided by dynamically allocating the shared variable
    my\_report in the same fashion (i.e. after it is declared shared),
    but not ideal..

### To Do

-   Merge changes into actual code.
-   Add use of const (and possibly restrict) as often as possible, and
    start implementing these regularly when writing functions. Also more
    literate programming.
-   Illustrations of the ensemble variance vs time-averaged variance and
    it's expected deviations.

* * * * *

[HTML Comment Box](http://www.htmlcommentbox.com) is loading comments...

\

