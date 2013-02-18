---
comments: true
date: 2011-10-25 19:18:09
layout: post
slug: tuesday-notes-package-work-mostly
title: 'Tuesday notes: package work mostly.'
redirects: [/wordpress/archives/3020, /archives/3020]
categories:
- evolution
---

## Treebase release





	
  * write updated tutorial.

	
  * cran needs mac and windows binaries.


Trying devtools win_builder(); emailing Kurt.  _Nevermind_, just got the email saying the binary has been built.  



	
  * write email announcement




## rfishbase data formatting



My problem turned out not to be about "\" at all, these were octal encodings of symbols used in the XML data, eg:   Cape Bojador (26°N)

which xmlValue() would read in using the octal encoding  "Cape Bojador (26\302\260N)"

and which R CMD check would then complain about, giving the error in byte encoding (just to confuse me): "Cape Bojador (26<c2><b0>N)"

inconv() function provided my crude work-around:


```R

string <- "Cape Bojador (26\302\260N)"
Encoding(string) <- "UTF-8"
iconv(string, "UTF-8", "ASCII", "byte") # return hex code used by R CMD check
string <- iconv(string, "UTF-8", "ASCII", "") # just drop those chars

```


I could translate the hex errors by hand into octal, and then hand-code a better literal translation:


```R

string <- "Cape Bojador (26\302\260N)"
string <- gsub("\302\260", " degrees ", string)

```


but that's too tedious and slow, I'll cope without the degree symbol for the moment.   Tedious, because I'd have to recode most UTF-8 symbols, starting by decoding their byte strings, by looking up the [hex string here](http://stuffofinterest.com/misc/utf8.php?s=128), then pasting the symbol into an[ octal encoder](http://encodertool.com/octal).    A partial list of the offenders includes:

    
    <c2><96>, <c2><b0>,  <c3><a9>, <c3><ad>, <c2><bd>, <c3><b3>


A solution, if not an ideal one.  At least no ASCII errors.  I'd be happy for any better suggestions.  Oh well, done.  Package submitted to CRAN via devtools



## Labrid Phylogenetics





	
  * Launch sub-model runs

	
  * Attempt to replicate Price et al. results on BM model





