---
layout: post
category: ecology
tags:
- ropensci
- eml
code: true

---

Made substanial progress on the [reml](https://github.com/ropensci/reml) project. We have reached our [first milestone](https://github.com/ropensci/reml/issues?milestone=1&state=closed), being able to:

- Successfully validate the EML generated ([#28](https://github.com/ropensci/reml/issues/28))
- Start a unit test suite write eml unit tests ([#14](https://github.com/ropensci/reml/issues/14))
- Extract appropriate R objects from EML dataTable read eml ([#6](https://github.com/ropensci/reml/issues/6))
- Add function to publish EML data through figshare publish eml ([#3](https://github.com/ropensci/reml/issues/3))
- Generate an EML file given a data.frame and appropriate metadata write eml ([#2](https://github.com/ropensci/reml/issues/2))

As illustrated by the example shown in the Readme:  


Writing R data into EML
-----------------------

Install and load:

```r
install.packages("uuid",,'http://rforge.net/',type='source')
library("devtools")
install_github("reml", "ropensci")
library("reml")
```



Configure general metadata you may want to reuse again and again through settings:


```r
 eml$set(contact_givenName = "Carl", contact_surName = "Boettiger", contact_email = "cboettig@ropensci.org")
```


Consider some dataset as an R `data.frame`.  


```r
  dat = data.frame(river=c("SAC", "SAC", "AM"),
                        spp = c("king", "king", "ccho"),
                        stg = c("smolt", "parr", "smolt"),
                        ct =  c(293L, 410L, 210L))
```




Provide definitions for the columns.  These are usually just plain text definitions, though a URI to a semantic definition can be particularly powerful. See "Advanced Use" for details on adding richer information, such as the method used to collect the data or set the geographic, taxanomic, or temporal coverage of an individual column.   


```r
      col_metadata = c(river = "http://dbpedia.org/ontology/River",
                       spp = "http://dbpedia.org/ontology/Species",
                       stg = "Life history stage",
                       ct = "count")
```


Define the units used in each column.  For factors, this is a definition of the levels involved.  For numeric data, specify the units from [this list](http://knb.ecoinformatics.org/software/eml/eml-2.1.1/eml-unitTypeDefinitions.html#StandardUnitDictionary).  For dates, specify the format, (e.g. YYYY or MM-DD-YY). For character strings, a definition of the kind of string can be given, (e.g. species scientific name), otherwise the column description will be used.  


```r
      unit_metadata =
       list(river = c(SAC = "The Sacramento River", AM = "The American River"),
            spp = c(king = "King Salmon", ccho = "Coho Salmon"),
            stg = c(parr = "third life stage", smolt = "fourth life stage"),
            ct = "number")
```


The hard work is over, time to generate some EML.


```r
eml_write(dat, col_metadata, unit_metadata, .title="A test EML file", file="my_eml_data.xml", file_description="Test data, only intended for testing")
```


See the [EML generated](https://github.com/ropensci/reml/tree/master/inst/doc/my_eml_data.xml) by this example.


Publish EML
-----------

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

```r
id = eml_publish("my_eml_data.xml", description="Example EML file from reml", 
                categories = "Ecology", tags = "EML", destination="figshare")
```

