---
layout: post
tags: [warning-signals]
categories: [ecology]
title: Hastings Meeting
---






 








-   Discussion of cases where variance decreases before crash --
    misleading warning signals. Schreiber 2003
-   Aaron King and Bill Schaffer JMB Hamiltonian vs Dissipative/gradient
    systems. Are Hamiltonian systems non-biological?
-   Follow up with Darren

### Reasons Warning Signals fail

1.  Present (saddle-node model) but insufficient sensitivity to detect
    (lack ensembles, lack sampling frequency)
2.  dissipative but warning signals are backwards (other higher
    dimensional bifurcations, limit cycles --\> no potential)
3.  Hamiltonian instead of dissipative (centers, stochastically become
    random walks)

Code Updates
------------

Early warning signals code now does ensemble averaging, which works! The
next step is to compute variance around the ensemble average to
determine significance of a signal.

![image](http://openwetware.org/images/thumb/e/ef/Ensemble_warning.png/600px-Ensemble_warning.png)

The red line shows the environmental change, which begins around t =
200. The black line shows when the environmental variable hits the
bifurcation point. Hence a reliable warning signal should occur between
these two points. Looks like these work! Note that expected variance
appears the least noisy. Dynamics of the model are ![ \\dot N =
\\frac{eKN\^2}{h\^2+N\^2} - e N - a
](http://openwetware.org/images/math/1/1/d/11dec717f8992ae05dde012fe7cd0aee.png)

With

  --- ------
  e   0.5
  K   1000
  h   200
  --- ------

and the bifurcation occurs near a = 200.

Progress on Code
----------------

* * * * *

r19 | cboettig | 2010-02-18 00:58:00 -0800 (Thu, 18 Feb 2010) | 2 lines

early warning works with ensemble averaging. This commit is paired with
the figure in the Feb 17 2010 entry in the openwetware notebook

* * * * *

r18 | cboettig | 2010-02-17 23:16:20 -0800 (Wed, 17 Feb 2010) | 2 lines

minor fixes to warning\_signals

* * * * *

r17 | cboettig | 2010-02-17 23:06:41 -0800 (Wed, 17 Feb 2010) | 1 line

Completed implementation of ensemble averaging

* * * * *

r16 | cboettig | 2010-02-17 21:04:23 -0800 (Wed, 17 Feb 2010) | 1 line

src directory uncessary, moved code up

* * * * *

\

