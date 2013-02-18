---
layout: post

categories: evolution
title: a day of writing
---






 








Figuring out the best way to present the critique of AIC, introduction
to the method, introduction to the power test. Seeking inspiration from
Huelsenbeck 1996 and digging farther back into the literature:

\

1.  Cox, D.R. Further results on tests of separate families of
    hypotheses. Journal of the Royal Stastical Society 24,
    406-424(1962).
2.  Cox, D.R. Tests of Seperate Families of Hypotheses. Proceedings of
    the 4th Berkeley Symposium, University of California Press 105 -
    123(1961).
3.  Hall, P., Wilson, S. Two guidelines for bootstrap hypothesis
    testing. Biometrics 47, 757-762(1991).

Interesting question on R-sig-phylo
-----------------------------------

My reply:

A few responses in-line below, hope they're helpful. In general
averaging over trees to estimate parameters sounds great, a couple
hurdles.

On Tue, Oct 12, 2010 at 5:08 PM, Lara Poplarski
<larapoplarski@gmail.com\> wrote:

       Dear List,

       I am new to R, and hope someone can kindly help with the following
       task. I have a Bayesian sample of trees in nexus format and discrete
       data; example trees and data are at the bottom of the email. I would
       like to use fitDiscrete in geiger to estimate parameter lambda for all
       variables. The idea is to then compare the distributions across trees
       of lambda values for the different variables.

       I have been using the following:

       for(i in 1:5) {
       cat("t",i,"\n");
       fd<-fitDiscrete(treesi,data,treeTransform="lambda")
       print(fd)
       }

       A few specific questions:

       1. Since trees in my sample are non-ultrametric, I get the following warning:
       Warning: some tree transformations in GEIGER might not be sensible for
       nonultrametric trees.

       Is the lambda transformation sensible for non-ultrametric trees? I
       could not find further information on this in the manual or in the
       Pagel references.

\
 No, the transformation is only meaningful it the trees are ultrametric.
The models describe rates of change through time, and thus assume branch
lengths are proportional to time, not to number of substitutions. This
is true for most models in comparative methods.

\

       2. In some cases, I get the following warning:
       [1] "Warning: may not have converged to a proper solution."

       Does it make sense to get fitDiscrete to repeat the ML estimation for
       these cases, until convergence? Can someone suggest how to modify the
       loop above to do this?

\
 There are several reasons why the maximum likelihood optimization
routine can fail to converge, and you're quite right that an
insufficient number of iterations is one of them. I don't believe Geiger
supports passing additional arguments to the optim routine. The error
message you see is produced by Geiger and includes both the case when
the iteration number is insufficient or when the algorithm fails to
converge for some other reason (such as a ridge of optima, for instance
a nearly star like phylogeny will always give this error). See the help
page on optim function for more information, but modifying the
iterations and error handling will I believe require you to look into
the geiger code.

In leiu of this, you'll want to note and exclude estimates that do not
achieve convergence.

\

       3. Finally, I would be grateful for pointers on how to tackle the
       output. For example, can someone suggest how to go about calculating
       the mean lambda value, across trees, for each of the 4 variables?

\
 There seems to be a bug in the Geiger code whereby it doesn't actually
report the value of lambda (treeParam) if the data argument is a matrix,
so this requires an extra step (otherwise you'd pass the whole data
matrix and could skip my second apply fn).

You want to create a matrix where each row represents a different tree,
and each column a different trait value.

~~~~ {.de1}
lambda <- sapply(1:n_trees,                        # Apply what follows to all trees
  function( i ){
    sapply(1:n_traits,                                    # Apply what follows for each trait
      function( j ){
        fd <- fitDiscrete(tree[[i]], data[, j ], treeT="lambda" )     # fitDiscrete for tree i, trait j
        fd[[1]]$treeParam
     })
  }
)
~~~~

Then just calculate the average / variance / histogram / etc over the
column.

\

       I also have a more general question. Both the tree sample and dataset
       are relative large (1000 trees * 80 variables), so based on
       preliminary runs I expect the analysis to take rather long. Any
       suggestions on how to speed things up and/or on a different approach
       to the tree sample/multiple variable set-up would be most welcome!

Good point. Since the order you do the trees in doesn't matter, an
sapply function can be used instead of a for loop, it is generally much
faster. If you have a multicore machine, take a look at the snowfall
package in R, which will let you run your sapply loop in parallel
automatically. Sounds like it will take a few days to run them all.

\

       Many thanks in advance,

\
 Err, hope that made sense, feel free to ask for clarification etc. Carl

\

\

