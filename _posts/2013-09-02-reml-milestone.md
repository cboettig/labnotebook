---
layout: post
categories: ecology
tags: 
- ropensci

---


Reached a [milestone](https://github.com/ropensci/reml/issues/milestones?state=closed&with_issues=yes) in [reml](https://github.com/ropensci/reml) development today with basic implementation of reading, writing, and publishing valid EML files and a working test suite.  


### An S4-based structure

This involved a complete re-write of the pre-ESA code and is now completely S4-class based, allowing a more flexible structure that is easier and faster to extend.  For instance, rather than having to explicitly think about the commands to parse and serialize a new metadata element that needs to be added from the schema, we just define the class for the object.  Then we can leverage automated methods that can read into this class from XML and write out of it.  

For instance, we recently added the class `alternativeTimeScale` following it's [definition in the Schema documentation](knb.ecoinformatics.org/software/eml/eml-2.1.1/eml-coverage.html#alternativeTimeScale): 

```r
setClass("alternativeTimeScale",
         representation(timeScaleName = "character",
                        timeScaleAgeEstimate = "character",
                        timeScaleAgeUncertainty = "character",
                        timeScaleAgeExplanation = "character",
                        timeScaleCitation = "character") 
                        # FIXME should be citation type
        )
setAs("XMLInternalElementNode", "alternativeTimeScale",   function(from) emlToS4(from))
setAs("alternativeTimeScale", "XMLInternalElementNode",   function(from) S4Toeml(from))
```

Rather than bother with the XML parsing and serializing, we simply point R to use our predefined S4 coercion methods, specified after the class definition.  

Note this need a little more work as the FIXME note indicates, 
since we have not yet written the `citation` class. Luckily, using the S4 approach this will be easy to update once that class is defined.  In this manner, we can easily add elements that we need.  

Classes are defined in groups in files named after the class.  Constructor functions are defined in files named after the functions themselves, which prefix `eml_` to the class name.  This adds some clarity (e.g. calling a function `eml_dataset` vs `dataset`) can also reduce namespace collisions.  

**Note** that the S4 code is intended only to be developer-facing.  Users interact with documented constructor functions, which have more end-user documentation (though still in development).  


Examples of reading, writing, and publishing EML
------------------------------------------------

```r
library("devtools")
install_github("reml", "ropensci")
```


Load the package:


```r
library("reml")
```



### Writing R data into EML



Consider some dataset as an R `data.frame`.  


```r
dat = data.frame(river = c("SAC", "SAC", "AM"),
                 spp   = c("king", "king", "ccho"),
                 stg   = c("smolt", "parr", "smolt"),
                 ct    =  c(293L, 410L, 210L))
```




Provide a list giving the  __column header__ used in the data.frame, followed by a plain text definitions for the column, followed by a character vector giving the definition for the units:  

__column descriptions__: These are usually just plain text definitions, though a URI to a semantic definition can be particularly powerful. See "Advanced Use" for details on adding richer information, such as the method used to collect the data or set the geographic, taxonomic, or temporal coverage of an individual column.   

__column units__:   For factors, this is a definition of the levels involved.  For numeric data, specify the units from [this list](http://knb.ecoinformatics.org/software/eml/eml-2.1.1/eml-unitTypeDefinitions.html#StandardUnitDictionary).  For dates, specify the format, (e.g. YYYY or MM-DD-YY). For character strings, a definition of the kind of string can be given, (e.g. species scientific name), otherwise the column description will be used.  




```r
metadata <- 
  list("river" = list("river",
                      "River site used for collection",
                      c(SAC = "The Sacramento River", 
                        AM = "The American River")),
       "spp" = list("spp",
                    "Species common name", 
                    c(king = "King Salmon", 
                      ccho = "Coho Salmon")),
       "stg" = list("stg",
                    "Life Stage", 
                    c(parr = "third life stage", 
                      smolt = "fourth life stage")),
       "ct"  = list("ct",
                    "count", 
                    "number"))
```


*for convenience, this metadata list can instead be constructed with the help of the reml wizard*.  Just use `metadata <- metadata_wizard(dat)` to begin. While this may be helpful starting out, regular users will find it faster to define the columns and units directly in the format above.   




```r
eml_write(dat, metadata, title = "reml example",  
          description = "An example, intended for
                              illustrative purposes only.",
          creator = "Carl Boettiger <cboettig@gmail.com>",
          file = "reml_example.xml")
```

```
[1] "reml_example.xml"
```


See the [EML generated](https://github.com/ropensci/reml/tree/master/inst/doc/reml_example.xml) by this example.  Note that if the `metadata` argument providing the definitions for the `data.frame` is not specified, `reml` will launch the wizard to prompt the user.  

##### Configuration 

Configure general metadata you may want to frequently reuse, avoiding having to specify things like the name of the creator or contact.


```r
eml_config(creator = list("Carl Boettiger <cboettig@ropensci.org>", "Karthik Ram"), contact = "Carl Boettiger <cboettig@ropensci.org>")
```



* See [Open issues in writing EML](https://github.com/ropensci/reml/issues?labels=write+eml&page=1&state=open)

### Publish EML

Once we have generated a basic EML file, we can publish it to a variety
of academic repositories where it will be indexed, permenently archived,
more easily citable, and publicly discoverable.

In this example, we will publish the above
EML to [figshare](http://figshare.com) using the
[rfigshare](https://github.com/ropensci/rfigshare) package. Like most
academic repostories, figshare requires some basic metadata for any entry.
Much of this we can automatically extract from our existing EML file. 
Additional metadata unique to figshare (e.g. matching it's allowed "categories"
can also be provided. 

_Note: this example assumes `rfigshare` is installed, even though it is not 
required to use reml and run the examples in the other sections_

```r
id = eml_publish("reml_example.xml", description="Example EML file from reml", categories = "Ecology", tags = "EML", destination="figshare")
```


This creates a draft file visible only to the user configured in `rfigshare`.  The document can be made (permanently) public using either the figshare web interface, the `rfigshare` package (using `fs_make_public(id)`) or just by adding the argument `visibility = TRUE` to the above `eml_publish` command.


### Reading EML


```r
obj <- eml_read("reml_example.xml")
```

We can use various accessor functions to return the data and metadata elements in native R formats.


```r
dataTable(obj)
```

```
  river  spp   stg  ct
1   SAC king smolt 293
2   SAC king  parr 410
3    AM ccho smolt 210
```



```r
metadata <- attributeList(obj)
```



```r
contact(obj)
```

```
[1] "Carl Boettiger <cboettig@gmail.com>"
```


Note that the contact has been coerced into R's built-in 'person' object:


```r
class(contact(obj))
```

```
[1] "person"
```



```r
citationInfo(obj)
```

```
Boettiger, Carl, 2013. reml example.
```




Vignette + read and extract examples


Notes
-----


- Resolved the strange segfault errors that arise unpredictably in tests by avoiding use of `XMLInternalDocument` class.  (Perhaps it is referencing the nodes after writing this and finding they have no address that causes this error?)  Now segfault free.  


- Still need to fix external validator test (currently not run by `testthat::test_dir` by avoiding the `test_` prefix on the filename...) **EDIT** 2013-09-05 Duncan has [fixed]() this, looking into having the form give more structured output.  

- **Edit** 2013-09-04 some attribute definitions were not being written out correctly and have now been fixed.  Still writing the [test cases](). 



Where next?
----------


Lots more can be done on the package, as documented in our extensive [issues](https://github.com/ropensci/reml/issues) list and the discussions there-in.  
 
Further development will be driven around identifying and illustrating some particularly motivating use-cases beyond the basic creation and reading in of EML files, adding what additional functionality and debugging is required along the way.  
