---
layout: post

categories: evolution
title: Likelihood Ratio Manuscript
---






 








### Graham & Peter Meeting

#### Some comments on Neyman Pearson and approaches

\> In the phylogenetics world, Huelsenbeck has a paper doing this: " A
Likelihood Ratio Test to Detect Conflicting Phylogenetic Signal" and
there's a good introduction to the paper.

This is great, nice to know there's a basis for it.

\> I see that in the paper John references, " Statistical tests of
models of DNA substitution ", they call what you're doing "Monte Carlo",
and refers to some sort of resampling-the-data equivalent as the
bootstrap. The references in that paper are useful: Riplay '87 and Cox
'61 and '62. (the first Cox paper is the one I referred to before)

Yes, it seems a lot of the literature assumes bootstrap means
non-parametric bootstrap, and there also seems some bias against the
word, so Monte Carlo might be more useful, if less precise, than calling
it parametric bootstrap.

\
 \> There's also some literature on mixture models, for instance, in "On
Bootstrapping the Likelihood Ratio Test Stastistic for the Number of
Components in a Normal Mixture":

\> " In many situations in practice, for example in cluster analysis
where g is the number of components correspond the number of
non-overlapping clusters to be produced for the to data, there is no a
priori knowledge of g. An obvious way of approaching this problem is to
use the likelihood ratio test statistic to test for the smallest value
of g compatible with the data. Unfortunately with mixture models, it is
well known that regularity conditions do not hold for -2 log A to have
its usual asymptotic null distribution of chi-squared with degrees of
freedom equal to the difference between the number of parameters under
the null and alternative hypotheses. In the context of latent class
models, Aitkin, Anderson and Hinde (1981) assessed the null distribution
-2 log A using a resampling of method which can be viewed as a
particular application of the general bootstrap approach of Efron (1979,
1982). The assessment made is on the basis of a number, say K, of
bootstrap replications of -2 log A obtained by appropriate of
resampling. More recently, Aitkin and Rubin (1985) adopted an approach
which places a prior distribution on the vector of mixing proportions
over which the likelihood is integrated before the evaluation of -2 log
A. "

\> However, they do things somewhat differently: they re-estimate their
parameters for each bootstrapped replicate, and take the likelihood
ratio with the resulting parameters.

This is in fact what I am doing. This makes more sense to me since it
treats the simulated data. I should make sure to be more explicit in the
paper.

\> Hm, and crucially, here's a section from Goldman "...DNA
substitution" "It is crucially important that these likelihoods be
maximized independently for each i (i.e., \\alpha and \\beta must be
estimated separately for each x\_i) when performing the Monte Carlo
simulation, and not simply calculated under the assumption that \\hat
\\alpha and \\hat \\beta as estimated from the original data; equation
(9b)] are correct."

\> They refer to Hall and Wilson as saying that not doing this: e.g. not
re-estimating the parameters each time, dramatically reduces the power.
That paper looks like a good one. Although it says it's about
"nonparametric" bootstrapping; I would have thought this was parametric
bootstrapping.

Right, I have tried both and have found the same thing. Great to have
the references to justify it. I'm with you on parametric/non-parametric,
though all the non-parametric Bayesians use "non-parametric" in the same
sense, as the number of parameters varies with the richness of the data,
rather than being predefined.

