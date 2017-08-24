---
layout: post
category: open-science
tags:
- ropensci
- hackathon

---


Breakfast
---------

- discussion of what makes an API good or a total pain
- discussion of extending data.set class with metadata


Morning Session
---------------

Chatting with Hadley: 

### Best practices for R client packages to REST APIs

- (When) Do we return response call metadata? 
- Very modular function construction
- Error handling, `assertthat` checks
- Explicit parsing, as seperate function. e.g. 
- Better alternatives in place of `require` when loading SUGGESTS lists,
  which still pollutes the namespace; see examples in `httr`.

We've begun writing [dependencies](https://github.com/ropensci/dependencies) package to
address some of the issues in managing version dependencies of R packages.


Afternoon Session
-----------------

Working with Martin and Gavin on [docs](https://github.com/ropensci/docs) workflow.  

One challenge of this setup is passing secure data over travis, such as
the keys necessary to execute the `git push`. Travis has a mechanism
for encrypting and transmitting these keys.

Otherwise, working in simplifying and sanitizing the separation between
ruby and knitr interfaces in providing a dynamic coding static blogging
platform. 

Also various interactions and video interview for event documentation.

Evening
-------

Excellent social; discussions with Josh Bloom re BIDS etc


Wednesday
---------

Mostly hacking on [docs](https://github.com/ropensci/docs) workflow, see commit log etc.



