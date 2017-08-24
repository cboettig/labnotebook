---
layout: post

categories: evolution
title: Batch Data
---






 








-   Some of the nexus files don't seem to read into R. Opening and
    saving the file in figtree solves this.

Data Sets
---------

### Labrid traits

--Carl Boettiger 00:52, 11 August 2010 (EDT) Note: labels on parameter
bootstrap distributions have reversed wrasses and parrotfish. I've
updated the software so that the plotting function takes care of the
labeling automatically (when these were made it had to be added
manually, while the automation of the data conversions and the painting
by clade reversed the label assignments). See User:Carl
Boettiger/Notebook/Comparative Phylogenetics/2010/08/10.

![Gape distance (weighted by body
mass)](http://openwetware.org/images/thumb/f/f4/Gapedistance_mm_model.png/500px-Gapedistance_mm_model.png)

![image](/skins/common/images/magnify-clip.png)

Gape distance (weighted by body mass)

![Gape distance (weighted by body
mass)](http://openwetware.org/images/thumb/c/c3/Gapedistance_mm_pars.png/500px-Gapedistance_mm_pars.png)

![image](/skins/common/images/magnify-clip.png)

Gape distance (weighted by body mass)

![Protrusion distance weighted by body
mass](http://openwetware.org/images/thumb/b/b4/Protrusiondistance_mm_model.png/500px-Protrusiondistance_mm_model.png)

![image](/skins/common/images/magnify-clip.png)

Protrusion distance weighted by body mass

![Protrusion distance weighted by body
mass](http://openwetware.org/images/thumb/b/be/Protrusiondistance_mm_pars.png/500px-Protrusiondistance_mm_pars.png)

![image](/skins/common/images/magnify-clip.png)

Protrusion distance weighted by body mass

![Body
Mass](http://openwetware.org/images/thumb/1/1f/Bodymass_g_model.png/500px-Bodymass_g_model.png)

![image](/skins/common/images/magnify-clip.png)

Body Mass

![Body
Mass](http://openwetware.org/images/thumb/2/2b/Bodymass_g_pars.png/500px-Bodymass_g_pars.png)

![image](/skins/common/images/magnify-clip.png)

Body Mass

![Jaw closing lever
ratio](http://openwetware.org/images/thumb/6/60/Jawclosingleverratio_model.png/500px-Jawclosingleverratio_model.png)

![image](/skins/common/images/magnify-clip.png)

Jaw closing lever ratio

![Jaw closing lever
ratio](http://openwetware.org/images/thumb/9/91/Jawclosingleverratio_pars.png/500px-Jawclosingleverratio_pars.png)

![image](/skins/common/images/magnify-clip.png)

Jaw closing lever ratio

![Jaw opening lever
ratio](http://openwetware.org/images/thumb/3/36/Jawopeningleverratio_model.png/500px-Jawopeningleverratio_model.png)

![image](/skins/common/images/magnify-clip.png)

Jaw opening lever ratio

![Jaw opening lever
ratio](http://openwetware.org/images/thumb/2/26/Jawopeningleverratio_pars.png/500px-Jawopeningleverratio_pars.png)

![image](/skins/common/images/magnify-clip.png)

Jaw opening lever ratio

![Jaw kinematic
transmission](http://openwetware.org/images/thumb/4/4e/Jawkt_model.png/500px-Jawkt_model.png)

![image](/skins/common/images/magnify-clip.png)

Jaw kinematic transmission

![Jaw kinematic
transmission](http://openwetware.org/images/thumb/0/00/Jawkt_pars.png/500px-Jawkt_pars.png)

![image](/skins/common/images/magnify-clip.png)

Jaw kinematic transmission

Based on nboot = 100

Various muscle mass traits do not seem to converge.

### Carnivora Traits

![Carnivore size by habitat: aquatic vs
terrestrial](http://openwetware.org/images/thumb/1/1d/Carnivora_models.png/500px-Carnivora_models.png)

![image](/skins/common/images/magnify-clip.png)

Carnivore size by habitat: aquatic vs terrestrial

![Carnivore size by habitat: aquatic vs
terrestrial](http://openwetware.org/images/thumb/5/56/Carnivora_pars.png/500px-Carnivora_pars.png)

![image](/skins/common/images/magnify-clip.png)

Carnivore size by habitat: aquatic vs terrestrial

No preference for any model. OU.1 fit has non-zero, though small alpha,
which cannot be distinguished significantly from the Brownian motion
model. No evidence for either of the regimes models. (Might compare ws2
to ou1 though)

Brownian motion:

~~~~ {.de1}
sigma squared:
         [,1]
[1,] 3.922782
 
theta:
NULL
   loglik  deviance       aic     aic.c       sic       dof 
-317.3379  634.6758  638.6758  638.7225  645.7971    2.0000
~~~~

OU.1:

~~~~ {.de1}
alpha:
          [,1]
[1,] 0.2056982
 
sigma squared:
         [,1]
[1,] 4.099564
 
theta:
$size
 
9.39714 
 
   loglik  deviance       aic     aic.c       sic       dof 
-318.9566  637.9133  643.9133  644.0070  654.5953    3.0000
~~~~

\
 The coding of marine and freshwater separate, as well as a terrestrial
regime does not converge under the wrightscape simplex method using the
hansen initial conditions, but does just fine using the standard 1,1
initial conditions. Running now.

### Mammalia

The huge mammalia data set takes a while even fitting the hansen model
on the painting. bm loglik returns INF, ou1 returns loglik of -3727. the
multiple regime model simplex routine fails to converge using the seed
from ou2. Note the dramatic differences in the log body size optima
found by the regime model. Certainly these differences must accomplish
most of the difference in likelihood of this model.

~~~~ {.de1}
alpha:
           [,1]
[1,] 0.01144819
 
sigma squared:
         [,1]
[1,] 6.277772
 
theta:
$size
       1062     aquatic terrestrial      volant 
   8.961080  254.067332    8.059478 -217.152860 
 
   loglik  deviance       aic     aic.c       sic       dof 
-3721.305  7442.610  7454.610  7454.634  7491.439     6.000
~~~~

\

\

