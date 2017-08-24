---
comments: true
date: 2011-03-07 21:22:42
layout: post
slug: bodega-phylogenetics-tutorial-behind-the-scenes-difficulties-in-r-packages
title: 'Bodega evolution Tutorial: behind the scenes difficulties in R packages'
redirects: [/wordpress/archives/1157, /archives/1157]
categories:
- evolution
---

Just finished my tutorial for comparative methods on continuous traits in R, which I'll be presenting on Wednesday with [Justen Whittall](http://www.jbwhittall.com/).  The [tutorial is up](http://bodegaphylo.wikispot.org/Continuous%5FCharacter%5FEvolution%5F%28Boettiger%29%5F2011) on the Bodega Phylogenetics Wiki, together with the necessary data files.




### Errors that shouldn't happen: a few package bugs in simulation functions 


Assembling the tutorial exposed a few more frustrations in the R packages.  Consider simulating OU with rTraitCont:


    
    
    ## Load the libraries, simulate a tree
    require(geiger)
    require(TreeSim)
    tree <- sim.bd.taxa(100,1,1,0)[[1]]
    ## This is OK
    >  x <- rTraitCont(tree, model="OU", sigma=1, alpha=.3, theta=0, root.value=0)
    > mean(x)
    [1] 0.3305515
    ## This is still OK
     x <- rTraitCont(tree, model="OU", sigma=1, alpha=3, theta=0, root.value=0)
    > mean(x)
    [1] 0.01494487
    ## This is OBVIOUSLY WRONG
    x <- rTraitCont(tree, model="OU", sigma=1, alpha=10, theta=0, root.value=0)
    mean(x)
    [1] -24.13565
    



What's happening?  rTraitCont numerically integrates:
[latex syntax="display"] x(t_2) = x(t_1) - \alpha (t_2-t_1)( x(t_1) - \theta) + \sigma (t_2-t_1) \epsilon [/latex]
Where t's are the times at each node and [latex syntax="inline"]\epsilon ~ N(0,1) [/latex]

The exact equation would be:
[latex syntax="display"] x(t_2) = x(t_1) e^{-\alpha \Delta t}+\theta(1-e^{-\alpha \Delta t}) + \frac{\sigma^2}{2\alpha}\left( 1 -e^{-2\alpha \Delta t} \right)  \epsilon. [/latex]

The approximation is fine as long as $ \alpha*(t_2-t_1) $ is small, which is why we get into trouble with large alpha.  While this isn't implemented, we can meanwhile turn sim.char into a OU simulation by rescaling the tree,

    
    
    > x <- sim.char(ouTree(tr,alpha=10), matrix(1), root=0)[,1,1]
    


though it doesn't let us allow the root and the optimum (theta) to differ.  

Another stumbling block I hit came from the way geiger does birth-death simulations:

    
    
    tr <- birthdeath.tree(b=1, d=0, taxa.stop=100)
    x <- sim.char(tr, matrix(1))[,1,1]
    fitContinuous(tr, x)
    
      Fitting  BM model:
      Error in solve.default(phyvcv) : 
        system is computationally singular: reciprocal condition number = 1.53896e-18
    


Which doesn't happen using the birth-death simulated tree instead.  The reason is that birthdeath.tree simulation creates a final pair of branches with zero length, while sim.bd.taxa method does not:

    
    
    > which(tr$edge.length==0)
    [1] 163 164
    > which(tree$edge.length==0)
    integer(0)
    





### Errors that should happen: simulations are not always what you would expect 


One theme I draw out in the tutorial is that expectations -- averages -- aren't everything.  Felsenstein's example is _expected_ to create an artificial correlation between two traits -- it's not guaranteed:  I start the students simulating data on this tree and testing for that correlation, though a substantial fraction won't find it.  




#### Can likelihood inform the data transform?




    
    
    > x <- exp(sim.char(tree, matrix(1))[,1,1])
    > bm <- fitContinuous(tree, x)
    Fitting  BM model:
    > bm_log <- fitContinuous(tree, log(x))
    Fitting  BM model:
    > bm_log[[1]]$aic
    [1] 269.2097
    > bm[[1]]$aic
    [1] 2137.334
    


Yup.  Why do we continue to look at whether there's a significant correlation between branch length and contrast?  Does not seem a substantial test of model adequacy.  We also don't tend to think of transforms as models.  

