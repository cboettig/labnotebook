---
comments: true
date: 2011-04-29 22:19:43
layout: post
slug: friday-notes-on-labrids-notes-on-transforms-and-size-corrections
title: 'Friday: Notes on Labrids, notes on Transforms and size-corrections'
redirects: [/wordpress/archives/1534, /archives/1534]
categories:
- evolution
---

The specific traits were:

Oral Jaw traits



	
  1. mouth-closing lever ratio (Close),

	
  2. mouth-opening lever ratio (Open), kinematic

	
  3. transmission coefficient of the oral jaws four-bar linkage (Jaw KT),

	
  4. adductor mandibulae (AM) muscle mass,

	
  5. premaxillary protrusion distance (Prot),

	
  6. gape width (Gape),


Exterior to the Oral Jaws, not expected to become unconstrained:

	
  * levator posterior (LP) muscle mass: (Pharyngeal jaw muscle)

	
  * sterno-hyoideus (SH) muscle mass, (Primarily buccual cavity)

	
  * adult body mass (Body mass).


See (WAINWRIGHT _et. al._ 2004).

Species: 122 in dataset (34 parrotfish, 88 wrasses)

Species in phylogeny: 34 parrotfish. 80 wrasses.  Hmm, my phylogeny is missing 8 wrasses.


## Transforms


In (Price _et. al._ 2010), all linear lengths are log-transformed, masses are log transformed after cube-root transform.  Why: An assumption of linear growth with percent, combined with an allometry that makes all linear dimensions increase together (hence mass increases by the cube of any increase in a length).  Should evolution really preserve such an allometry? Does the cube root matter, since it's just a multiplicative scaling constant once we are in log space?

What about the lever ratios?  assume they are untransformed?  Also uncorrected for mass?

These log-transformed traits are then used to compute contrasts.  Contrasts are regressed through the origin against body-mass. This regression is then used to get residuals of the log-traits, and these residuals are modeled as BM or OU, etc.

Size-correction can seem rather challenging.  Of course evolution of different traits (rates of evolution, shifts, etc) are correlated, and as most traits couple strongly to size and size explains a great deal of disparity, lack of size-corrections risk data that appears to be, say, showing shifts in rate of jaw evolution when it instead shows shifts in the rate of body-size evolution.  Hence the need for size correction.

A common though non-ideal method is a linear regression of log-trait values against log-size.  This regression assumes that you have a bunch of measurements of (tooth size, body size) which are independent of each other.  Because of the phylogeny, you don't (the classic Felsenstein 1985 situation).  The standard approach leaves you with independent contrasts, not the traits themselves.  Recall that we just want to do the regression correctly, we weren't ready to remove the effect of phylogeny, since we're still gearing up to do a comparative method .

Revell takes great care to address this issue, (Revell, 2009) demonstrating how we get corrected values of the traits themselves, rather than being left with contrasts.


> Types of analyses that might require transformed values for tip species include (but are not limited to): the estimation of phylogenetic signal (Freckleton et al. 2002; Blomberg et al. 2003); ancestral state reconstruction (Schluter et al. 1997); the phylogenetic analysis of variance (ANOVA) or analysis of covariance (ANCOVA) (Garland et al. 1993); and phylogenetic regression in which both slope and intercept (or prediction in the species space) are of concern (Rohlf 2001).


Getting the size-correction using the phylogeny does not mean that we are done with the phylogeny -- the size-corrected values trait still have phylogenetic correlations, this just means we did the linear regression correctly in order to size correct in the first place, which as Revell cites, may not be the right way to size correct anyway, see Garcia_Berthou (2001), Freckleton(2002, 2009).

This attempts to correct for body-mass in a phylogenetic manner -- under the assumptions:

(a) There is a linear relationship between body mass and other traits $ \frac{1}{3}\log(\text{body mass}) \sim \beta \log(\text{length})$

(b) Though the relationship comes from a functional constraint, samples from a phylogeny aren't independent -- giving us a false representation of power.

At this stage we aren't trying to create independent samples of the functional process that connects to traits.  We just want to identify what quantity we hypothesize follows our evolutionary model of little steps.  We can convincingly argue that it isn't the length -- we think of growth by percent increases -- a mutation equally likely to increase or decrease the length by 1%, say, rather than by 1cm.  Logs do this for us.

Unfortunately it seems difficult to argue that residuals have this same natural interpretation, particularly when we would like to insist that both the traits and the residuals follow one of the common models (i.e. Brownian motion).

Assume the focal trait _X_ and the body size _Y_ are Brownian, in order to justify the Brownian-based phylogenetic Revell collection.  The residuals  _Z_ are differences between these:

$$ dX_t = \sigma_{X} dB_{1} $$
$$ dY_t = \sigma_{Y} dB_{2} $$

The solutions to these are Gaussians, unfortunately the regression $$\beta$$ doesn't result in residuals that are also Gaussians,

$$ Z_t = X_t - \beta Y_t $$
$$ Z_t = N(\sigma_X) - \beta N(\sigma_Y) $$

which is not normally distributed (sums of normals aren't normals).  (Note that this differs from the standard regression in which there is only one source of noise, $ y ~ \beta x + \xi $).  The same is true for any of the common phylogenetic models, which are all multivariate normal distributions.

It seems impossible to do the phylogenetic correction of (Revell, 2009) consistently.  One could instead assert that the ratio of some size to body-size is, say, Brownian, without asserting that the individual traits are Brownian, and have a perhaps more consistent size correction.


## References


- WAINWRIGHT P, BELLWOOD D, WESTNEAT M, GRUBICH J and HOEY A (2004).
"A Functional Morphospace For The Skull of Labrid Fishes: Patterns of Diversity in A Complex Biomechanical System."
*Biological Journal of The Linnean Society*, **82**.
<a href="http://dx.doi.org/10.1111/j.1095-8312.2004.00313.x">http://dx.doi.org/10.1111/j.1095-8312.2004.00313.x</a>.

- Price S, Wainwright P, Bellwood D, Kazancioglu E, Collar D and Near T (2010).
"Functional Innovations And Morphological Diversification in Parrotfish."
*Evolution*.
<a href="http://dx.doi.org/10.1111/j.1558-5646.2010.01036.x">http://dx.doi.org/10.1111/j.1558-5646.2010.01036.x</a>.

- Revell L (2009).
"Size-Correction And Principal Components For Interspecific Comparative Studies."
*Evolution*, **63**.
ISSN 00143820, <a href="http://dx.doi.org/10.1111/j.1558-5646.2009.00804.x">http://dx.doi.org/10.1111/j.1558-5646.2009.00804.x</a>.
