---
comments: true
date: 2012-03-22 18:19:17
layout: post
slug: robust-control-uncertainty-reading-notes
title: Robust control & uncertainty - reading notes
redirects: [/wordpress/archives/4345, /archives/4345]
categories:
- ecology
tags:
- reading
---

Ecologists/TREE (Fischer _et. al._ 2009), (Polasky _et. al._ 2011)  give a nice overview/introduction to the problem.  Perhaps most interestingly, both set up resilience approaches as a foil or alternate approach in contrast to a decision-theoretic problem. Fischer's group does a particularly nice job handling the case that these two are separate approaches -- it's easy to dismiss resilience thinking as fuzzy optimization of fuzzy objective functions.

The Polasky piece does a nice job refocusing us on the obvious but brushed-over question of the objective function.  Without explicit probabilities on outcomes, we switch immediately to approaches like maximin, which their simple example does a much better job calling attention to the weakness of such assumptions that do the richer examples usually formulated (below).

Entertainingly, max-min goes back to von Neumann's proof of the theorem in two player games, while in the case of uncertainty "Nature" or "chance" takes the role of the other player -- not knowing how they will play, you seek a strategy that maximizes the minimum payoff you will receive. Clearly this is invented in a discrete world with limited outcomes and options -- for most realistic problems there must always be some probability of no payoff, regardless of strategy, and you must be doing a maximin conditional on the really unlikely things not happening (hit by asteroid, sudden collapse of your fishery, etc).

Their critique of decision theory focuses only on the fact that it requires probabilities of outcomes, which in practice won't be known, or at least knowledge of possible states, in the case of maximin.  The first is critique is quite just, which is as they say, the reason for maximin approaches.  These probably founder more on their choice of objective function than their inability to enumerate possible states.  Surprisingly they make no mention of computational complexity, which is probably in practice the more common limitation.



### Info Gap Theory


Reading (Regan _et. al._ 2005), sounds like a sensitivity analysis on the uncertainty parameter. Authors refer to this as "info-gap theory," though it's not particularly different.  (While sensitivity analysis would do this parametrically using, say, the width of the distribution about a parameter), this rather more crudely it seems, just varies the best-estimate value of the parameter until the decision changes.

