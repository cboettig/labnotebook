---
layout: post
tags: []
categories: evolution
---





 





Likelihood Calculation
----------------------

### Direct Calculation of the Joint Probability

![](data:image/png;base64,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)


**Fig 1** Sample tree

-   This is the approach implemented in the wrightscape project
    [matrix\_method.c](http://github.com/cboettig/wrightscape/blob/master/src/matrix_method.c "http://github.com/cboettig/wrightscape/blob/master/src/matrix_method.c").
    Consider an example phylogenetic tree (Fig 1) over which a
    stochastic process describes the evolution of trait *x,* defined by
    the transition probability rate *w*. Then the joint probability for
    a set of observed traits under this process can be written:

$$ \begin{align} P(x_1, x_2, x_3, x_4) =& \int d x_7 \Biggl[
\left[ \int d x_5 w(x_7, x_5, t_5) w(x_5, x_1, t_1) w(x_5,
x_2, t_1) \right] \\ & \times \left[ \int d x_6 w(x_7, x_6,
t_6) w(x_6, x_3, t_3) w(x_6, x_4, t_3) \right] P(x_7) \Biggr]
\end{align}$$

-   The transition density from any state to any state can be
    represented as a matrix over the domain of the integral. So at each
    node, we have a transition probability of entering any state that
    node can assume from any state from which its ancestor could assume.
    Though we have an analytical expression for this probability, we
    must evaluate it *n*^2^ times for each matrix, then perform the
    matrix multiplications that are the equivalent discretization of the
    integral formulation above. If the tips are known they are
    represented instead by a single column of that matrix -- i.e.
    transitions from any state to the known tip state. So:

-   Taking the element-wise product (denoted \*) of the tip vectors
    times the matrix (chalkboard boldface) of the internal node prunes
    that node down to a single vector, and this can be recursed:

$$ \int d x_5 w(x_7, x_5, t_5) w(x_5, x_1, t_1) w(x_5, x_2,
t_1) \approx \mathbb{W}_5 (\vec W_1 \* \vec W_2) \to \vec W_5
$$
-   See implementation in the code,
    [matrix\_method.c](http://github.com/cboettig/wrightscape/blob/master/src/matrix_method.c "http://github.com/cboettig/wrightscape/blob/master/src/matrix_method.c").

-   While the discretization is substantially faster than the numerical
    integration, since it reduces the problem to a series of matrix
    products (note that given the root note and all tip nodes, then this
    produces a joint probability as a single scalar. Unknown tips
    results in a tensor, indicating the dimensionality of the full data
    space).

-   Most of the time is spent computing the elements of the matrices at
    each node, see Yesterday's entry, which reduces performance to
    substantially below that of the linear likelihood schemes compared
    in that model. The advantage of this approach is that the W matrices
    can be computed in principle for any process, and once computed the
    actual calculation of the joint probability (the recursive
    integrals) occurs very fast, even for reasonably large grids. (No
    matrix inversion, just products!) It is rather the calculation of
    each element of the matrix separately that is both the rate limiting
    step and leads to poor (quadratic) scaling of compute time with
    increasing grid resolution. This leads us to consider some other
    approaches:

\

### Given a painting

-   Given a painting we can determine the likelihood of this regimes
    model (mixtures of OUs) with given parameter values (i.e. using the
    OUCH framework). For instance, if we assume as OUCH does, that for
    OU processes, *d**X* = α(θ − *X*)*d**t* + σ*d**B*~*t*~,

sigma and alpha are global parameters but there can be different values
of theta under regimes, then the joint probability is *still*
multivariate normal, so its likelihood is given by

$$ f_X(x) = \frac{1}{ (2\pi)^{k/2}|\Sigma|^{1/2} } \exp\!\Big({-\tfrac{1}{2}}(x-\mu)'\Sigma^{-1}(x-\mu) \Big)$$

-   The addition of regimes with different thetas alters the calculation
    of the means, which can still be done using the solution to the
    expectation of the OU process. For instance, a tip that has spent
    time *t*~1~ in regime 1 followed by time *t*~2~ in regime 2 has
    expectation:

$$ E(X) = (X_0 e^{-\alpha_1 t_1} + \theta_1) e^{\alpha_2 t_2} + \theta_2$$

and so forth. If we assume alpha and sigma are the same for all
processes than the variance calculation is unaltered. We could also
generalize this to allow regimes to change at points other than nodes,
though in practice this may be unimportant. For varying alpha and sigma,
we would need to modify the variance calculation (will hopefully write
down soon). So all this is well implemented given the tree, but our
desire is to avoid having to specify a painting.

-   Speed in this method depends largely on the ability to calculate
    distances between nodes on a tree. While many common implementations
    of this exist, including my own, it appears that most of the
    phylogenetics codes do not use the computationally optimum
    algorithms, which are surprisingly recent in the CS literature. See
    the [algorithms described
    here](http://www.topcoder.com/tc?module=Static&d1=tutorials&d2=lowestCommonAncestor "http://www.topcoder.com/tc?module=Static&d1=tutorials&d2=lowestCommonAncestor").
    It appears that this distance goes by the name patristic in the
    phylogenetics literature. (Sample algorithms in practice -- see
    [Matlab](http://www.mathworks.com/access/helpdesk/help/toolbox/bioinfo/ug/a1075738685b2.html "http://www.mathworks.com/access/helpdesk/help/toolbox/bioinfo/ug/a1075738685b2.html"),
    [dendropy](http://github.com/jeetsukumaran/DendroPy/blob/master/dendropy/treecalc.py "http://github.com/jeetsukumaran/DendroPy/blob/master/dendropy/treecalc.py"),
    [R](https://www.nescent.org/wg_phyloinformatics/R_Hackathon_1/DataTreeManipulation "https://www.nescent.org/wg_phyloinformatics/R_Hackathon_1/DataTreeManipulation"),
    etc. Sample papers see [on lowest common
    ancestor](http://en.wikipedia.org/wiki/Lowest_common_ancestor "http://en.wikipedia.org/wiki/Lowest_common_ancestor")
    problem on wikipedia.)

#### Original appraoach

The Labrid example tackles this problem by attempting to generate a
reasonable distribution of paintings from the data by clustering.

### Distributions of Paintings

-   We'd like not to actually integrate over paintings, but over
    stochastic mappings (continuous time finite state Markov chains)
    that generate the paintings. This reduces the parameter set (i.e.
    two additional parameters for the two regimes case, or six for the
    three regime case, without assuming equal forward-back rates or an
    ordering of the peaks).

-   The most straight-forward implementation of this approach is to
    generate paintings from a particular parameterization of a
    transition matrix and calculate the probability of the data of each.
    Averaging these probabilities effectively integrates over the
    distribution of paintings generated from the transition density.
    Unfortunately, this may not be much faster. However, we can do
    better than this by realizing that *given a painting, we can compute
    the probability that it is generated from any particular transition
    matrix!*

\

-   In this way we can construct the probability of the parameter set of
    the regimes  $\vec \theta$ and the transition probabilities $\mathbb{Q}$  
    through a particular painting *C*

$$P(X | \vec \theta, \mathbb{Q} ) = P(X | C) P(C | \mathbb{Q} )$$

