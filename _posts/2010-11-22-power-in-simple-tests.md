---
comments: true
date: 2010-11-22 08:00:33
layout: post
slug: power-in-simple-tests
title: Power in simple tests
redirects: [/wordpress/archives/409, /archives/409]
categories:
- evolution
---

Exploring power in simple tree models. With the smaller tree from the _geospiza _dataset, (14 tips, left) is less than yesterday's in the _bimaculus Anoles_ (with 23 tips, right)

![]( http://farm5.staticflickr.com/4086/5196757723_3c7540af8e_o.png )


![]( http://farm5.staticflickr.com/4151/5197061110_d98d0e4ebe_o.png )


([code](https://github.com/cboettig/Comparative-Phylogenetics/commit/2e5c5d2b5c412550c75689d426bcdeb9a3274445#diff-1))

Also wrote the [OUCH-based wrapper function ](https://github.com/cboettig/Comparative-Phylogenetics/commit/2e5c5d2b5c412550c75689d426bcdeb9a3274445#diff-0)to fit tree transformation parameters.  Unfortunately it currently transforms from ape to ouch format repeatedly (in order to use ape's tree transforms, need to write native ouch-format transforms), so it may not be any faster.

Ok, all for tonight, continue from here tomorrow.


### Large, Simulated Trees


Interested in comparing these power curves to much larger trees.  Note already above that the 14 taxa _geospiza_ tree never gets above a power of 0.80, meaning that even in the most dramatic example of no phylogenetic signal will not be detected 20% of the time.  This asymmetric comparison isn't strictly necessary, we could ask about the power in the reverse test.

The larger simulated trees are much slower, machine chugging away at them now. Really needs a more thorough optimization or ouch port for tree transforms._** ****Two**__** days later..**_ The power curve on the much larger trees completed (on zero).  Has basically perfect power (at 95% confidence) any lambda up to 0.95:

![]( http://farm5.staticflickr.com/4127/5205838636_73b41eba30_o.png )


Complete distributions for each of the data points shown here:

[flickr-gallery mode="tag" tags="largetreepowerlambda" tag_mode="all"]

[Code in simtree_example.R](https://github.com/cboettig/Comparative-Phylogenetics/blob/e1e48e7bcb197ce0faed287a6835be9808805f93/pmc/demos/simtree_example.R)
