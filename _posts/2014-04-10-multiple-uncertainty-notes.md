---
layout: post
category: ecology
tags:
- ropensci
- multiple-uncertainty

---


multiple uncertainty
--------------------

- Set up Paul Fackler's [MDPSOLVE](https://sites.google.com/site/mdpsolve/download) and run Paul's code.  Installing user-contributed extensions in matlab seems mostly a matter adding the unzipped source directories to the path, e.g. as so:  

```m
currentdir = cd
cd /home/cboettig/.matlab/MDPSOLVE
addpath(genpath(cd))

cd /home/cboettig/.matlab/plot2svg
addpath(genpath(cd))

cd(currentdir)
```

(I still find matlab/octave's syntax of not distinguishing character strings from variable names from function names kind of terrifying, but I guess that's the price of working with economists.)

Code runs, with svg output using the user-contributed svg function [plot2svg](http://www.mathworks.com/matlabcentral/fileexchange/7401-scalable-vector-graphics-svg-export-of-figures) since Matlab doesn't seem to include such basic functionality (though works fine on octave).  

![](http://cboettig.github.com/multiple_uncertainty/SethiEtAl05_Figure3.svg)



ropensci
---------

Morning mostly spent wrapping up proposal steps

- Pandoc-latex formatting stuff (xelatex, Times New Roman 12pt, doublespacing, makefile configuration, latex-template configuration, margins, yaml header metadata).  

- Reworking introduction into seperate sections

- feedback on further issues through issue tracker.  



Reading
--------

- Further evidence that anything can happen with regards to transitions in spatial dynamics: [Gowda et al, Phys Rev E](http://dx.doi.org/10.1103/PhysRevE.89.022701)