Whoops (reading more), apparently it's a thing (i.e. gets it's own [wikipedia page](http://en.wikipedia.org/wiki/Info-gap_decision_theory), also appearing in the literature without Dr. Ben-Haim, Nicholson & Possingham, 2007 (Halpern _et. al._ 2006)) though this still seems to [support](http://en.wikipedia.org/wiki/Info-gap_decision_theory#Alternatives) my characterization (the second author of the Eco Apps paper seems to be behind the term). Info-gap can also be framed as a Max Min approach.

Whoops again, [apparently it's a controversy too](http://info-gap.moshe-online.com/), (as mentioned in the Fischer piece).
Nicholson & Possingham, 2007 Gives a rather nice list of papers that in single-species analyses have found ranking of management options to be robust to uncertainty and others where it is not (hardly surprising, but nice to have concrete examples).  Takes a simple info-gap approach to the multi-species case.



### More rigorous maximin approaches


Bill Brock's work in this area is particularly nice.  Cute proper technical example of model uncertainty in Hansen's recursive max/min expected utility (Brock & Xepapadeas, 2010).  Hansen's treatment on these is dense (below), but not at all clear that this is what we want to be optimizing.  See mathematical economics treatment of model uncertainty & misspecification in (Hansen & Sargent, 2001), (Hansen _et. al._ 2006)

Brock also has a beautiful simple paper pointing out how uncertainties lead to conflicting conclusions , such as the debate over the fisheries collapse.  (Biggs _et. al._ 2009)
Also has a nice example in Peterson _et. al._ 2003 of an apparently optimally managed system collapsing.  Applies a passive adaptive management solution learning about a choice between two given models (with fixed parameters), one which describes the system around the eutrophic stable state, the other around the oligotrophic.Note the actual dynamics cannot be represented as a sum of these beliefs, so this approach is doomed and the result is hardly surprising mathematically, which kinda makes it all the more clever as an example.

(Brozović & Schlenker, 2011) is probably a richer example of an optimally managed system failing under uncertainty.  Shows the outcome can be very sensitive to assumptions about uncertainty in systems with alternative stable states; a nice example to further the point of  (Biggs _et. al._ 2009).  Shows with moderate uncertainty a precautionary behavior, while more severe uncertainty it precaution isn't worth it, since it cannot diminish the risk adequately.  

(Meir _et. al._ 2004) Which seems to give  rise to the Possingham position on giving only rules of thumb from decision theoretic models.  Comes the closest to implementation uncertainty, considering the case in which a policy cannot be implemented immediately as it is formed.  This is really a red herring -- if implementation takes place over time, in principle that problem should be framed in the dynamic optimization.  The real bugbear here is not implementation uncertainty per se, but the fact that dynamic solutions (SDP) are not computationally feasible, so they test rules-of-thumb against the optimum for a small problem, in hopes that the extrapolation is valid.  The rules of thumb are "more effective" than a static solution; the optimal dynamic solution being unfeasible. It seems we'd be on firmer ground using small problems to provide counterexamples of when simple rules fail, than to use the lack of counterexample in a particular case as grounds for extrapolating.

## References


- Fischer J, Peterson G, Gardner T, Gordon L, Fazey I, Elmqvist T, Felton A, Folke C and Dovers S (2009).
"Integrating Resilience Thinking And Optimisation For Conservation."
*Trends in Ecology &amp; Evolution*, **24**.
ISSN 01695347, <a href="http://dx.doi.org/10.1016/j.tree.2009.03.020">http://dx.doi.org/10.1016/j.tree.2009.03.020</a>.

- Polasky S, Carpenter S, Folke C and Keeler B (2011).
"Decision-Making Under Great Uncertainty: Environmental Management in an Era of Global Change."
*Trends in Ecology &amp; Evolution*, **26**.
ISSN 01695347, <a href="http://dx.doi.org/10.1016/j.tree.2011.04.007">http://dx.doi.org/10.1016/j.tree.2011.04.007</a>.

- Regan H, Ben-Haim Y, Langford B, Wilson W, Lundberg P, Andelman S and Burgman M (2005).
"Robust Decision-Making Under Severe Uncertainty For Conservation Management."
*Ecological Applications*, **15**.
ISSN 1051-0761, <a href="http://dx.doi.org/10.1890/03-5419">http://dx.doi.org/10.1890/03-5419</a>.

- Halpern B, Regan H, Possingham H and McCarthy M (2006).
"Accounting For Uncertainty in Marine Reserve Design."
*Ecology Letters*, **9**.
ISSN 1461-023X, <a href="http://dx.doi.org/10.1111/j.1461-0248.2005.00827.x">http://dx.doi.org/10.1111/j.1461-0248.2005.00827.x</a>.

- Brock W and Xepapadeas A (2010).
"Robust Control And Hot Spots in Dynamic Spatially Interconnected Systems."
*Ssrn Electronic Journal*.
<a href="http://dx.doi.org/10.2139/ssrn.1736486">http://dx.doi.org/10.2139/ssrn.1736486</a>.

- Hansen L and Sargent T (2001).
"Robust Control And Model Uncertainty."
*American Economic Review*, **91**.
ISSN 0002-8282, <a href="http://dx.doi.org/10.1257/aer.91.2.60">http://dx.doi.org/10.1257/aer.91.2.60</a>.

- Hansen L, Sargent T, Turmuhambetova G and Williams N (2006).
"Robust Control And Model Misspecification."
*Journal of Economic Theory*, **128**.
ISSN 00220531, <a href="http://dx.doi.org/10.1016/j.jet.2004.12.006">http://dx.doi.org/10.1016/j.jet.2004.12.006</a>.

- Biggs R, Carpenter S and Brock W (2009).
"Spurious Certainty: How Ignoring Measurement Error And Environmental Heterogeneity May Contribute to Environmental Controversies."
*Bioscience*, **59**.
ISSN 0006-3568, <a href="http://dx.doi.org/10.1525/bio.2009.59.1.10">http://dx.doi.org/10.1525/bio.2009.59.1.10</a>.

- Brozović N and Schlenker W (2011).
"Optimal Management of an Ecosystem With an Unknown Threshold."
*Ecological Economics*, **70**.
ISSN 09218009, <a href="http://dx.doi.org/10.1016/j.ecolecon.2010.10.001">http://dx.doi.org/10.1016/j.ecolecon.2010.10.001</a>.

- Meir E, Andelman S and Possingham H (2004).
"Does Conservation Planning Matter in A Dynamic And Uncertain World?"
*Ecology Letters*, **7**.
ISSN 1461-023X, <a href="http://dx.doi.org/10.1111/j.1461-0248.2004.00624.x">http://dx.doi.org/10.1111/j.1461-0248.2004.00624.x</a>.



-  Making Conservation Decisions Under Uncertainty For The Persistence of Multiple Species, Emily Nicholson, Hugh P. Possingham,  (2007) *Ecological Applications*, **17**    [10.1890/1051-0761(2007)017[0251:MCDUUF]2.0.CO;2](http://dx.doi.org/10.1890/1051-0761(2007)017[0251:MCDUUF]2.0.CO;2)
-  Uncertainty And The Management of Multistate Ecosystems: an Apparently Rational Route to Collapse, G. D. Peterson, S. R. Carpenter, W. A. Brock,  (2003) *Ecology*, **84**    [10.1890/0012-9658(2003)084[1403:UATMOM]2.0.CO;2](http://dx.doi.org/10.1890/0012-9658(2003)084[1403:UATMOM]2.0.CO;2)
