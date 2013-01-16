---
layout: post
tags: [conference]
categories: evolution
---





 





Graham & Peter Meeting
----------------------

Fantastic meeting with Graham and Peter today, covered a lot of ground.

#### MNV

I briefly sketched the multivariate normal solution for joint
probability across the tree under the regimes model. The original
regimes approach did not take advantage of the fact that the solution to
the joint probability across the tree is multivariate normal given the
painting. This allows the calculation to be partitioned as outlined in
Saturday's entry:

$$ P(X | \vec \theta, \mathbb{Q} ) = P(X | C) P(C | \mathbb{Q} $$ 


#### Importance Sampling

-   The method I had outlined by reusing the tree library and weighting
    by the probability that the Q matrix generated that tree goes by the
    name *Importance Sampling*, though it ought to have been re-weighted
    by the probability it was produced from the original Q matrix used
    to generate it (Q'), and then averaged. (In my examples (github) I
    generate from the same distribution as a weight from and these
    agree). A brief summary excerpted from Wikipedia:


$$\begin{align} p_t & {} = {E} [1(X \ge t)] \\ & {} = \int 1(x \ge t) \frac{f(x)}{f_*(x)} f_*(x) \,dx \\
& {} = {E_*} [1(X \ge t) W(X)] \end{align}$$

where

$$W(\cdot) \equiv \frac{f(\cdot)}{f_x\*(\cdot)}$$

is a likelihood ratio and is referred to as the weighting function. The
last equality in the above equation motivates the estimator

$$\hat p_t = \frac{1}{K}\,\sum_{i=1}^K 1(X_i \ge t) W(X_i),\,\quad 
\quad X_i \sim f_* $$



This is the importance sampling estimator of
![](data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAANBAMAAABSlfMXAAAAMFBMVEX///+7u7tKSkpaWlqmpqYgICDo6OgLCwvR0dGSkpJsbGwAAAB+fn46OjosLCwUFBR7CVS7AAAAcElEQVQIHWNgEDJwVmQAAYUgh/QGIM04oYqBdQGQwcGxg4HdgK2BgYGngCH7ALMBAwPvBYbZDawODAzsBxgecVpbMjB0H2D5xuAKVH3cxi6BwRjIuMsI1BECZNQAMcOGHgagMUDwcQGD3yYHIIONAQD8oRcROLw0twAAAABJRU5ErkJggg==)
and is unbiased. That is, the estimation procedure is to generate i.i.d.
samples from
![](data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAUCAMAAACzvE1FAAAAM1BMVEX////o6Oi7u7uSkpI6OjpsbGwEBATR0dEsLCwLCwtKSkogICBaWlp+fn6mpqYAAAAUFBSBjHY3AAAAe0lEQVQYGWWPWRLEIAhEGzdcUOf+px0TtIok/tjdwgMBPeS22JcPMdiEEudkA1/AbIParFu6ySPokrIMG/F8AAA/7fPS8mHWV0XpGpz1aW51Oocyf0Nco6v2MGOrt0fWPYNECXR9qijCoWGplPmwcA8LPZ9pexmnoO3wB3mWAnvUsJW4AAAAAElFTkSuQmCC)
and for each sample which exceeds
![](data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAcAAAAOBAMAAAARcxsoAAAAKlBMVEX////o6OhsbGx+fn4LCws6OjqmpqZaWloAAADR0dEgICC7u7uSkpIsLCyaBYdvAAAAP0lEQVQIHWNgYFRgYGBgdgASrAFAgsWAgSG9IjyBgcEEyGMIBRHOQMzZCSSgypgYGLgKNjMw8FwuAArOZGAAANbDB5G/vmnDAAAAAElFTkSuQmCC),
the estimate is incremented by the weight
![](data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABQAAAAPBAMAAAAWtvJmAAAAMFBMVEX///9aWlosLCwgICA6Ojp+fn6mpqZKSkrR0dEAAADo6OgEBAS7u7tsbGySkpIUFBQAGxs7AAAAjElEQVQIHSXMMQrCQBBA0T8WS0yIiF5kBVPZCIK1pWV6G8ELCGIfMYqIxWIveASPkNrKMr0XcHac6jEzfAbjhduMtslsjlyhu4Z7QCrI+rAEd4PVlLRRnmHoyYOxt/PsUZ54dDx6hwNvebrSmHykyqOoRYOt8dgiF3vl2+DqYNtJiBWbQoP+zxLSV+QP3QsdHtm98LYAAAAASUVORK5CYII=)
evaluated at the sample value. The results are averaged over
![](data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABEAAAAOCAMAAAD+MweGAAAAM1BMVEX///9+fn5KSkogICBaWlqmpqa7u7ssLCw6Ojro6OgAAABsbGwEBAQLCwuSkpLR0dEUFBQK7AVDAAAAdUlEQVQIHT1PWRbEIAhLxbqgaO9/2mHR4QNCCHkAAE8iyq+CUqlZBToPr6DoVcTFB6PHAGjTUDlCw1I1rWUwYptN8sXDqE2vfE2NbPMdfdrmDRGdN963h9tozn/mXEN+grNxDRY/VyQUSL6oObFkNd2J2d/8AUjCAtJb8XZnAAAAAElFTkSuQmCC)
trials.

\

-   Unfortunately having to know the $f_*(\cdot)$
    term means that I cannot produce the painting library arbitrarily,
    but will be stuck finding the right painting only with the
    probability that I can simulate it from the prior.

#### MCMC

Partitioning the problem

$ P(X | \vec \theta, \mathbb{Q} ) = P(X | C) P(C | \mathbb{Q} ) P(\mathbb{Q} ) P( \vec \theta)$

and proposing paintings directly, we can MCMC over the space of possible
paintings *C*, OU parameters $\vec \theta$ and transition matrices $\mathbb{Q}$

Still, as this problem is hard in the discrete case over
![](data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAA8AAAATCAMAAAB4HKeYAAAAM1BMVEX////R0dHo6Oh+fn4UFBQLCws6OjogICAEBAQsLCympqa7u7tKSkpaWlqSkpJsbGwAAAAal1eCAAAAiklEQVQYGVVQQRLEIAijgKIidf//2gV0pi0XJCExCrDrwnOIRlyqtD42hFK7s1r6TEBUctluCsDo6olrhZAIDNtCAYectGMkABzka87lz6zzy7vfvbYfA/pNdbhrVDiTN0HOmUgziIpFACy0c/rir5uVdmI5N5iGp3nKFVTfX7B4zSbySPA2fyn8AUqZBAL4yXS7AAAAAElFTkSuQmCC)
(BayesTraits), optimizing the MCMC will still be interesting...

-   Discussion of Hastings ratio
-   Discussion of reversible jump

Wainwright Lab Meeting, 4-6pm
-----------------------------

Presented three potential questions to focus on for the Evolution talk:

1.  Defining clusters from raw data, with example in Labrids
2.  Inferring paintings and transition rates directly from data via MCMC
3.  Risks in AIC-based model choice

The group clearly indicated that I should focus on the third, AIC topic,
as it is the furthest along and the most immediate impact to the
audience. Surprising to me as it is also the least biologically driven.
Back to the drawing board now to figure out how to tell this story
clearly and succinctly.


