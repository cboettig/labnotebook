---
layout: post
categories: ecology
tags:
- ropensci
- eml

---

Started [`reml`](https://github.com/ropensci/reml), and R package for reading, writing, manipulating and publishing EML files.  More details and progress so far on the Github page; in particular flushing out design goals in the [issues tracker](https://github.com/ropensci/reml/issues).  

### Initial goals

To start, I am aiming for a proof of principle case in which we can write an R `data.frame` into EML ([issue #2](https://github.com/ropensci/reml/issues/2)), publish to a remote repository such as figshare ([issue #3](https://github.com/ropensci/reml/issues/3)), and then read the data back in as the original R object types from the EML ([issue #6](https://github.com/ropensci/reml/issues/6)).  This will require specifying some generic metadata and basic column and unit metadata for the data frame.  It would be good to get feedback on what way is most convenient to specify the required metadata in R.  


### Integration goals (issue [#8](https://github.com/ropensci/reml/issues/8))

This is the __holy grail__ of metadata infrastructure and ostensibly the primary purpose of EML, see [Jones et al 2006].  Despite that, integration is not actually possible without semantic definitions as well, see [Michener & Jones 2012], from which we adapt this minimal example below.  

This example provides minimal and sometimes missing semantics; which may make it unresolvable.  A complete semantic solution is diagrammed in the figure from  [Michener & Jones 2012].  


### Dataset 1 

```ruby
 dat = data.frame(river=c("SAC", "SAC", "AM"), 
                   spp = c("king", "king", "ccho"), 
                   stg = c("smolt", "parr", "smolt"),
                   ct =  c(293L, 410L, 210L))

 col_metadata = c(river = "http://dbpedia.org/ontology/River",
                  spp = "http://dbpedia.org/ontology/Species", 
                  stg = "Life history stage",
                  ct = "count")

 unit_metadata = 
  list(river = c(SAC = "The Sacramento River", AM = "The American River"),
       spp = c(king = "King Salmon", ccho = "Coho Salmon"),
       stg = c(parr = "third life stage", smolt = "fourth life stage"),
       ct = "number")

```

### Dataset 2

```ruby
 dat = data.frame(site = c("SAC", "AM", "AM"), 
                   species = c("Chinook", "Chinook", "Silver"), 
                   smct = c(245L, 511L, 199L),
                   pcnt =  c(290L, 408L, 212L))

 col_metadata = c(site = "http://dbpedia.org/ontology/River",
                  species = "http://dbpedia.org/ontology/Species", 
                  smct = "Smolt count",
                  pcnt = "Parr count")

 unit_metadata = 
  list(river = c(SAC = "The Sacramento River", AM = "The American River"),
       spp = c(Chinook = "King Salmon", Silver = "Coho Salmon"),
       smct = "number",
       pcnt = "number")

```

### Figure 

![ontology_synthesis2](https://f.cloud.github.com/assets/222586/710800/c0d567b6-de83-11e2-94b1-52090b0c9a5f.png)




[Jones et al 2006]: http://dx.doi.org/10.1146/annurev.ecolsys.37.091305.110031 "The New Bioinformatics: Integrating Ecological Data from the Gene to the Biosphere in Annual Review of Ecology, Evolution, and Systematics"
 
[Michener & Jones 2012]: http://dx.doi.org/10.1016/j.tree.2011.11.016 "Ecoinformatics: supporting ecology as a data-intensive science; in Trends in Ecology & Evolution. doi: 10.1016/j.tree.2011.11.016"


