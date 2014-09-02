---
comments: true
date: 2011-03-15 13:07:13
layout: post
slug: models-in-phylogenetic-inference
title: Model identifiability in phylogenetic inference GTR+I+G
redirects: [/wordpress/archives/1197, /archives/1197]
categories:
- evolution
---

Another phylogenetics paper (Perelman _et. al._ 2011) using GTR+I+G inspired me to look back over the discussion and objections with this model.  This model is the basis of 100s of publications, 40 alone in Sys Bio in 2006(Allman _et. al._ 2008).  There's a decent [discussion on Dechronization](http://treethinkers.blogspot.com/2009/04/when-we-fail-mrbayes.html) about the issue.  There's some treatment of identifiability on this issue, such as 2001 Sys Bio (Rogers, 2001) which suggests this is possible and a nice paper in Adv. Applied Prob (Allman _et. al._ 2008) that critiques this "proof" and provides one of the few proofs of any model being identifable: GTR+G.  Despite their critique of the earlier proof, Elizabeth, Cecile and John take the position that the claim may well be true, but the proof is not as trivial as Rogers suggests.


> Furthermore, bridging either of the gaps in [11] is not a trivial matter.  Though we suspect that Rogers' statement of identifiability is correct, at least for generic parameters, we have not been able to establish it by his method




The strange thing about having a proportion of invariant sites (I) along with Gamma-distributed among site rate variation (G) mostly seems to come from the potential for poor convergence behavior in MCMC routine, since much the same fit could be provided by increasing the number of invariant sites as tightening the gamma distribution.  From :


> The first gap is in the use of an unjustified claim concerning graphs of the sort exemplified by Figure 3 of that paper. As this claim plays a crucial role in the entire argument, the statement above remains unproven.  The second gap, though less sweeping in its impact, is still significant. As-suming the unjustified graphical claim mentioned above could be proved, the argument of [11] still uses an assumption that the eigenvalues of the GTR rate matrix be distinct. While this is true for generic GTR parameters, there are exceptions, including the well-known Jukes-Cantor and Kimura 2-parameter models [4]. Without substantial additional arguments, the reasoning given in [11] cannot prove identifiability in all cases.




The first claim referred to is between two distributions of I+$ \Gamma $ with $ \mu \neq \nu $ appearing graphically distinct.

## References


- Perelman P, Johnson W, Roos C, Seuánez H, Horvath J, Moreira M, Kessing B, Pontius J, Roelke M, Rumpler Y, Schneider M, Silva A, O'Brien S, Pecon-Slattery J and Brosius J (2011).
"A Molecular Phylogeny of Living Primates."
*Plos Genetics*, **7**.
<a href="http://dx.doi.org/10.1371/journal.pgen.1001342">http://dx.doi.org/10.1371/journal.pgen.1001342</a>.

- Allman E, Ané C and Rhodes J (2008).
"Identifiability of A Markovian Model of Molecular Evolution With Gamma-Distributed Rates."
*Advances in Applied Probability*, **40**.
ISSN 0001-8678, <a href="http://dx.doi.org/10.1239/aap/1208358894">http://dx.doi.org/10.1239/aap/1208358894</a>.

- Rogers J (2001).
"Maximum Likelihood Estimation of Phylogenetic Trees is Consistent When Substitution Rates Vary According to The Invariable Sites Plus Gamma Distribution."
*Systematic Biology*, **50**.
ISSN 1063-5157, <a href="http://dx.doi.org/10.1080/106351501753328839">http://dx.doi.org/10.1080/106351501753328839</a>.