\> [these
papers](http://www.bibsonomy.org/user/peter.ralph/bootstrapAll "http://www.bibsonomy.org/user/peter.ralph/bootstrapAll")

\

#### some more comments

-So, Butler and King choose your OU.3 out of their five models? And
where do you end up? There is a bit of resolution lacking, here.

\
 -Do you check to see if the empirical likelihood distributions are
relatively stable? (e.g. simulating more isn't changing them much)

\
 -We really ought to find this talked about in the statistical
literature. The test of the sort we are talking about is proposed in
Cox, "Tests of Separate Families of Hypotheses",
[http://projecteuclid.org/euclid.bsmsp/1200512162](http://projecteuclid.org/euclid.bsmsp/1200512162 "http://projecteuclid.org/euclid.bsmsp/1200512162")
equation (48). Except this does not involve bootstrapping; this has
probably been dealt with in the literature. They seem to do this in
high-energy physics:
[http://www.springerlink.com/content/q02303062221314n/](http://www.springerlink.com/content/q02303062221314n/ "http://www.springerlink.com/content/q02303062221314n/")

\

\p. 2: "correlation typically strongest under a BM model" --- really?

\p. 4: Not clear why if "The sample points are then statistically
independent and the method of phylogenetically independent contrasts
will be positively misleading."

in general: the processes generally only "reach" the stationary
distribution colloquially -- to be correct, they "approach" it.

\p. 4: For example 1(c), it seems like the two models (correlation due
to phylogeny or due to selection towards different optima) may not
actually be separable, at least if the branches are long as you imply.
(oh, you talk about this on p. 5 ?)

top of p. 5: For an OU model one can do independent contrasts also, is
this not done?

top of p. 6: The reasoning for "Insufficient data" isn't so good.

\p. 6: "Because the BM model does not have a stationary distribution,
correlations established during shared history along a phylogeny are
never erased..." -- Actually, the correlation still approaches zero as
the length of the terminal nodes grows: this approaches the star-tree,
for which the tips are independent.

\p. 7: "dividing the size data into two groups by maximum likelihood" --
dividing by ML how?

\p. 8, Figure 3: It seems that in Figure 3, each model's distribution of
AIC score is computed under itself? That is, the red curve were the AIC
scores of observations got by simulating under the red model? If so,
then the figure does not say that OU.2 outperforms the others. It says
that AIC isn't correctly penalizing, because if it was, all of those
curves would be centered in the same place. (right? that's the point of
the penalization?) It would be better, if indeed you aren't already, to
simulate under one model and draw those curves.

\p. 9: "most powerful test" means something specific; it shouldn't be
followed by "of the probability of falsely accepting the null
hypothesis".

\p. 9: Do you have a citation for the likelihood ratio failing in the
case of a boundary value?

\p. 10: did you actually implement the bootstrap corrections of Efron et
al?

\p. 10: I think a better word than "confirm" could be used. Or at least
some discussion.

\p. 11: Discussion about OU.2 vs OU.3 -- P=.06 isn't all that small,
considering the multiple testing going on? Some more discussion is
called for.

\p. 12 and elsewhere: Probably should avoid "robust" without specifying
robust to what, since it means something specific.

Fig 7: Why don't you show the corresponding plot for OU.3 vs OU.\*?

#### More comments by hand on manuscript printout

Power in Trees direct test
--------------------------

-   Implementing a direct test of power in trees, see
    [powertest.R](http://github.com/cboettig/Comparative-Phylogenetics/blob/dab536f6c70a0bd47847bb088c4277c4b439c5e7/R/powertest.R "http://github.com/cboettig/Comparative-Phylogenetics/blob/dab536f6c70a0bd47847bb088c4277c4b439c5e7/R/powertest.R")
    in Comparative-Phylogenetics. Approach simulates data on the tree at
    progressively higher values of alpha, and uses the Monte Carlo
    likelihood ratio test to decide the minimum alpha that can be
    detected relative to the length of the tree. Requires a single
    likelihood ratio bootstrap on each value of alpha to be tested.

-   Added support for my older traitmodels function, which I've
    resurrected as a branch from the wrightscape library. located in
    \~/Documents/experimental/wrightscape-clone/wrightscape/R and is on
    a branch called single\_peak\_ou

\

-   Fits of OU are a subset of BM, so in principle should always
    outperform the likelihood of BM. Numerics struggle to converge in
    some cases giving wildly poor likelihoods though.

-   parallelization is giving strange errors

<!-- -->

     Error in checkForRemoteErrors(val) : 
     one node produced an error: Starting of snow cluster failed! Error in socketConnection(port = port, server = TRUE, blocking = TRUE,   
     cannot open the connection

--Carl Boettiger 02:45, 26 August 2010 (EDT) Fixed by removing the
snowfall parallelization in the LR\_boot function.

#### primates Example

using the trivial 5-taxa primate tree often used in ape package
examples, minimum alpha exceeds all values tested (\>2000). As expected.

#### Anoles Example

~~~~ {.de1}
> out2 <- treepower(tree, nboot=100, cpu=1, alpha=alpha )
 
$min_alpha
[1] 6
 
$p
 [1] 0.27 0.86 0.65 0.21 0.17 0.98 0.16 0.69 0.39 0.93 0.97 0.97 1.00 1.00 0.94
[16] 1.00 0.99 1.00 0.99 1.00 1.00 1.00 1.00
~~~~

\

#### Labrids Example

appears to be somewhere around 1.

\

#### Geospiza Example

~~~~ {.de1}
> birds2 <- treepower(ape2ouch(geospiza$geospiza.tree), nboot=100, cpu=1, alpha=alpha)
> birds2$p
 [1] 0.80 0.61 0.17 0.71 0.33 0.72 0.61 0.69 0.80 0.35 0.99 0.78 0.94 1.00 0.94
[16] 0.93 0.72 0.88 0.98 1.00 1.00 0.96 0.97
> alpha
 [1]  0.1  0.2  0.3  0.4  0.5  0.6  0.7  0.8  0.9  1.0  2.0  3.0  4.0  5.0  6.0
[16]  7.0  8.0  9.0 10.0 20.0 30.0 40.0 50.0
minimum detectable alpha is 9
 
> #fewer replicates, varied outcome
> out <- treepower(tree, nboot=40, cpu=1, alpha=alpha )
> out$p
 [1] 0.375 0.775 0.675 0.525 0.500 0.725 0.950 0.950 1.000 0.575 0.775 1.000
[13] 1.000 1.000 1.000 1.000 1.000 1.000 1.000 1.000 1.000 1.000 1.000
minimum detectable alpha is 2
~~~~

\

#### Running additional examples overnight =

\

