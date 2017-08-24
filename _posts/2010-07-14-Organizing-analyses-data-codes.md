---
layout: post

categories: evolution
title: Organizing analyses, data, codes
---






 








### Codes

-   Should have a suite of likelihood tools as a package
-   Suite of data manipulation functions, mostly to and from ape/ouch

\
 idealized workflow:

-   Read in nexus file and csv data.
-   Call model fit for each model to be tested (BM, one peak, multiple
    peaks, multiple peaks with independent selective forces)

\

-   A function checks tree and data for matches, discards those without
    match. This could be done automatically by the model fit. Could use
    a flag to disable the check when being called by the bootstrap
    function.
-   Convert data to the correct format. This could be done by the model
    fit, again with a flag to disable checking if not needed.
-   Model fit should take tree in either format and return it in the
    format given. Tools should allow conversions between formats later
    as well.

\

More Examples
-------------

-   Labrid data set with parrot fish as separate regime.

Example illustrates data starting with nexus file and csv, dropping
unmatched tips, converting formats and identifying clade by the common
ancestor of its two most distant members:

~~~~ {.de1}
# labrid example
 
# This data has not been released
require(wrightscape)
require(geiger)
source("/home/cboettig/Documents/ucdavis/research/phylotrees/code/Comparative-Phylogenetics/R/data_formats.R")
 
#path = "/home/cboettig/Documents/research/phylotrees/data/labrids/"
path = "../../data/labrids/"
labrid_tree <- read.nexus(paste(path, "labrid_tree.nex", sep=""))
labrid_data <-read.csv(paste(path,"labrid.csv", sep=""))
rownames(labrid_data) <- labrid_data[,1]
 
# We'll just use the fin angle data
fin_angle <- labrid_data$FinAngle
names(fin_angle) <- labrid_data[,1]
 
  # Convert the data, dropping unmatched tips
  labrid <- treedata(labrid_tree, fin_angle)
  names(labrid$data) <- rownames(labrid$data)
  labrid <- ape2ouch_all(labrid$phy, labrid$data)
 
  # We'll paint the parrotfish a different regime
  parrotfish <- labrid$tree@nodelabels[c(pmatch("Scarus_spinus", labrid$tree@nodelabels), pmatch("Crypto", labrid$tree@nodelabels) )]
  parrotfish_clade <- as.integer(mrcaOUCH(parrotfish, labrid$tree))
 
  parrotfish_regime <- paintBranches(parrotfish_clade, labrid$tree)
 
  single_regime <- as.factor(character(labrid$tree@nnodes))
  names(single_regime) <- labrid$tree@nodes
 
  bm <- brown(labrid$data, labrid$tree)
  ou1 <- hansen(labrid$data, labrid$tree, regime=single_regime, 1, 1)
  ws1 <- wrightscape(labrid$data, labrid$tree, regime=single_regime, 1, 1)
  ou2 <- hansen(labrid$data, labrid$tree, regime=parrotfish_regime, 1, 1)
  ws2 <- wrightscape(labrid$data, labrid$tree, regime=parrotfish_regime, (ou2@sqrt.alpha)^2, ou2@sigma)
 
  labrid_models <- list(bm = bm, ws1=ws1, ou2=ou2, ws2=ws2)
 
    LR <- choose_model(labrid_models, 100)
    png("wrightscape_labrid.png",width=2000, height=600) 
    par(mfrow=c(1,3))
    pretty_plot(LR[[1]], main="support for OU over BM")
    pretty_plot(LR[[2]], main="support for 2 peaks over 1")
    pretty_plot(LR[[3]], main="support for differential selective strength")
    dev.off()
~~~~

bootstrap is still running...

Optimization thoughts
---------------------

-   While seeding the alpha and sigma values with the global estimates
    increases the convergence speed of the simplex method, it is
    possible that this biases the method to estimate that the regimes
    are more similar than they actually are, since getting off the ridge
    might be difficult. (Could consider ways to not treat alpha and
    sigma independently?) Testing this idea with the simulated annealing
    approach, which has a better chance of getting off the ridge.

-   R code can now toggle algorithm to use simulated annealing or
    simplex method.

-   Using the labrid data set with fin morphology, simulated annealing
    does seem to get off the ridge. However, estimated optimum is
    outside the observed range, suggests uncertainty dominates the
    parameter estimates of the smaller parrotfish clade rather than
    representing significant differences.

\

~~~~ {.de1}
> # Nelder Mead, conditioning on hansen initial guess
> ws2$alpha; ws2$theta; ws2$sigma; ws2$loglik
[1] 1.079384 1.114845
[1] 51.43308 46.82123
[1] 14.44427 15.41473
[1] -381.3925
> 
> # simulated annealing improvement:
> ws2_$alpha; ws2_$theta; ws2_$sigma; ws2_$loglik
[1] 1.354885 2.187390
[1] 50.87688 29.35945
[1] 15.26238 10.99948
[1] -379.96
> 
> # subsequent Nelder Mead pushes values more extreme
> ws2_fast$alpha; ws2_fast$theta; ws2_fast$sigma; ws2_fast$loglik
[1] 0.6420187 4.2991044
[1] 52.17393  7.42868
[1] 13.05538  3.05305
[1] -377.3622
>
~~~~

\

\

