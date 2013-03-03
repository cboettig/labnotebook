---
comments: true
date: 2011-07-27 22:38:55
layout: post
slug: weds-manuscript
title: 'Weds: Manuscript'
categories:
- ecology
tags:
- warning-signals
- delayed-release
---

I've removed the model choice/model adequacy section of the appendix. This is the section that Reviewer 2 said needed further development, which would be beyond the scope of this paper:


> Here the authors claim that by using particular structural models based on assumptions about underlying dynamics their method makes it easy to identify cases that do not conform to the assumptions. It would be interesting to evaluate this claim but it would require a substantial amount of analysis that may be beyond the scope of a short paper. Alternatively the claim could be tempered.


I tend to agree, explaining how to do this properly really is beyond the scope, so I pulled that section (Appendix H) out. Reviewer 2 also had some comments about systems with other complicated dynamics, such as alternatively approaching, moving away, and then approaching the critical point. This section was mentioned in the second-to-last paragraph of the main text. I've updated that paragraph to read:


> Not all sudden collapses correspond to our model assumptions, including dynamical systems where the variance actually decreases as a sudden shift approaches (24, 25)⁠. While further development may make some of these systems amiable to detection (SOM, Appendix C), certain systems may collapse without any warning (26)⁠. Including measurement error and focusing on such different classes of dynamics are other complications we do not address at this time.


I'm a bit worried that this sounds too negative? (26 is clearly your Ecol Let paper).

A few other questions. Figure 2 shows the stable system, to make the point that it can look like a false alarm. I have the ROC curves for this system that correspond to Figure 3 and 4. Since it's stable, those curves always lie on the 1:1 line, for all methods, since there's nothing to detect. Should I include them in Figure 3 & 4?

I don't show the parameter distributions for individual models. I don't discuss whether the fit is constrained to strictly deteriorating systems vs stable systems (in principle you could allow for a system that is increasing in stability using the same model but changing parameter bounds). Guess I should add this into the appendix.

Figure 1 may need revisions.  Sebastian suggests showing how ROC curve changes when the distributions are closer together.  This could also perhaps benefit from an animation.


