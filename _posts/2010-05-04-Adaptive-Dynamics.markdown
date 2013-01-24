---
layout: post
tags: [adaptive-dynamics]
categories: evolution
title: Adaptive Dynamics
---






 








### Wide gap, flat landscape

-   Waiting times on a flatter landscape: sigma\_c \~ sigma\_k. Waiting
    times are dominated by the number of times phase 3 collapses: the
    established invader in a dimorphic population (right panels).
    Collapse of phase 2: collapse of the dimorphism before third
    population can establish is much rarer (about an order of
    magnitude).

![image](http://openwetware.org/images/thumb/0/06/Distribution3.png/400px-Distribution3.png)

![image](/skins/common/images/magnify-clip.png)

-   from the run3 dataset, with parameters.

### Narrower gap, steeper landscape

-   with sigma\_c << sigma\_k, branching is easy, neither phase is
    particularly limiting, though single collapses from both phases are
    very common.

![image](http://openwetware.org/images/thumb/4/48/Distribution4.png/400px-Distribution4.png)

![image](/skins/common/images/magnify-clip.png)

-   from the run4 dataset.

### Slower mutation, bigger steps

-   Trying flat landscape with smaller mu, larger sigma\_mu, see if
    phase 2 becomes limiting. (run5 dataset). Pars: mu = 5e-4, sigma\_mu
    = .05, sigma\_c2 = .8,
-   Just finished running, very few achieved branching! Should repeat
    with narrower competition kernel.
-   Mean number of failures from phase 2: 240, from phase 3: 330, so not
    order of magnitude different anymore but phase 3 still limiting.
-   Very interesting, seems the stdev of failures is much smaller for
    both! (24, 30 respectively)

\

![Image:Distribution5.png](http://openwetware.org/images/8/8e/Distribution5.png)

-   Run6: as before, but mu=.0001, sigma\_c2 = .3. Phase 2 is truly more
    limiting. A different mechanism to branching -- rare large jump vs
    series of rapid small steps.

![Image:Distribution6.png](http://openwetware.org/images/6/65/Distribution6.png)

\

