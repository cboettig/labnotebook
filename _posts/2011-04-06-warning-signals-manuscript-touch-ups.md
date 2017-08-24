---
comments: true
date: 2011-04-06 17:27:42
layout: post
slug: warning-signals-manuscript-touch-ups
title: Warning Signals - Manuscript touch-ups
redirects: [/wordpress/archives/1362, /archives/1362]
categories:
- ecology
tags:
- warning-signals
---

[toc]


## Refining examples





	
  * Updating finished runs to full formats

	
  * Condensing/organizing code examples under the demos to follow the structure of the paper.

	
  * Currently plotting code for manuscript loads a menagerie of different run results from different files.  Would be better to consolidate by dataset.




## Proposed figure changes





	
  * Consider multiple empirical examples in main text

	
  * Consider removing skew/kurtosis examples to the supplement?

	
  * Consider other empirical examples

	
  * Additional examples to the supplementary information, at least of a case where likelihood also has inadequate power

	
  * Consider a low-sample size version of ibm simulation

	
  * Consider replacing the linearized simulation with the ibm simulation




## Figure formatting guidelines (submission stage):





	
  * Preferred format is jpeg, 150 dpi

	
  * figures rendered in the size they appear in the manuscript (single column is 89mm, double column width is 183 mm)

	
  * follow naming convention Boettiger_fig1.jpg, etc

	
  * ... Getting images adjusted for small size -- that took a while, see[ git commit](https://github.com/cboettig/structured-populations/commit/e1c77f9f8c7d46626451ec6e94a3ea3eba3f7327).

	
  * shrink ticks, move text, set axis intervals.

	
  * All figures set to single column width, decide if any should be double-column?  (doesn't seem typical).




## Revisions and Edits





	
  * Incorporated Marcel's edits.

	
  * Awaiting Marissa's edits.

	
  * Just sent to Alex for edits this morning, back this afternoon.

	
  * Incorporating Alex's edits now.

	
  * Reviewed** cover letter **with Alan, adding details about figures, word counts, etc. awaiting comments on my revisions.




## Further Examples





	
  * drake reanalyze figure3 failed (nice 16 on zero) due to labeling error in plotting function (after all computations finished but no data save -- highlighting the need for checkpointing my code!)

	
  * Rerunning at nice 19 on zero 16 reps, [Completed](http://www.flickr.com/photos/cboettig/5596172988/)

	
  * and at nice 18 the full 2000 replicates on zero.

	
  * ibm_likelihood.R terminated(?) Running at 80 replicates at nice 17 on zero


