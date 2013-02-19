---
layout: post
tags: [adaptive-dynamics, Primates, warning-signals, tribolium, code-tricks]
categories: [ecology]
title: Annual Progress Report
---






 





\




Tomorrow will be meeting with my dissertation committee: Alan Hastings,
Peter Wainwright, and Brian Moore. This provides a good opportunity to
summarize the status of my current projects and my principle
accomplishments for the year. Will try a tex'd document as I've done in
previous years but here's for some preliminary brainstorming.

-   Summary: In the past year, I've published one paper, given 4 talks
    (CPB, NIMBioS, Berkeley, IIASA), read 144+ articles and wrote 9000+
    lines of code. I spent last summer at IIASA, passed my qualifying
    exam in January, and attended the Bodega Phylogenetics workshop in
    March. I'm working primarily on four projects. If my thesis had a
    unifying title, it would be something like: ***Inference in a noisy
    world***

### Evolution

#### Adaptive Dynamics

-   Publication: [*Fluctuation Domains in Adaptive
    Evolution*](http://hdl.handle.net/10.1016/j.tpb.2009.10.003 "doi:10.1016/j.tpb.2009.10.003")
    appeared in TPB Feburary.
-   Finishing research from last summer at IIASA on predicting *The
    Waiting Time Until Evolution Branching* occurs. Manuscript by end of
    summer?
-   [Adaptive Dynamics
    code](http://github.com/cboettig/AdaptiveDynamics "http://github.com/cboettig/AdaptiveDynamics")
    project.

#### Comparative Phylogenetics

-   Labrid fin morphology paper
-   Quantifying the information in phylogenetic trees: robust model
    choice in comparative phylogenetics
-   logarithms and Brownian motion
-   Joint-probability solution?
-   [Collection](http://phylogenetics.uservoice.com/forums/43843-general?lang=en&utm_campaign=Widgets&utm_content=tab-widget&utm_medium=widget&utm_source=phylogenetics.uservoice.com "http://phylogenetics.uservoice.com/forums/43843-general?lang=en&utm_campaign=Widgets&utm_content=tab-widget&utm_medium=widget&utm_source=phylogenetics.uservoice.com")
    of smaller extensions to phylogenetic methods
-   Apply comparative methods in Primate brain morphology (with Daniel
    Mietchen)
-   Density dependence/equilibrium models in speciation rates. Model
    uncertainty in rates.

### Ecology

#### Early Warning Signals

-   Misleading signals and more robust approaches.

#### Structured Population Dynamics (aka beetles)

-   Large effects of demographic noise through nonlinear dynamics in
    structured populations

\

### Talks & Conferences

-   Talks to: CPB (Davis), NIMBioS (Tennessee), Comp Bio students
    (Berkeley)
-   in-house talks to EDG (Fall & Spring), Hastings lab,
-   Courses: Anoles. Begun Monte Carlo. Phylogenetics Discussion Group
    (winter/spring).
-   Bodega Phylogenetics Workshop.
-   Lab group meetings: Hastings, Schreiber. occasionally Wainwright,
    Crutchfield,

#### Upcoming

-   Conferences this summer: Evolution & iEvoBio. CSGF. Open Science.
-   Arkin group at LBL

### Methods and Misc

-   Technology/Science2.0 : Learned git for version management, github
    project hosting. Mendeley database for papers. OpenWetWare for lab
    notebooks. Forums.
-   Interviewed in [Science
    Careers](http://sciencecareers.sciencemag.org/career_magazine/previous_issues/articles/2010_04_09/caredit.a1000036 "http://sciencecareers.sciencemag.org/career_magazine/previous_issues/articles/2010_04_09/caredit.a1000036").
-   Help start UC\_Davis\_Open\_Science group.
-   [Grad Teaching
    Community](http://gtc-blog.blogspot.com/ "http://gtc-blog.blogspot.com/").

\

#### Footnote on some stats

Thanks to the various Science 2.0 spirit technology I've employed in my
research, it's remarkably easy to get statistics on what I've done over
the year. For instance, as I read articles I add them to my Mendeley
database, making it easy to recover my article statistics, and also plot
these trends over time. Similarly, version management software such as
git makes it easy to track the progress of my codes. Will be interesting
to revisit these stats next year. Meanwhile:

**Articles**: I've read 144 articles since November (when I started
using Mendeley). Most read journal has been Evolution (25 articles),
most read authors are Peter Wainwright and Johnathan Losos. 81 articles
were in comparative methods. 6 have been reviews I've done for different
journal submissions.

**Code:** I've written over 9000 lines of code in five projects:
regime\_shifts (1417), structured\_pops (684), Comparative-Phylogenetics
(2265), Adaptive-Dynamics (1326), wrightscape (3380).

\

\

Code Tricks
-----------

-   Was curious how to quickly find the number of lines of code in my
    projects. While Github has several useful graphs, they [haven't
    yet](http://support.github.com/discussions/feature-requests/186-lines-of-code-graph "http://support.github.com/discussions/feature-requests/186-lines-of-code-graph")
    added this feature. Fortunately this question was already [answered
    on
    stackoverflow](http://stackoverflow.com/questions/23907/how-can-i-graph-the-lines-of-code-history-for-git-repo/2854506#2854506 "http://stackoverflow.com/questions/23907/how-can-i-graph-the-lines-of-code-history-for-git-repo/2854506#2854506")
    with a very nice little python script, which I've named gitlines and
    have added to my path. Running gitlines from anywhere in the project
    directories gives a list of total lines in each commit for the
    project.

\

Monday
------

-   10a - 11:30a Steering committee meeting
-   Chat Sebastian re: linear noise approximation in patch dynamics, see
    earlier manuscript
-   1p Sebastian lab meeting/pizza social, Discussed F1000, Kyle
    mentioned niche modeling
    [paper](http://hdl.handle.net/10.1126/science.1187468 "doi:10.1126/science.1187468")
    in Science. Discussed which ToC's people read, also compare to which
    they use or cite.
-   5p Richard McElreath speaking to GTC on teaching mathematical
    modeling to biologists

Research
--------

From discussion with Sebastian: Structured population dynamics need to
consider stage transitions as simultaneous two-step events rather than
two one-step events. results in slightly different form for evolution of
the covariance matrix. Excepting this yesterday's form is accurate.

\

