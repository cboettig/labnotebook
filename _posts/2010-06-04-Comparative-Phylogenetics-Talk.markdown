---
layout: post

categories: evolution
title: Comparative Phylogenetics Talk
---






 








Practice talk in Wainwright lab meeting next Weds. 12 minutes.

-   Introduce question: Inferring the number of regimes
-   Context relative to existing methods
-   Statistical challenges -- model-dependent phylogenetic signal
    problem
-   Labrid example

Frameworks for approaching regimes question
-------------------------------------------

-   wrightscape
-   phylogenetically corrected clustering

-   speed/feasibility concerns, rate limiting steps.
-   model realism / representation concerns
-   statistical concerns

Returning to Wrightscape approach
---------------------------------

Haven't worked on the full problem of inferring multiple peaks directly
from comparative data using the joint probability calculation since the
beginning of this notebook, so about time to return to the direct
problem and compare with the more heuristic approach of
"phylogenetically corrected clustering" and also synthesize the work on
uncertainty which has been a dominate theme thus far (add category label
for this group!)

The direct calculation is still going by the name wrightscape, and the
project (without its svn history unforunately) has been migrated to git
and pushed to github. So thus far the current code for this project is
independent of that in Comparative-Phylogenetics project repository.
This is the home of the [Wrightscape
repository](http://github.com/cboettig/wrightscape "http://github.com/cboettig/wrightscape").

Since it's been a while since I've worked on this project, I begin by
refreshing myself as to the organizational structure of the code. The
callgraph provides a good summary:

![image](http://openwetware.org/images/thumb/b/b6/Callgraph.png/700px-Callgraph.png)

Generated with valgrind and visualized in kcachegrind by:

     make debug
     valgrind --tool=callgrind ./jointprob
     kcachegrind callgrind.out.*

kcachegrind then displays the call graph, (and other information), which
can save as png.

\
 We see the code compare a likelihood calculation using the linear
solutions compared with that of the matrix approach for the sample data
(which includes both trivially small tree example and the bimac dataset
from the Butler & King (2004) paper) for BM fit, OU fit, and the matrix
approach OU fit. The matrix approach clearly takes the dominate amount
of time, though results agree closely with the exact linear solutions in
both examples:

     analytic bm llik = -8.648713
     analytic ou llik = -8.570838
     matrix llik = -8.582334
     analytic bm llik = -65.106558
     analytic ou llik = -61.906121
     matrix llik = -61.927070

So what is the matrix approach implement exactly? Desending the call
graph further, we see it is mostly computing the transition matrix that
sits at each node (which it can do directly using the analytic OU
solution). Then the matrix solution to the joint probability is
specified by:

So what generality is gained by this approach? While the matrix
formulation is general, this requires the direct calculation applied to
each node. Should be able to simultaneously solve everything in a
particular regime directly, if there is a meaningful way to MCMC over
larger regime partitions rather than over node assignments.

Evolution meeting
-----------------

-   Aaron King's student, [Clayton
    Cressler](http://www-personal.umich.edu/~cressler/ "http://www-personal.umich.edu/~cressler/")
    [talk](http://2010.evolutionmeeting.org/search/index.php?func=detail&aid=501 "http://2010.evolutionmeeting.org/search/index.php?func=detail&aid=501")
-   Liam Revell
    [talk](http://2010.evolutionmeeting.org/search/index.php?func=detail&aid=459 "http://2010.evolutionmeeting.org/search/index.php?func=detail&aid=459")
-   Luke Harmon
    [talks](http://2010.evolutionmeeting.org/search/index.php?func=detail&aid=133 "http://2010.evolutionmeeting.org/search/index.php?func=detail&aid=133")
-   Michael Alfaro
    [talk](http://2010.evolutionmeeting.org/search/index.php?func=detail&aid=1379 "http://2010.evolutionmeeting.org/search/index.php?func=detail&aid=1379")

\

-   Hilmar Lapp, Rod Page
-   My
    [talk](http://2010.evolutionmeeting.org/search/index.php?func=detail&aid=18 "http://2010.evolutionmeeting.org/search/index.php?func=detail&aid=18")
-   Search [all
    talks](http://2010.evolutionmeeting.org/search/index.php?func=SelectAuth&ltr=All "http://2010.evolutionmeeting.org/search/index.php?func=SelectAuth&ltr=All")

\

-   Doesn't look like Andrew Hipp is listed. See my mattice entry from
    April.

\

