---
layout: post
category: evolution
tags: 
- informatics
- RNeXML
- ropensci 

---

(From issue [#20](https://github.com/ropensci/RNeXML/issues/20))

### Basic metadata queries

a question of how the user queries that metadata.  Currently we have a `metadata` function that simply extracts all the metadata at the specified level (nexml, otus, trees, tree, etc) and returns a named character string in which the name corresponds to the `rel` or `property` and the value corresponds to the `content` or `href`, e.g.:

```r
birds <- read.nexml("birdOrders.xml")
meta <- get_metadata(birds) 
```

prints the named string with the top-level (default-level) metadata elements as so: 

```r
> meta 
##                                             dc:date 
##                                        "2013-11-17" 
##                                          cc:license 
## "http://creativecommons.org/publicdomain/zero/1.0/"
```
Which we can subset by name, e.g.  `meta["dc:date"]`.   This is probably simplest to most R users; though exactly what the namespace prefix means may be unclear if they haven't worked with namespaces before.  (The user can always print a summary of the namespaces and prefixes in the nexml file using `birds@namespaces`).  

This approach is simple, albeit a bit limited.  

### XPath queries

For instance, the R user has a much more natural and powerful way to handle these issues of prefixes and namespaces using either the XML or rrdf libraries.  For instance, if we extract meta nodes into RDF-XML, we could handle the queries like so:

```r
xpathSApply(meta, "//dc:title", xmlValue)
```

which uses the namespace prefix defined in the nexml; or 

```r
xpathSApply(meta, "//x:title", xmlValue, namespaces=c(x = "http://purl.org/dc/elements/1.1/"))
```
defining the custom prefix `x` to the URI


### Sparql queries

Pretty exciting that qe can make arbitrary SPARQL queries of the metadata as well.  

```r
library(rrdf)
sparql.rdf(ex, "SELECT ?title WHERE { ?x <http://purl.org/dc/elements/1.1/title> ?title })
```

Obviously the XPath or SPARQL queries are more expressive / powerful than drawing out the metadata from the S4 structure directly.  On the other hand, because both of these approaches use just the distilled metadata, the original connection between metadata elements and the structure of the XML tree is lost unless stated explicitly.  An in-between solution is to use XPath on the nexml XML instead, though I think we cannot make use of the namespaces in that case, since they appear in attribute values rather than structure.  



Anyway, it's nice to have these options in R, particularly for more complex queries where we might want to make some use of the ontology as well.  On the other hand, simple presentation of basic metadata is probably necessary for most users.  


Would be nice to illustrate with a query that required some logical deduction from the ontology.  
