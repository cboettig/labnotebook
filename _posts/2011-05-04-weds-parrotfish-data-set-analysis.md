---
comments: true
date: 2011-05-04 23:16:29
layout: post
slug: weds-parrotfish-data-set-analysis
title: 'Weds: Parrotfish data set analysis'
redirects: [/wordpress/archives/1578, /archives/1578]
categories:
- evolution
tags:
- notebook-technology
---

## Parrotfish





	
  * Need better convergence error handling.

	
  * Need to remedy: "Function cannot be evaluated at initial parameters" errors -- Occur when attempting very large values of alpha, resulting in NaN output (trouble with exponentials of alpha in calculations).

	
  * Changed summaries to group by painting, so compare models and traits.  Less natural than comparing across painting for a single trait since that allows comparisons both across models and across paintings, but makes sense when comparing only a single partition.

	
  * See code, [parrotfish.R](https://github.com/cboettig/wrightscape/blob/master/demos/parrotfish.R) & [parrotfish_data.R](https://github.com/cboettig/wrightscape/blob/master/demos/parrotfish_data.R) for details




## Chatter


Replying to various interesting questions from the lab groups today:



	
  * Chris O's question on body size evolution:

compare the correlation of two traits corrected for size and phylogeny using several methods (Blomberg et al. 2003, pic residuals, pgls residuals and Revell's method).

We have an evolving trait X.  The value of the trait is strongly  influenced by the evolution of another evolving trait, Y (size). Assume size Y depends on no other traits and follows Brownian motion: $ dY_t = \sigma_Y dB_t $
Assume trait X is also undergoing a random walk, but is also tugged  around in a linear fashion (with strength \beta) by the size Y: $ dX_t =  \beta Y_t + \sigma_X dB_t $ Trait X is then not doing a purely Brownian random walk, so we cannot apply any of the methods which assume that it is.

We could instead consider the general form of a model in which trait X evolves as a stochastic process, dependent on trait Y:

$$ dX = f(X, Y)dt + \Sigma dB_t $$

Trait Y also evolves,

$$ dY = f(X,Y) dt + \Sigma dB_t $$

Now  dB_t is a vector of two random walks and $ \Sigma $ is a matrix, with terms  $ \sigma_{x^2}, \sigma_{yx}, \sigma_{xy} $, and $ \sigma_{y^2}.$  The model above is a  special case of this.  This in general will not have a multivariate  normal distribution of traits.  We've run into this before: Peter asked  effectively the same question earlier this quarter: [http://www.carlboettiger.info/archives/151](../archives/151).  Answer: maybe ABC, since we cannot solve the likelihood but can simulate?
	
  * Lars has a question on power in this study: (Young _et. al._ 2011)

Hmm, Article compares "four" models, with interesting choice of attributions: BM (cites[ Brookstein 1987](http://paleobiol.geoscienceworld.org/cgi/content/abstract/13/4/446) instead of Felsenstein 1985?), BM with drift (Hunt _et. al._ 2008), "stasis" Sheets & Mitchell, 2001 (sounds like OU...), OU: Lande (Lande, 1976).  (Of course the study does not estimate power).


## Misc





	
  * [Algorithms group meeting](http://www.carlboettiger.info/archives/1595)

	
  * Google reader: catching up on journals -- done.




## Still to do





	
  * Theoretical ecology review

	
  * Review economic models in warning signals, (Horan _et. al._ 2011)

	
  * Outline research & organizational goals.

	
  * common tag library.

	
  * treebase api, socialR updates

	
  * think about [NSF's SI2](http://www.nsf.gov/funding/pgm_summ.jsp?pims_id=503489) ([dear colleague let](http://www.nsf.gov/pubs/2010/nsf10015/nsf10015.jsp)) ([NSF Org list)](http://nsf.gov/staff/orglist.jsp) ([Proposal Guide](http://www.nsf.gov/pubs/policydocs/pappguide/nsf11001/gpg_index.jsp))




## Lab Notebook configuration


Exploring a couple plugins and modifications of lab notebook and workflow.  Currently looking at tighter github integration.



	
  * [Github Code Viewer 2](http://wordpress.org/extend/plugins/github-code-viewer-2/): Could embed rather than link code by url, though a link may be preferable anyway.  Currently seems [broken](http://wordpress.org/support/topic/implode-error?replies=1#post-2095048).

	
  * [Github and bitbucket project lister](http://wordpress.org/extend/plugins/github-bitbucket-project-lister/): allows embedding public projects into posts and pages instead of just as a widget.  Lists name of project (with link), summary, and number of watchers.  Formatting configurable but has some trouble in display sizes.  Required tweaking to display in reasonable font sizes for this theme.

	
  * Several things just list links to repositories as widgets: Github Grubber, Github Projects, GitPress.  Projects doesn't list all repositories (and doesn't give an option to search).   Haven't found anything that gives impact or commits as seen on github dashboard. github_activity seems to error, Latest github commits does what it sounds like.  Won't keep any installed for the time being.

	
  * Of course I'm already using the popular github gists shortcode.




#### Github & Bitbucket Project Lister Example


{{github:cboettig}}

## References


- Young M, Bell M and Brusatte S (2011).
"Craniofacial Form And Function in Metriorhynchidae (Crocodylomorpha: Thalattosuchia): Modelling Phenotypic Evolution With Maximum-Likelihood Methods."
*Biology Letters*, **7**.
ISSN 1744-9561, <a href="http://dx.doi.org/10.1098/rsbl.2011.0357">http://dx.doi.org/10.1098/rsbl.2011.0357</a>.

- Hunt G, Bell M and Travis M (2008).
"Evolution Toward A New Adaptive Optimum: Phenotypic Evolution in A Fossil Stickleback Lineage."
*Evolution*, **62**.
ISSN 00143820, <a href="http://dx.doi.org/10.1111/j.1558-5646.2007.00310.x">http://dx.doi.org/10.1111/j.1558-5646.2007.00310.x</a>.

- Lande R (1976).
"Natural Selection And Random Genetic Drift in Phenotypic Evolution."
*Evolution*, **30**.
ISSN 00143820, <a href="http://dx.doi.org/10.2307/2407703">http://dx.doi.org/10.2307/2407703</a>.

- Horan R, Fenichel E, Drury K and Lodge D (2011).
"Managing Ecological Thresholds in Coupled Environmental-Human Systems."
*Proceedings of The National Academy of Sciences*, **108**.
ISSN 0027-8424, <a href="http://dx.doi.org/10.1073/pnas.1005431108">http://dx.doi.org/10.1073/pnas.1005431108</a>.



-  Unknown, H. David Sheets, Charles E. Mitchell,  (2001) *Genetica*, **112/113**    [10.1023/A:1013308409951](http://dx.doi.org/10.1023/A:1013308409951)
