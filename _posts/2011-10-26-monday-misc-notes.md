---
comments: true
date: 2011-10-26 09:47:13
layout: post
slug: monday-misc-notes
title: Monday, misc notes
redirects: [/wordpress/archives/2994, /archives/2994]
categories:
- ecology
tags: 
- pdg-control 
- algorithms
---

R packages relevant to the optimal control problems


* BB: solving system of nonlinear equations
* bvpSolve: boundary value problems


lunch with Alan & visiting professor from Ottowa, [Frithjof Lutscher](http://mysite.science.uottawa.ca/flutsche/).


### ADG (algorithm discussion group)
	
* Reviewed github, basic git commands.
* Added roxygen function documentation
* Created basic package, toyHMM
* Some git notes:  The quick git-undo for a destroyed file:


```bash
git checkout filename
```


This will checkout the file from HEAD, overwriting your change. If you've already committed changes, you need to go up one previous from head, using

```bash
git checkout HEAD^ filename
```


Or for two commits back,

```bash
git checkout HEAD^^ filename
```


This command is also used to checkout branches, and you could happen to have a file with the same name as a branch. All is not lost, you will simply need to type:

```bash
git checkout -- filename
```


You can also do this with files from other branches, and such. `man git-checkout` has the details.

The rest of the Internet will tell you to use `git reset --hard`, but this resets **all ** uncommitted changes you've made in your working copy. Type this with care.
