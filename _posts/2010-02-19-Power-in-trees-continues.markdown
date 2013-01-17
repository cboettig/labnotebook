---
layout: post

categories: evolution
title: Power in trees continues
---






 








Discussion of power in trees need a counterpoint to the example of the
star tree as being devoid of information content. The best example here
is probably the example tree used in the introduction of Felsenstein
1985: two star trees sharing a common ancestor. Implemented the basic
creation of a balanced tree of arbitrary depth having this structure.
The balanced tree has 2^*h*^ − 1 nodes, all internal nodes occuring at
time = 1/2 and all tips at time = 1. This sets many branch lengths to
zero, which effectively turns a binary tree in an unresolved star.
Setting the time of all internal nodes to zero, the age of the root,
turns this into a star tree.

\

### From the subversion log

* * * * *

r208 | cboettig | 2010-02-20 14:44:25 -0800 (Sat, 20 Feb 2010) | 2 lines

Implemented the creation of Felstein-style tree and a star syle tree as
examples of information-rich and information-poor structure in the code
felsenstein\_tree.R

* * * * *

r207 | cboettig | 2010-02-19 11:18:01 -0800 (Fri, 19 Feb 2010) | 2 lines

removing old R code

\

\

