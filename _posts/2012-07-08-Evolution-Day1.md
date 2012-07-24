---
layout: post
title: Evolution 2012 Conference, Day 1
tags: [conferences, evolution]
category: evolution

---

Fantastic first day at Evolution.  Spent the morning in the SSB Sympossium organized by Jeremy Brown, "Predictive approaches for assessing the fit of evolutionary models".  Really covered both methods assessing model fit (posterior predictive simulations) and approximate likelihood approaches, which are also simulation-based.  Then the afternoon in the second SSB Symposium on emerging methods for comparative phylogenetics, organized by Liam Revell and Cecile Ane, which included my talk.  Lots of great talks, but Cecile's was perhaps the most striking results I saw presented all day.  

### Detecting evolutionary regime shifts with comparative phylogenetics 

(my slides)

<div style="width:425px" id="__ss_13576088"> <strong style="display:block;margin:12px 0 4px"><a href="http://www.slideshare.net/cboettig/evolution-13576088" title="Evolution" target="_blank">Evolution</a></strong> <iframe src="http://www.slideshare.net/slideshow/embed_code/13576088" width="425" height="355" frameborder="0" marginwidth="0" marginheight="0" scrolling="no" style="border:1px solid #CCC;border-width:1px 1px 0" allowfullscreen></iframe> <div style="padding:5px 0 12px"> View more presentations from <a href="http://www.slideshare.net/cboettig" target="_blank">Carl Boettiger</a> </div> </div>

### Notes and links from my talk

* [Download OUwie](cran.r-project.org/web/packages/OUwie/index.html) for estimating regime shift models in any parameters (on CRAN).
* [Download pmc](http://cran.r-project.org/web/packages/pmc/index.html) for phylogenetic monte carlo to evaluate model fit.  
* [Open lab notebook entries](http://www.carlboettiger.info/wordpress/archives/category/phylogenetics) Covers the four projects I discussed (release of constraint/OUwie, phylogenetic informativeness (pmc) and data access (rfishbase/treebase) over the past two years.  


Notes pulled from twitter, in reverse-chronological order.

### SSB Symposium on comparative phylogenetic methods

* .@omearabrian shows awesome visual of code for TreEvo ABC package evolving using gource: http://t.co/wAdUyhTg #git #evol2012
* Exciting possibilities, but the heuristic nature of the ABC is scary.  Where are the convergence theorems? More sims please? #evol2012
* @lukejharmon @hyposlar my intuition is that the lamba est isn't reliable?  Would love to hear Cecile on  microergodicity of lambda #evol2012
* Love that @omearabrian writes eqns out on slides in #rstats form instead of greek math! #evol2012
* Now @omearabrian tells us: we're too slow at coming up w/ new models, &amp; the new ones are basically the same as old! Very true! #evol2012
* Liam demonstrates essential role of simulations in knowing how our methods behave under real data #evol2012 #ironicbuttrue
* Liam shows sigma upward bias to topo error, Blomberg's K falls, lambda unclear, phylo reg unbiased (Rolph2006) model selct more OU #evol2012
* RT @k8hert Excited about @cboettig's discussion of @rOpenSci. Open science, data, and synthesis are my fav topics! http://t.co/dRBOFkil
* Excited to see Liam Revell finally take us beyond that onerous "First, assume the phylogeny &amp; data are known without error..." #evol2012
* @phylorich @k8hert perhaps a pure birth model, haven't attempted a fit ;-)
* Lars Schmitz introduces the phylo comparative method he used to identify which dinosaurs were nocturnal #evol2012 in http://t.co/j2t4hSj8
* Note that room could hold &gt;2000... RT @lukejharmon First time in a while: room for all at Felsenstein's talk #evol2012
* @daisieclickie @conrbrien yup, http://t.co/Xekyy8F0 has the eff sample size / non-microergodic root for BM.  Think the OU one isn't out?
* @k8hert thanks! Wish Cecile's paper with Ho on the OU microergodic was out, seems to be in review still...
* Joe Felsenstein presents integrating fossils into the tree in his grand old style: nice diagrams &amp;  clean math "you know &amp; love" #evol2012
* BM:  microergodic: sigma, not X0. OU: microergodic: yes: sigma, sometimes: alpha (dep on topology), not: theta. #evol2012. #crypticbutkey
* Cecile's effective sample size paper (why you'll never get root states w/o fossils) http://t.co/Xekyy8F0 #evol2012
* Cecile introduces microergodicity: "identifiability" as tree size -&gt; infty, do pars converge?  (Larger tree != more indep samples) #evol2012
* Cecile highlights the statistical dangers of phylogenetic methods, whose data violate expectations #evol2012 #breakingclassicaltheory
* Cecile Ane sums up the radiation of comparative methods "take your fav statistical approach and stick phylogenetic in front" #evol2012

### SSB Symposium on predictive simulation methods

* I'll be speaking on detecting evolutionary regime shifts in the SSB on phylo methods at 3:15p in rm Canada 2-3 #evol2012
* SSE education symposium on timely issue: data access &amp; scientific societies #evol2012, Tom Meagher.  Repos good for research; good for edu
* Impressed that http://t.co/Gqj2i3Wi gets students to submit structured data to repo. We can't do that with most researchers #evol2012
* Mark Beaumont on hierarchical models by an iterated vers of approx Bayes (ABC) #evol2012. Exciting, but are these sufficient stats?
* How about just "might"? RT @lukejharmon Graham Slater just edited the title of my paper during his talk #Evol2012.
* Graham shows max lik inference on early burst evolution fails when faced with even a few outliers.  Uses weights to avoid. #evol2012
* Graham Slater shows importance of fossils in detecting early burst evolution #evol2012 by mle, disparity through time &amp; node-height test
* Try out @jembrown method for posterior predictive assessment of phylogeny now in AMP: http://t.co/co8Lo5qp #evol2012
* .@jembrown discusses entropy stats &amp; distance matrix distributions from post. simulation to identify how good our tree inference is.
* .@jembrown gives fantastic intro to posterior predictive seminar for #evol2012, addressing approx likelihood + model fit, 2 key issues.



