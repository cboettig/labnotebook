---
comments: true
date: 2011-05-16 19:46:54
layout: post
slug: treebase-in-r-a-first-tutorial
title: 'TreeBASE in R: a first tutorial'
redirects: [/wordpress/archives/1702, /archives/1702]
categories:
- evolution
tags:
- R
- treebase
---

My TreeBASE R package is essentially functional now.  Here's a quick tutorial on the kinds of things it can do.  Grab the [treebase package here](https://github.com/cboettig/treeBASE/archives/master), install and load the library into R.

TreeBASE provides two APIs to query the database, one which searches by the metadata associated with different publications (called [OAI-PMH](http://sourceforge.net/apps/mediawiki/treebase/index.php?title=OAI-PMH)), and another which queries the phylogenies directly (called [Phylo-ws](http://sourceforge.net/apps/mediawiki/treebase/index.php?title=API)).  They have somewhat redundant functions, but for our purposes the second one returns the actual data, while the first returns metadata.  A few examples will best illustrate how this all works.  We start with some queries of the metadata directly without downloading any trees.



	
  1. Trees can be downloaded with search_treebase(), using a variety of search conditions provided by Phylo-ws API.

	
  2. Metadata can be searched by date using search_metadata.  Just Download all metadata for finer queries.

	
  3. Metadata for a study can be grabbed using the study id.


A few examples will better illustrate how this all works.


## Metadata queries


How has TreeBASE grown since it's inception?  Let's grab the metadata for all entries and histogram by publication year:


```r


all <- search_metadata("", by="all")
dates <- sapply(all, function(x) as.numeric(x$date))
hist(dates, main="TreeBase growth", xlab="Year")


```


![](data:image/png;base64,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)


What journals have submitted the most studies to treebase?


```r


journals <- sapply(all, function(x) x$publisher)
J <- tail(sort(table(as.factor(unlist(journals)))),5)
b <- barplot(as.numeric(J))
text(b, names(J), srt=70, pos=4, xpd=T)


```


![](data:image/png;base64,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)


How many have been submitted from _Nature_? _Science_?


```r


nature <- sapply(all, function(x) length(grep("Nature", x$publisher))>0)
science <- sapply(all, function(x) length(grep("^Science$", x$publisher))>0)

sum(nature)

> 11

sum(science)

> 8


```


Which studies were those?  Can I have those trees please?


```r


s <- get_study_id( all[nature] )

nature_trees <- sapply(s, function(x) search_treebase(x, "id.study"))


```


Other details associated with the study are certainly also available.  Since we downloaded all metadata we have this stored already.  Any tree downloaded stores the TreeBASE study id in $S.id, ((and the unique tree id in $Tr.id)) which we can use to look up the metadata again.


```r


plot(nature_trees[[1]][[1]]) #plot first tree in the first study in the set

all[nature][1] # Pull metadata from complete list

# Or look up again using the study id:

metadata(nature_trees[[1]][[1]]$S.id)


```



## Importing Phylogenies


We can query for phylogenies directly on an array of search criteria, such as study authors, taxa included, number of taxa, number of characters in the trait matrix, etc, as illustrated by the following examples.  A few queries that aren't built into the API (i.e. does the tree have branch lengths) are accomplished by filtering after downloading the tree, which is slower.


```r


## We'll often use max_trees in the example so that they run quickly,
# notice the quotes for species.
dolphins <- search_treebase('"Delphinus"', by="taxon", max_trees=5)
## can do exact matches
humans <- search_treebase('"Homo sapiens"', by="taxon", exact_match=TRUE, max_trees=10)
# all trees with 5 taxa
five <- search_treebase(5, by="ntax", max_trees = 10)
# These are different, a tree id isn't a Study id.  we report both
studies <- search_treebase("2377", by="id.study")
tree <- search_treebase("2377", by="id.tree")
c("TreeID" = tree$Tr.id, "StudyID" = tree$S.id)
# Only results wiht branch lengths
# Has to grab all the trees first, then toss out ones without branch_lengths
Near <- search_treebase("Near", "author", branch_lengths=TRUE)
length(Near)


```


These queries can be combined with metadata searches


```r


#### Metadata examples ###
# Use the OAI-PMH api to check out the metadata from the study in which tree is published:
metadata(Near[[1]]$S.id)
# or manualy give a sudy id
metadata("2377")

```



## Combining metadata and phylogeny queries


Metadata queries can optionally return only those studies added to TreeBASE before or after a given date:


```r


# Use that to get all trees "published" after 2010
# publication date is only a year
post2010 <- sapply(dates, function(x) 2010 < as.numeric(x))
s <- get_study_id( all[post2010] )
out <- lapply(s, function(x) search_treebase(x, "id.study"))
# Grab the trees entered since 2011: (some studies will have multiple trees)
#can compare dates with as.Date("2001-01-01", "%y-%m-%d) < as.Date ...
m <- search_metadata("2011-05-05", by="from")
s <- get_study_id(m)
out <- lapply(s, function(x) search_treebase(x, "id.study"))

```



## A simple meta-analysis


Of course, this capacity is most powerful not to merely get some summary statistics of the database, but repeat analyses of given studies or perform meta-analyses.  Most comparative phylogenetics methods require ultrametric trees.

We can assemble a simple pipeline to perform the meta-analysis across  all existing studies of whether phylogenies tend to fit a pure-birth or a  birth-death model more frequently:

As a proof-of-principle, we can create a pipeline that will estimate chronograms for all trees containing branchlengths in treebase.


```r


timetree <- function(tree){
check.na <- try(sum(is.na(tree$edge.length))>0)
if(is(check.na, "try-error") | check.na)
NULL
else
try( chronoMPL(multi2di(tree)) )
}
drop_errors <- function(trees){
## apply to a list of trees created with timetree to drop errors
tt <- tt[!sapply(trees, is.null)]
tt <- tt[!sapply(tt, function(x) is(x, "try-error"))]
print(paste("dropped", length(trees)-length(tt), "trees"))
tt

}

require(laser)
pick_branching_model <- function(tree){
 m1 <- try(pureBirth(branching.times(tree)))
 m2 <- try(bd(branching.times(tree)))
 as.logical(try(m2$aic < m1$aic))
}

# Return all treebase trees that have branch lengths
# This has to download every tree in treebase, so not superfast...
all <- search_treebase("Consensus", "type.tree", branch_lengths=TRUE)
tt <- drop_errors(sapply(all, timetree))
is_yule <- sapply(tt, pick_branching_model)
table(is_yule)

```



## Replicating individual studies


Replicating individual studies is a bit more challenging, mostly do to the quality of available data.  For instance, here is a nice recent study (Rowe _et. al._ 2011) that has nicely time calibrated chronograms (from BEAST, Figure 4) and species trees (using BEST, Figure 3), but it seems only the[ Mr. Bayes tree in Figure 2 is given in TreeBASE.](http://purl.org/phylo/treebase/dev/phylows/study/find?query=tb.identifier.study=10869&format=rss1&recordSchema=tree)

Further, replicating the study would require other data than the phylogenetic tree.  In the future we might hope that this data would appear on Dryad.  Dryad's web-based search frustratingly does not seem to allow a simple query by doi or treebase id, and a query by title returns a long list of [things that aren't this paper](http://datadryad.org/discover?&query=Recent+and+Rapid+Speciation+with+Limited+Morphological+Disparity+in+the+Genus+Rattus.&fq=dc.title%3ARecent+and+Rapid+Speciation+with+Limited+Morphological+Disparity+in+the+Genus+Rattus.&filtertype=*&filter=&rpp=10&sort_by=score&order=DESC&location=l2).

The Mendeley API (through my [RMendeley](https://github.com/cboettig/RMendeley) package) does a bit better at pulling out some metadata, but not much.  Querying by the doi we can't find the paper, but the pmid works:


```r


require(RMendeley)

details("21239388", "pmid")


```


[Some Dryad papers ](http://datadryad.org/handle/10255/dryad.1705)have phylogenies, and the data deposition includes the BEAST xml files necessary to reproduce the phylogenies, but not, it seems, the phylogenies themselves.  It would be great to have some good examples of papers with data up on both TreeBASE and Dryad. Further, a pipeline that could regenerate the trees from the alignments might be interesting.

RaXML for inferring branch lengths: A quick solution for trees that have only topologies would be to infer branch lengths conditional on the topology from the character matrix.  TreeBASE does not include this with the nexus file containing the tree, and would require a separate query to pull the character matrix.  This is handled in the read.nexus.data command.
## References

<p>Rowe K, Aplin K, Baverstock P and Moritz C (2011).
&ldquo;Recent And Rapid Speciation With Limited Morphological Disparity in The Genus Rattus.&rdquo;
<EM>Systematic Biology</EM>, <B>60</B>.
ISSN 1063-5157, <a href="http://dx.doi.org/10.1093/sysbio/syq092">http://dx.doi.org/10.1093/sysbio/syq092</a>.
