---
comments: true
date: 2012-03-20 10:02:09
layout: post
slug: citing-r-packages
title: Citing R packages
redirects: [/wordpress/archives/4259, /archives/4259]
categories:
- open-science
tags:
- R
- blog

---

I'm not always careful in citing all the R packages I use.  R actually has some rather nice built-in mechanisms to support this, so I really have no excuse.  Here's some quick examples:


```r

citation("ouch")

```


    
    
    To cite the ouch package in publications
    use:
    
      Aaron A. King and Marguerite A. Butler
      (2009), ouch: Ornstein-Uhlenbeck models
      for phylogenetic comparative hypotheses (R
      package),
      http://ouch.r-forge.r-project.org
    
      Butler, M. A. and King, A. A. (2004)
      Phylogenetic comparative analysis: a
      modeling approach for adaptive evolution
      Am. Nat. 164:683--695
    
    As ouch is continually evolving, you may
    want to cite its version number. Find it
    with 'help(package=ouch)'.
    




Can I have that in bibtex format please?


```r

toBibtex(citation("ouch"))

```



    
    
    @Manual{,
      title = {ouch: Ornstein-Uhlenbeck models for phylogenetic comparative hypotheses},
      author = {Aaron A. King and Marguerite A. Butler},
      year = {2009},
      url = {http://ouch.r-forge.r-project.org},
    }
    @Article{,
      author = {Marguerite A. Butler and Aaron A. King},
      title = {Phylogenetic comparative analysis: a modeling approach for adaptive evolution},
      journal = {American Naturalist},
      year = {2004},
      volume = {164},
      pages = {683--695},
      url = {http://www.journals.uchicago.edu/AN/journal/issues/v164n6/40201/40201.html},
    }
    



Notice that this package provides the citation information for both the package and the associated journal article simultaneously, and R has successfully identified the formats as 'Manual' and 'Article' respectively. 


After running your code, consider creating a custom bibtex file containing the citation information for all the packages you have just used.  (The file can be imported into most citation managers, if LaTeX isn't your thing).


```r

sink("test.bib")
out <- sapply(names(sessionInfo()$otherPkgs), 
    function(x) print(citation(x), style = "Bibtex"))

```


You can also simply generate the list of loaded package in LaTeX format, which could be automatically included.  

```r

toLatex(sessionInfo(), locale = FALSE)

```






### For package authors


R will attempt to automatically construct the citation information for the package automatically from the description file, so it is not strictly necessary to do anything to your package to create it. Note that R has recently adopted a new syntax to specify the authors, which is a bit more precise.  Instead of using Authors: in the DESCRPTION, we use:


    
    
    Authors@R: c(person("Carl", "Boettiger", role = c("aut", "cre"), email = "cboettig@gmail.com"), 
      person("Duncan", "Temple Lang", role = "aut"))
    



This defines the roles (author, creator, etc, see `?person` for details), and 'creator' takes the place of the `Maintainer:` designation, and requires an email address. If you wish to add an additional publication as part of the citation information (such as the example from `ouch` above, 
you can specify this in the CITATION file. For the example this looks like:

```r

citHeader("To cite the ouch package in publications use:")
citEntry(entry = "Article", 
    author = personList(as.person("Marguerite A. Butler"), 
        as.person("Aaron A. King")), title = "Phylogenetic comparative analysis: a modeling approach for adaptive evolution", 
    journal = "American Naturalist", year = 2004, 
    volume = 164, pages = "683--695", 
    url = "http://www.journals.uchicago.edu/AN/journal/issues/v164n6/40201/40201.html", 
    textVersion = paste("Butler, M. A. and King, A. A. (2004)", 
        "Phylogenetic comparative analysis: a modeling approach for adaptive evolution", 
        "Am. Nat. 164:683--695"))
citFooter("As ouch is continually evolving, you may want to cite its version number. Find it with 'help(package=ouch)'.")

[1] "As ouch is continually evolving, you may want to cite its version number. Find it with 'help(package=ouch)'."
attr(,"class")
[1] "citationFooter"

```


(It seems like there should be a simple way to generate this automatically from the bibtex format, but I haven't discovered it.)



###  R as a citation tool 


I wrote an R function for the Crossref API in our rplos package.  We should probably be formatting the output as an R bibentry, taking advantage of R's understanding of citation structure.  Then I could work automatic citation look-up into my posts using inline knitr calls, such as: 

```r

print(crossref("10.1038/44766"), style="text")

```



An alternate mechanism could read in a local bibtex file and drop in the correct entry in the desired format.  

