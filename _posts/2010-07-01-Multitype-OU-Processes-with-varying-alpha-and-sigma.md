---
layout: post

categories: evolution
title: Multitype OU Processes with varying alpha and sigma
---






 








Been meaning to sit down and work this one out for a while; somehow
travel and conferences helped out with that -- now I only have to
transcribe some dozen messy hotel notepad sheets to get the calculations
into this lab notebook. Meanwhile, 15 hours on a train from Portland was
just the right amount of time to code up the approach, which is now
implemented at the C level for the Anoles dataset; code in the
[wrightscape
project](http://github.com/cboettig/wrightscape "http://github.com/cboettig/wrightscape")
on github.

\

-   current algorithm will replace the existing codebase for the
    wrightscape project. Currently the
    [makefile](http://github.com/cboettig/wrightscape/blob/007476cec25babd95f1829b8c14ddfadfb53e1a9/src/makefile "http://github.com/cboettig/wrightscape/blob/007476cec25babd95f1829b8c14ddfadfb53e1a9/src/makefile"),
    [p\_multimin.c](http://github.com/cboettig/wrightscape/commit/02a8611bc2008cbcbcc567d41552b569683d40e9#diff-0 "http://github.com/cboettig/wrightscape/commit/02a8611bc2008cbcbcc567d41552b569683d40e9#diff-0"),
    and
    [piecewise\_regimes.c](http://github.com/cboettig/wrightscape/blob/007476cec25babd95f1829b8c14ddfadfb53e1a9/src/piecewise_regimes.c "http://github.com/cboettig/wrightscape/blob/007476cec25babd95f1829b8c14ddfadfb53e1a9/src/piecewise_regimes.c")
    (the main file) contain the standalone version of the new method.
    Will soon remove older scripts from the active version and break up
    piecewise\_regimes.c into multiple files as appropriate.

\

