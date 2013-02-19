---
layout: post

categories: [ecology]
title: Individual based simulation with gamma waiting times
---






 








Began implementing the individual-based simulation of gamma waiting
times by subdividing the first three age classes into K subclasses.
Required rewriting gillespie function so as to intelligently calculate
rates rather than writing 3K+1 functions. This leads to an alternative
gillespie simulation interface that takes a function to calculate rates,
producing cumulative sum (though perhaps that step should be moved into
the raw gillespie code) of rates for each event, and an outcome function
that will execute the outcome of each of those events. Additionally
there is still the fixed interval tasks function and a custom record
class for the output.

See the github page for code, commit details, etc.

\

\

