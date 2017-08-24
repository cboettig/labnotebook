---
layout: post
tags: [tribolium]
categories: [ecology]
title: Noisy beetles
---






 








![Fig 1: Noise in lavae
dominate](http://openwetware.org/images/thumb/3/30/Beetles_noise.png/400px-Beetles_noise.png)

![image](/skins/common/images/magnify-clip.png)

**Fig 1:** Noise in lavae dominate

![Fig: 2 lower mortality, higher
noise](http://openwetware.org/images/thumb/3/3f/Beetles_noise2.png/180px-Beetles_noise2.png)

![image](/skins/common/images/magnify-clip.png)

**Fig: 2** lower mortality, higher noise

-   Success! My first full implementation of the four stage (EPLA)
    beetle model, so far without any adaptation, and the noise of the
    larval class dominates (Fig 1). Without the time delays the
    stationary dynamics are stable nodes, at least in this part of
    parameter space, with a large adult class clamping tightly down on
    the other classes. Despite adults being the most numerous, the
    larval class is the most variable, just as observed.
-   Standard parameter set, figure produced by [this
    version](http://github.com/cboettig/structured-populations/commit/0b6ce3ea1210284b71f3ab270b1ad6532ee0f31b/R/beetles.R "http://github.com/cboettig/structured-populations/commit/0b6ce3ea1210284b71f3ab270b1ad6532ee0f31b/R/beetles.R")
    of the beetles.R code.
-   The level of noise depends closely on mortality estimate for this
    larva class. For instance, cutting the mortality rate of larva from
    0.001 to 0.0001 results in much larger noise, Fig 2.

\

### Modifications to implementation

-   Updated code to accurately take account of the two-step process.
    (Will add notes on the mathematics later, meanwhile is implemented
    in the
    [noise\_approx.R](http://github.com/cboettig/structured-populations/blob/22c42eb726ddc6216932906953eea18dc165185f/R/noise_approx.R "http://github.com/cboettig/structured-populations/blob/22c42eb726ddc6216932906953eea18dc165185f/R/noise_approx.R")
    (version stable link) code.
-   User now specifies the birth and death rates separately, rather than
    the first and second jump moments (b and f). User also specifies the
    two-step jumps and (as before) the Jacobian of b(x)-d(x).
-   Added cannibalism of adults on pupae, who previously had no
    mortality terms. Without this their noise level will rise
    indefinitely.
-   Separated the code for the linear noise approximation from the code
    for the
    [crowley](http://github.com/cboettig/structured-populations/blob/master/R/crowley.R "http://github.com/cboettig/structured-populations/blob/master/R/crowley.R")
    and
    [beetles](http://github.com/cboettig/structured-populations/commit/0b6ce3ea1210284b71f3ab270b1ad6532ee0f31b/R/beetles.R "http://github.com/cboettig/structured-populations/commit/0b6ce3ea1210284b71f3ab270b1ad6532ee0f31b/R/beetles.R")
    models.

### Git log

commit 0b6ce3ea1210284b71f3ab270b1ad6532ee0f31b Author: Carl Boettiger
<cboettig@gmail.com\> Date: Tue May 18 23:54:45 2010 -0700

       added adult cannibalism on pupa

commit 22c42eb726ddc6216932906953eea18dc165185f Author: Carl Boettiger
<cboettig@gmail.com\> Date: Tue May 18 15:59:51 2010 -0700

       getting second-order transitions implmented

commit 2cb4215b1028619e96ec809875c693fb84fdc185 Author: Carl Boettiger
<cboettig@gmail.com\> Date: Tue May 18 15:22:24 2010 -0700

       replaced f and g with birth and death

commit c9bc00fbf7dcd3eabd1935d1df96adb7dd54480d Author: Carl Boettiger
<cboettig@gmail.com\> Date: Tue May 18 14:13:25 2010 -0700

       seperated examples from noise approx code

\

Misc / Reading
--------------

-   [NSF](http://www.nsf.gov/news/news_summ.jsp?cntn_id=116928 "http://www.nsf.gov/news/news_summ.jsp?cntn_id=116928")
    to require data management in all proposals:

"Researchers from numerous disciplines need to work together to attack
complex problems; openly sharing data will pave the way for researchers
to communicate and collaborate more effectively."

"This is the first step in what will be a more comprehensive approach to
data policy," added Cora Marrett, NSF acting deputy director. "It will
address the need for data from publicly-funded research to be made
public."

\

