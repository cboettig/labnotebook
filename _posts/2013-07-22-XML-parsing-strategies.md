---
layout: post
subtitle: parsing NeXML
category: evolution
tags: 
- ropensci
- open-science
- xml-standards
---


Writing out some advice for our GSOC student on XML parsing.  (Now filed as [RNeXML/#11](https://github.com/shumelchyk/RNeXML/issues/11)

-------------------------------

Here is some quick background on different ways we might go about extracting NeXML into an R object we want to work with.  We can use S4 classes, R's native `data.frame` and `list` types, or extract specific terms of interest with xpath.  I illustrate each of these below using the example "trees.xml" in your repository.  


It would be good to decide on which strategy you want.  As you seem to be leaning to the S4 already, note how I have made the slot labels correspond exactly to the attribute and node labels of the NeXML.  This lets us use the `xmlToS4` method:


## Using S4 classes 

We can define S4 class structures to correspond to the elements we want to extract.  Elements omitted from our definition will be ignored.  

```r
setClass("node",
    representation(id    = "character",
                   label = "character",
                   otu   = "character",
                   about = "character",
                   meta = "meta"))
```
Note that class "meta" is not yet defined, we will define it below.  Note also that we could omit any slots we don't care about, and they would simply be ignored.  (Try deleting the `meta` line, or the `about` line.)


```r
setClass("edge",
    representation(source = "character",
                   target = "character",
                   id     = "character",
                   length = "numeric"))
```



```r
setClass("meta",
         representation(id ="character",
                        property="character",
                        content="logical",
                        'xsi:type'="character",
                        datatype="character"))

setAs("XMLInternalElementNode", "meta", function(from) xmlToS4(from))
```

In order for `xmlToS4` to work on nodes, I need the Coercion method for `meta` too, defined above.  We are now ready to rock and roll:


```r
require(XML)
doc <- xmlParse("tests/examples/trees.xml")

edges <- getNodeSet(doc, "//x:tree[@id = 'tree1']/x:edge", namespaces="x")
edges <- lapply(edges, xmlToS4)

nodes <- getNodeSet(doc, "//x:tree[@id = 'tree1']/x:node", namespaces="x")
nodes <- lapply(nodes, xmlToS4)
```

My opinion is that we should not bother writing validator methods etc for these classes we have just defined at this time.  We can already validate the XML produced against the schema, and as the class definitions follow those from the schema, we should be reasonably robust.  Happy to hear counter-arguments.  



## Extracting Attributes or values directly by xpath query

A different route does not define class types at all, but just extracts the attributes we want.  This is a bit more fast and loose.    

```r
edges = xpathSApply(doc, "//x:tree[@id = 'tree1']/x:edge", namespaces = "x", xmlAttrs)
nodes = xpathSApply(doc, "//x:tree[@id = 'tree1']/x:node", namespaces = "x", 
  function(x) 
    c(xmlGetAttr(x, "id", NA, as.character),  
      xmlGetAttr(x, "otu", NA, as.character)))
```

## Coercing into standard R forms 

This approach can be very quick and powerful if the data conforms to this structure.  

```r
XML:::xmlAttrsToDataFrame(getNodeSet(doc, "//x:tree[@id = 'tree1']/x:node", namespaces="x"))
XML:::xmlAttrsToDataFrame(getNodeSet(doc, "//x:tree[@id = 'tree1']/x:edge", namespaces="x"))
```

## without XPath

We can skip over XPath based expressions by using xmlToList immediately:

```r
nex <- xmlToList(doc)
```

Unfortunately, this will do some possibly unexpected things: for instance, attributes are converted to list elements (`node$id`, `node$otu`, etc) on simple nodes (e.g. `<nodes>` without a `<meta>` node), while if they contain another node, attributes are one sub-list and the containing nodes another (e.g. `node$meta` and `node$.attr`, etc)

Also note that instead of xpath queries as in the `xpathSApply` and  `getNodeSet` examples above, we can index nodes the way would lists:

e.g.  `xmlRoot(doc)[["trees"]][["tree"]]` instead of `getNodeSet(doc, "//trees/tree")[[1]]` (note that the former returns the first `<tree>` node in the `<trees>` node, while the latter returns all `<tree>` nodes unless we just ask for the `[[1]]`

So this gives us a table of all node and edge elements:

```r
XML:::xmlAttrsToDataFrame(xmlRoot(doc)[["trees"]][["tree"]])
```

Which gives us:

```r
   id label root  otu about source target  length
1  n1    n1 true <NA>  <NA>   <NA>   <NA>    <NA>
2  n2    n2 <NA>   t1  <NA>   <NA>   <NA>    <NA>
3  n3    n3 <NA> <NA>  <NA>   <NA>   <NA>    <NA>
4  n4    n4 <NA> <NA>   #n4   <NA>   <NA>    <NA>
5  n5    n5 <NA>   t3  <NA>   <NA>   <NA>    <NA>
6  n6    n6 <NA>   t2  <NA>   <NA>   <NA>    <NA>
7  n7    n7 <NA> <NA>  <NA>   <NA>   <NA>    <NA>
8  n8    n8 <NA>   t5  <NA>   <NA>   <NA>    <NA>
9  n9    n9 <NA>   t4  <NA>   <NA>   <NA>    <NA>
10 e1  <NA> <NA> <NA>  <NA>     n1     n3 0.34534
11 e2  <NA> <NA> <NA>  <NA>     n1     n2  0.4353
12 e3  <NA> <NA> <NA>  <NA>     n3     n4   0.324
13 e4  <NA> <NA> <NA>  <NA>     n3     n7  0.3247
14 e5  <NA> <NA> <NA>  <NA>     n4     n5   0.234
15 e6  <NA> <NA> <NA>  <NA>     n4     n6  0.3243
16 e7  <NA> <NA> <NA>  <NA>     n7     n8 0.32443
17 e8  <NA> <NA> <NA>  <NA>     n7     n9  0.2342
```

Sometimes this notation is cleaner than the xpath, sort of up to you.  



