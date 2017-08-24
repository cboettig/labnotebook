---
layout: post
categories: ecology
tags: [decision-theory, pdg-control]


---
Let

* `y` be measured stock size, subject to measurement error from true stock `x`
* `q` be harvest quota, subject to implementation error from actual harvest, `h`

Stock next year is also subject to stochastic growth shock $z_g$, (note that $f$ will also depend on the harvest, `h`, unless $x_t$ is taken as the escapement population, $x-h$).

$$ x_{t+1} = z_g f(x_t) $$

In discrete space, let `X` be a vector representing the probability distribution of having stock $x$ at time $t$, restricted to some finite grid of dimension $n$.  Let $P_g(x | \mu, \sigma_g)$ be the probability density function of the shock $z_g$ over states $x$, given parameter $\sigma$ and mean $\mu$. We can write the distribution $X_{t+1}$ as the result of a matrix-vector product, $X_{t+1} = \mathbb{F} X_t$ where the elements of F are given by

$$ F_{ij} = P_g(x_i, f(x_j), \sigma_g) $$

and $\mathbb{F}$ is also a function of the harvest level, $\mathbb{F_h}$.

When we consider measurement uncertainty, we allow the vector $\vec Y$ to represent the measured stock size, and the true stock size $\vec X$ is a random variable distributed around it.  In the discrete space we may represent this as $X = \mathbb{M} \vec Y$, where $M$ is an $n$ by $n$ grid representing the role of measurement uncertainty, $M_{ij} = P_m(x_i, x_j, \sigma_m)$.  The state equation now evolves in belief space,

$$ Y_{t+1} = \mathbb{F}_h \mathbb{M} \vec Y_t $$



If there is implementation uncertainty as well and $f$ is a function of the escapement population (those remaining after a harvest $h$), we can impliment this as an additional transition matrix $I_{ij} = P_i(x_i, x_j-h, \sigma_i)$, and the state equation becomes

$$ Y_{t+1} = \mathbb{F} \mathbb{M} \mathbb{I}_h \vec Y_t $$

Note that the implementation matrix is a function of the harvest level, so that we need a different matrix for each $h$, whether or not we introduce measurement uncertainty (instead of a different $\mathbb{F}$ matrix for each harvest as before.)



## Results

See github log
