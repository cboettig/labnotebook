---
layout: post
categories: evolution
tags:
- ropensci


---

We have also recently reached the first
[milestone](https://github.com/ropensci/RNeXML/issues?milestone=1&state=closed)
in [RNeXML](https://github.com/ropensci/RNeXML). We can now read NeXML
files into R and convert to the popular `phylo` format from the `ape`
package, as well as writing the `ape::phylo` trees out into valid NeXML.
We can also add basic metadata such as author, license, title and
description to the file.


### Development notes

At the heart of this package is an internal S4 representation of the
schema.  While knowledgable users could interact with the S4 objects
directly (easier and less error-prone than interacting with the XML
parsing/serializing directly), we in general provide an end-user API
which hides the internal complexity of S4 classes, as illustrated below.
In principle this representation could be automatically generated from
the schema using the `XMLSchema` package, but that must wait until that
package is more mature.  Meanwhile, we rely on hand-coded classes and
hand-coded coercion functions.

The coercion functions take care of the translation into and out of the
XML (parsing and serializing) without any need for xpath expressions.
At the moment they are verbosely spelled out under the class
definitions in classes.R file, though ideally they could be abstracted
(e.g. as we do in `reml`).  Classes are based on the [inheritance
structure](https://github.com/ropensci/RNeXML/issues/1#issuecomment-22867535)
of the schema (unlike `reml`), which makes additional nodes much easier
to add and hence it is easier to extend this library. At this time
we have only certain core elements from the schema as map naturally to
`ape` trees, along with the essential annotation elements (`meta` nodes).
Support for additional classes / schema elements will be added as driven
by use cases.





(See the [Github page](https://github.com/ropensci/RNeXML) for the most recent tutorial, this is just added  here for my record).  

### Tutorial

The development version of RNeXML is [available on Github](https://github.com/ropensci/RNeXML).  With the `devtools` package installed on your system, RNeXML can be installed using:


```r
library(devtools)
install_github("RNeXML", "ropensci")
library(RNeXML)
```


Read in a `nexml` file into the `ape::phylo` format:


```r
f <- system.file("examples", "trees.xml", package = "RNeXML")
tr <- nexml_read(f, "phylo")
```

Write an `ape::phylo` tree into the `nexml` format, including optional metadata:


```r
nexml_write(bird.orders, "birds.xml", creator = "Carl Boettiger <cboettig@ropensci.org>", 
    title = "example NeXML file for bird orders", description = "Example phylogeny taken from the ape documentation showing the major bird orders")
```


### Next Steps

Developing use cases, soliciting input, and writing a manuscript... See issues log.  

- Outreach [#22](https://github.com/ropensci/RNeXML/issues/22)
- metadata use cases [#21](https://github.com/ropensci/RNeXML/issues/21)
- serializing metadata (implementation) [#18](https://github.com/ropensci/RNeXML/issues/18)
- Testing  [#15](https://github.com/ropensci/RNeXML/issues/15)




