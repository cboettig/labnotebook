---
comments: true
date: 2011-10-07 14:36:33
layout: post
title: Matt Helmus visit
categories:
- evolution
tags: 
- seminar
---

## Notes from presentation

### 1. Species-area curve:

* Species sorting by environment.
* species clustering due to limited dispersal
* Random displacement (faster saturation)
* In-situ speciation looks like clustering
* Compare to colonization
* Phylogenetic species variability metric: compare phylogenetic covariance matrix to a star-phylogeny, not expected to increase with area.

$$ \frac{n \textrm{tr}C - \sum C }{n(n-1)}$$

### 2.  Simulations:

  1. species sort along an environmental gradient. BM trait determining position.  : closely related species clustered. Similar species are clustered.
  2. limited dispersal. BM trait for dispersal.  Closely related species are not clustered.
  3. random placement, proportional to abundance. Phylogeny proportional to abundance. no clustering.

- hmm, limited dispersal isn't same as dispersal evolving.  differing in size
- have individual placement
- species-area curve is very poor measure of clustering?
- phylomatic tree.  yikes.
- decreasing phylo diversity with area.  phylogenetic repulsion

### 3. macroevolution simulation

  * each island assigned an extinction probability, exp decrease with is. area.
  * in situ speciation vs colonization probability
  * More in situ speciation generates more clustering, as expected.
  * phylo diversity vs area: no relationship.  (Obviously colonizations make large diversity)
  * ecologically neutral.  island diversity
  * colonization and in situ speciation events not area dependent

#### Anoles example

####  Notes from tutorial


- Overview of linear mixed models, generalized lmm, phylogenetic glmm.
- Random effects with phylogenetic correlations.
- consider a phylogeny with trait as prevelance, overdispersed.
