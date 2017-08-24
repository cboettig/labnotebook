---
layout: post
title: "Notebook Features: parsing linked data in the semantic notebook"
code: true
category: open-science
tags: 
- notebook-technology
- semantics
- blog

---


In a [post a while back](/2011/05/08/building-a-semantic-notebook.html) I originally put forward the idea of a semantic lab notebook.  Semantics, or linked data, are among the most powerful concepts to emerge in online science for scholarly data organization and communication.  I have slowly been adding and exploring new ways to introduce semantic concepts into the notebook, which I have documented along the way under my [#semantics](http://www.carlboettiger.info/tags.html#semantics) tag. In this post, rather than discuss how to generate the semantic data, I try to focus on some of the things we can *do* with it.  This really just scratches the surface of possibilities, but should at least illustrate the general idea. 


We will start with some very simple examples exploiting the semantics inherent in HTML5.  We can then work up to richer examples that rely on XML-based parsing.  The richest potential of the semantic notebook lies in leveraging the RDFa content, whose terms are defined as ontologies over which a machine can apply reasoning and formal logic against other web content (see, e.g. <span class="showtooltip" title="Shadbolt N, Berners-Lee T and Hall W (2006). The Semantic Web
Revisited. _Ieee Intelligent Systems_, *21*, pp. 96-101. ISSN
1541-1672,  http://dx.doi.org/10.1109/MIS.2006.62."><a href="http://dx.doi.org/10.1109/MIS.2006.62" rel="http://purl.org/spar/cito/obtainsBackgroundFrom" >Shadbolt _et. al._ (2006)</a></span>  for further unformation).  Though we show how to extract the and parse the RDF here, exploiting the RDF in the last example must wait to a later post.  





## Parsing semantic HTML

Our first set of examples will address parsing the semantic HTML directly.  For background on how these elements are added to the notebook, see [this entry](/2012/10/14/semantic-lab-notebook.html).  We will use R with it's excellent collection of web, XML parsing, and text-mining tools to take advantage of the semantic structure.  First we load the required packages,



```r
library(RCurl)
library(XML)
library(tm)
library(wordcloud)
library(RColorBrewer)
```


We can get a list of pages to download from the sitemap


```r
pagelist <- readLines("http://carlboettiger.info/sitemap.txt")
pagelist <- pagelist[grep("/201\\d/", pagelist)]  # drop non-posts)
pages <- lapply(pagelist, getURLContent, followlocation = TRUE)
```



Or, if an archive is available locally, (e.g. from figshare cache), we can read the files in directly.  



```r
pages <- system("ls ~/Documents/labnotebook/_site/2***/*/*/*.html", 
    intern = TRUE)
```


We parse each of the pages as HTML so that we can manipulate them with XML tools



```r
html <- lapply(pages, htmlParse)
```


For instance, we can easily get the content of all entries:


```r
text <- sapply(html, xpathSApply, "//article", xmlValue)
```


We can also extract metadata based on the semantic markup.  


```r
titles <- sapply(html, xpathSApply, "//title", xmlValue)
categories <- sapply(html, xpathSApply, "//node()[@class='category']", 
    xmlValue)
tags <- sapply(html, xpathSApply, "//node()[@class='tag']", xmlValue)
```


R makes it easy to summarize this data, e.g. by generating a table of the number of entries in each category, or a wordcloud of the tags.  


```r
table(unlist(categories))
```

```

 computation      ecology    evolution open-science     teaching 
          40          376          287           85           17 
```

```r
wordcloud(Corpus(VectorSource(tags)))
```

![](http://farm9.staticflickr.com/8258/8620398951_0c2fd56e26_o.png) 


### Extracting citations

Citation information can be encoded 

We can perform more direct text mining as well. For instance, we extract all DOIs found in the text: 


```r
doi_pattern = "\\b(10[.][0-9]{4,}(?:[.][0-9]+)*/(?:(?![\"&'<>])\\S)+)\\b"
require(gsubfn)
dois <- strapply(text, doi_pattern, perl = TRUE)  #text[-462]
head(sort(table(unlist(dois))))
```

```

10.1002/(SICI)1520-6602(1998)1:1                 10.1002/bjs.6880 
                               1                                1 
                10.1002/etc.2140           10.1006/jtbi.1998.0660 
                               1                                1 
          10.1006/jtbi.2000.1080           10.1006/jtbi.2001.2299 
                               1                                1 
```


Or generate a wordcloud of the full text 


```r

carl <- Corpus(VectorSource(text))
carl <- tm_map(carl, removePunctuation)
carl <- tm_map(carl, tolower)
carl <- tm_map(carl, function(x) removeWords(x, stopwords()))

carl.tdm <- TermDocumentMatrix(carl)
carl.m <- as.matrix(carl.tdm)
carl.v <- sort(rowSums(carl.m), decreasing = TRUE)
carl.d <- data.frame(word = names(carl.v), freq = carl.v)


wordcloud(carl.d$word, carl.d$freq, scale = c(8, 0.4), min.freq = 3, 
    max.words = 100, random.order = FALSE, rot.per = 0.15, colors = brewer.pal(8, 
        "Dark2"))
```

![](http://farm9.staticflickr.com/8385/8621498714_2fe3e04226_o.png) 


## RDFa parsing

RDF triples are the mainstay of semantic, linked data.  Unlike the more text-mining oriented examples above, data in this format follows a strict and universal standard which allows a machine to identify meaning rather precisely.  Critically, this allows one to automatically link data appearing in the notebook to data elsewhere on the web without the ambiguities of natural language that for instance, might confuse the animal jaguar with the car.  


RDFa is a way of adding these precise statements to HTML, again see the [earlier entry](/2012/10/14/semantic-lab-notebook.html) on how this is done.  The technically inclined will note that the namespaces of the RDFa itself are not accessible in the XML parsing we used above, since they do not correspond to nodes or attributes, but appear only in the values of attributes.  Fortunately, there are many excellent tools to extract this RDFa data, turning it into the XML formatted RDF triples we need.  e can perform this using the [Any23](http://any23.org) API


```r
download.file(paste("http://any23.org/rdfxml", "http://carlboettiger.info", 
    sep = "/"), "temp.xml")
doc <- xmlParse("temp.xml")
```


Which creates a beautiful RDF XML file of all linked data found in the entry.   


```r
doc
```

```
<?xml version="1.0" encoding="UTF-8"?>
<rdf:RDF xmlns:xhtml="http://www.w3.org/1999/xhtml/vocab#" xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="http://www.carlboettiger.info/">
    <dcterms:title xml:lang="en">Carl Boettiger</dcterms:title>
    <xhtml:license rdf:resource="http://creativecommons.org/publicdomain/zero/1.0/"/>
    <dcterms:title xml:lang="en">Carl Boettiger</dcterms:title>
    <dcterms:creator xml:lang="en">Carl Boettiger</dcterms:creator>
    <dcterms:date xml:lang="en">2013-04-04T11:07:14-07:00</dcterms:date>
    <dcterms:format xml:lang="en">text/html</dcterms:format>
    <dcterms:language xml:lang="en">en</dcterms:language>
    <dcterms:identifier xml:lang="en">/index.html</dcterms:identifier>
    <dcterms:rights xml:lang="en">CC0</dcterms:rights>
    <dcterms:source xml:lang="en">Lab Notebook</dcterms:source>
    <dcterms:subject xml:lang="en">Ecology</dcterms:subject>
    <dcterms:type xml:lang="en">website</dcterms:type>
    <title xmlns="http://ogp.me/ns#" xml:lang="en">Carl Boettiger</title>
    <author xmlns="http://ogp.me/ns#" xml:lang="en">http://www.carlboettiger.info/index.html#me</author>
    <first_name xmlns="http://ogp.me/ns/profile#" xml:lang="en">Carl</first_name>
    <last_name xmlns="http://ogp.me/ns/profile#" xml:lang="en">Boettiger</last_name>
    <published_time xmlns="http://ogp.me/ns/article#" xml:lang="en">2013-04-04T11:07:14-07:00</published_time>
    <site_name xmlns="http://ogp.me/ns#" xml:lang="en">Lab Notebook</site_name>
    <url xmlns="http://ogp.me/ns#" xml:lang="en">http://www.carlboettiger.info/index.html</url>
    <type xmlns="http://ogp.me/ns#" xml:lang="en">website</type>
  </rdf:Description>
  <rdf:Description rdf:about="http://carlboettiger.info#me">
    <rdf:type rdf:resource="http://xmlns.com/foaf/0.1/Person"/>
    <rdf:type rdf:resource="http://schema.org/Person#Person"/>
  </rdf:Description>
  <rdf:Description rdf:about="http://www.carlboettiger.info/assets/img/carlboettiger.png">
    <depiction xmlns="http://xmlns.com/foaf/0.1/" xml:lang="en"/>
  </rdf:Description>
  <rdf:Description rdf:about="http://carlboettiger.info">
    <homepage xmlns="http://xmlns.com/foaf/0.1/" rdf:resource="http://carlboettiger.info"/>
    <url xmlns="http://schema.org/Person#" rdf:resource="http://carlboettiger.info"/>
    <name xmlns="http://xmlns.com/foaf/0.1/" xml:lang="en">Carl Boettiger</name>
  </rdf:Description>
  <rdf:Description rdf:about="http://carlboettiger.info#me">
    <jobTitle xmlns="http://schema.org/Person#" xml:lang="en">a post-doctoral researcher</jobTitle>
  </rdf:Description>
  <rdf:Description rdf:nodeID="node17eprp1n4x899515">
    <rdf:type rdf:resource="http://xmlns.com/foaf/0.1/Person"/>
  </rdf:Description>
  <rdf:Description rdf:about="http://carlboettiger.info#me">
    <knows xmlns="http://xmlns.com/foaf/0.1/" rdf:nodeID="node17eprp1n4x899515"/>
  </rdf:Description>
  <rdf:Description rdf:nodeID="node17eprp1n4x899515">
    <homepage xmlns="http://xmlns.com/foaf/0.1/" rdf:resource="http://users.soe.ucsc.edu/~msmangel/"/>
  </rdf:Description>
  <rdf:Description rdf:about="http://carlboettiger.info#me">
    <knows xmlns="http://xmlns.com/foaf/0.1/" rdf:nodeID="node17eprp1n4x899515"/>
  </rdf:Description>
  <rdf:Description rdf:about="http://users.soe.ucsc.edu/~msmangel/">
    <name xmlns="http://xmlns.com/foaf/0.1/" xml:lang="en">Marc Mangel</name>
  </rdf:Description>
  <rdf:Description rdf:nodeID="node17eprp1n4x899516">
    <rdf:type rdf:resource="http://xmlns.com/foaf/0.1/Person"/>
    <homepage xmlns="http://xmlns.com/foaf/0.1/" rdf:resource="http://swfsc.noaa.gov/staff.aspx?&amp;id=17294"/>
  </rdf:Description>
  <rdf:Description rdf:about="http://swfsc.noaa.gov/staff.aspx?&amp;id=17294">
    <name xmlns="http://xmlns.com/foaf/0.1/" xml:lang="en">Steve Munch</name>
  </rdf:Description>
  <rdf:Description rdf:about="http://carlboettiger.info#me">
    <affiliation xmlns="http://schema.org/Person#" rdf:resource="http://boe.ucsc.edu/~msmangel/CSTAR.html"/>
    <workplaceHomepage xmlns="http://xmlns.com/foaf/0.1/" rdf:resource="http://www.ucsc.edu/"/>
    <weblog xmlns="http://xmlns.com/foaf/0.1/" rdf:resource="http://www.carlboettiger.info/lab-notebook.html"/>
  </rdf:Description>
  <rdf:Description rdf:nodeID="node17eprp1n4x899517">
    <rdf:type rdf:resource="http://schema.org/PostalAddress"/>
    <address xmlns="http://schema.org/Person#" xml:lang="en">Center for Stock Assessment Research, 110 Shaffer Rd, Santa Cruz, CA 95050, USA</address>
    <streetAddress xmlns="http://schema.org/PostalAddress/" xml:lang="en">Center for Stock Assessment Research, 110 Shaffer Rd</streetAddress>
    <addressLocality xmlns="http://schema.org/PostalAddress/" xml:lang="en">Santa Cruz</addressLocality>
    <addressRegion xmlns="http://schema.org/PostalAddress/" xml:lang="en">CA</addressRegion>
    <postalCode xmlns="http://schema.org/PostalAddress/" xml:lang="en">95050</postalCode>
    <addressCountry xmlns="http://schema.org/PostalAddress/" xml:lang="en">USA</addressCountry>
  </rdf:Description>
  <rdf:Description rdf:about="https://orcid.org/0000-0002-1642-628X">
    <orcid xmlns="http://purl.org/spar/datacite/" rdf:resource="https://orcid.org/0000-0002-1642-628X"/>
  </rdf:Description>
  <rdf:Description rdf:about="http://www.carlboettiger.info#me">
    <rdf:type rdf:resource="http://xmlns.com/foaf/0.1/Person"/>
    <account xmlns="http://xmlns.com/foaf/0.1/" rdf:resource="http://www.cloudflare.com/email-protection#f497969b9180809d93b49399959d98da979b99"/>
    <account xmlns="http://xmlns.com/foaf/0.1/" rdf:resource="https://twitter.com/cboettig"/>
    <account xmlns="http://xmlns.com/foaf/0.1/" rdf:resource="https://github.com/cboettig"/>
  </rdf:Description>
  <rdf:Description rdf:about="http://www.carlboettiger.info/">
    <license xmlns="http://www.carlboettiger.info/" rdf:resource="http://creativecommons.org/publicdomain/zero/1.0/"/>
    <license xmlns="http://creativecommons.org/ns#" rdf:resource="http://creativecommons.org/publicdomain/zero/1.0/"/>
  </rdf:Description>
</rdf:RDF>
 
```


We can now explore this data using the XML tools illustrated above.  The rigidity of the XML rather than HTML parsing and the use of namespaces gives us greater precision.  
