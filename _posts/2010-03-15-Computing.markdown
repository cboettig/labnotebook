---
layout: post
tags: [Labrids]
categories: evolution
title: Computing
---






 








-   Exploring parallel computing options. [OpenMP for distributed memory
    applications](http://www.ecn.purdue.edu/ParaMount/publications/HIPS07-smin.pdf "http://www.ecn.purdue.edu/ParaMount/publications/HIPS07-smin.pdf").
-   learning git -- need to get used to the branch and merge, install on
    one.

Research
--------

The failure of the Anoles data set to robustly select the more common
model can easily be explained by the likelihood distribution: Not
surprising since this dataset consists of only 23 taxa. The Labrid tree
of 114 taxa clearly resolves the difference between the different
models. Bootstrapping should be a more reliable guide than comparing AIC
scores.

![image](http://openwetware.org/images/7/71/Anoles_boot.png)

Compare to the Labrid data set:

![image](http://openwetware.org/images/7/7b/6_boot.png)

These use 200 bootstrap simulations, repeating with 2000 for better
resolution.

\

### Significance

**Breakthrough!** This approach has far greater implications than I
first realized. This provides an inverse approach which solves the
hardest part of my original problem, and then tests that under the
phylogenetic context. Solving the partition problem independent of the
phylogeny, reconstructing the ancestral states as a purely discrete
problem, and then scoring the resulting continuous time model on the
phylogeny is likely to be far more effective, efficient, and robust,
then the direct calculation of the joint probability that I've been
pursuing. While the three steps: partitioning, discrete inference, and
continuous inference; all need refining, I think I'm very close to my
first implementation of the full problem!

\

### Next Steps

-   Compare likelihood scores under different levels of partitioning.
-   Parametric bootstrapping of partitioning
-   look at parametric bootstrap of parameter values inferred as well as
    the model likelihood.
-   Stochastic Painting from ancestral state reconstruction on discrete
    traits
-   Functionalize the three steps to inference

\

### Other Progress

-   Working on implementing an ouch2ape function to get ouch trees back
    into ape.
-   Begun functionalizing partitioning, discrete and continuous
    inference. Converting between formats without getting data
    misaligned is remarkably complicated.

From the git log
----------------

commit ddf6db6fca626c8f6ed31f4ab2a7cb78ed70f226 Author: Carl Boettiger
<cboettig@gmail.com\> Date: Mon Mar 15 09:40:08 2010 -0700

       Updated doxygen comments

commit 17dd3775004741c9c590828b498dacd75c5bfc49 Author: Carl Boettiger
<cboettig@gmail.com\> Date: Mon Mar 15 09:39:34 2010 -0700

       added license and multimin fn

commit 02b9bfc02cb830297fc7fad81cfcd05598d482f1 Author: Carl Boettiger
<cboettig@gmail.com\> Date: Mon Mar 15 09:22:21 2010 -0700

       mcmc is basics now implemented.

commit 220ccae12fbbdf78cd5e082555c04b99af92c4af Author: Carl Boettiger
<cboettig@gmail.com\> Date: Sun Mar 14 20:51:50 2010 -0700

       adding the mcmc routine

commit 94642c8d406fb0d6e8970dc31cfd5304dda2c007 Author: Carl Boettiger
<cboettig@gmail.com\> Date: Sun Mar 14 15:33:39 2010 -0700

       first commit

\

