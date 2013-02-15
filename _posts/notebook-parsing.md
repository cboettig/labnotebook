---
layout: post
published: false

---


```r
opts_chunk$set(comment = NA, warning = FALSE, message = FALSE)
opts_knit$set(upload.fun = socialR::flickr.url)
```


## Parsing semantic HTML


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

 computation      ecology    evolution    logistics open-science 
          32          271          261           58           76 
     seminar     teaching 
          23           16 
```

```r
wordcloud(Corpus(VectorSource(tags)))
```

![plot of chunk unnamed-chunk-8](http://farm9.staticflickr.com/8507/8473830895_693f40f419_o.png) 



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
          10.1006/jtbi.2000.1080           10.1006/jtbi.2001.2299 
                               1                                1 
          10.1006/tpbi.1994.1002        10.1007/s00332-003-0534-4 
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

![plot of chunk unnamed-chunk-10](http://farm9.staticflickr.com/8241/8473831767_5270409d1d_o.png) 


## RDFa parsing


Unfortunately the namespaces of the RDFa itself are less useful in the XML parsing, since they do not correspond to nodes or attributes, but appear only in the values of attributes.  As such, they do not act as XML namespaces.  We would need to first convert the RDFa to RDF to parse them as XML. We can perform this using the [Any23](http://any23.org) API


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
    <dcterms:date xml:lang="en">2013-02-14T11:07:27-08:00</dcterms:date>
    <dcterms:type xml:lang="en">Lab Notebook Entry</dcterms:type>
    <dcterms:format xml:lang="en">text/html</dcterms:format>
    <dcterms:language xml:lang="en">en</dcterms:language>
    <dcterms:source xml:lang="en">Lab Notebook</dcterms:source>
    <title xmlns="http://ogp.me/ns#" xml:lang="en">Carl Boettiger</title>
    <author xmlns="http://ogp.me/ns#" xml:lang="en">http://www.carlboettiger.info/index.html</author>
    <first_name xmlns="http://ogp.me/ns/profile#" xml:lang="en">Carl</first_name>
    <last_name xmlns="http://ogp.me/ns/profile#" xml:lang="en">Boettiger</last_name>
    <published_time xmlns="http://ogp.me/ns/article#" xml:lang="en">2013-02-14T11:07:27-08:00</published_time>
    <site_name xmlns="http://ogp.me/ns#" xml:lang="en">Lab Notebook</site_name>
    <url xmlns="http://ogp.me/ns#" xml:lang="en">http://www.carlboettiger.info/index.html</url>
    <type xmlns="http://ogp.me/ns#" xml:lang="en">article</type>
  </rdf:Description>
  <rdf:Description rdf:about="http://carlboettiger.info#me">
    <rdf:type rdf:resource="http://xmlns.com/foaf/0.1/Person"/>
    <rdf:type rdf:resource="http://schema.org/PersonPerson"/>
  </rdf:Description>
  <rdf:Description rdf:about="http://www.carlboettiger.info/assets/img/carlboettiger.png">
    <depiction xmlns="http://xmlns.com/foaf/0.1/" xml:lang="en"/>
  </rdf:Description>
  <rdf:Description rdf:about="http://carlboettiger.info">
    <homepage xmlns="http://xmlns.com/foaf/0.1/" rdf:resource="http://carlboettiger.info"/>
    <Personurl xmlns="http://schema.org/" rdf:resource="http://carlboettiger.info"/>
    <name xmlns="http://xmlns.com/foaf/0.1/" xml:lang="en">Carl Boettiger</name>
    <Personname xmlns="http://schema.org/" xml:lang="en">Carl Boettiger</Personname>
  </rdf:Description>
  <rdf:Description rdf:about="http://carlboettiger.info#me">
    <PersonjobTitle xmlns="http://schema.org/" xml:lang="en">a post-doctoral
researcher</PersonjobTitle>
    <knows xmlns="http://xmlns.com/foaf/0.1/" xml:lang="en">Marc
Mangel</knows>
  </rdf:Description>
  <rdf:Description rdf:nodeID="node17eprgndbx417699">
    <rdf:type rdf:resource="http://xmlns.com/foaf/0.1/Person"/>
    <name xmlns="http://xmlns.com/foaf/0.1/" xml:lang="en">Marc
Mangel</name>
  </rdf:Description>
  <rdf:Description rdf:about="http://users.soe.ucsc.edu/~msmangel/">
    <homepage xmlns="http://xmlns.com/foaf/0.1/" rdf:resource="http://users.soe.ucsc.edu/~msmangel/"/>
  </rdf:Description>
  <rdf:Description rdf:about="http://carlboettiger.info#me">
    <knows xmlns="http://xmlns.com/foaf/0.1/" xml:lang="en">Steve
Munch</knows>
  </rdf:Description>
  <rdf:Description rdf:nodeID="node17eprgndbx417700">
    <rdf:type rdf:resource="http://xmlns.com/foaf/0.1/Person"/>
    <name xmlns="http://xmlns.com/foaf/0.1/" xml:lang="en">Steve
Munch</name>
  </rdf:Description>
  <rdf:Description rdf:about="http://swfsc.noaa.gov/staff.aspx?&amp;id=17294">
    <homepage xmlns="http://xmlns.com/foaf/0.1/" rdf:resource="http://swfsc.noaa.gov/staff.aspx?&amp;id=17294"/>
  </rdf:Description>
  <rdf:Description rdf:about="http://users.soe.ucsc.edu/~msmangel/CSTAR.html">
    <Personaffiliation xmlns="http://schema.org/" rdf:resource="http://users.soe.ucsc.edu/~msmangel/CSTAR.html"/>
  </rdf:Description>
  <rdf:Description rdf:about="http://www.ucsc.edu/">
    <workplaceHomepage xmlns="http://xmlns.com/foaf/0.1/" rdf:resource="http://www.ucsc.edu/"/>
  </rdf:Description>
  <rdf:Description rdf:about="http://carlboettiger.info#me">
    <interest xmlns="http://xmlns.com/foaf/0.1/" xml:lang="en">regime
shifts</interest>
    <interest xmlns="http://xmlns.com/foaf/0.1/" xml:lang="en">ecology</interest>
    <interest xmlns="http://xmlns.com/foaf/0.1/" xml:lang="en">evolution</interest>
    <interest xmlns="http://xmlns.com/foaf/0.1/" xml:lang="en">complex systems</interest>
    <interest xmlns="http://xmlns.com/foaf/0.1/" xml:lang="en">nonparametric Bayesian
inference</interest>
    <interest xmlns="http://xmlns.com/foaf/0.1/" xml:lang="en">high
performance computing</interest>
    <interest xmlns="http://xmlns.com/foaf/0.1/" xml:lang="en">big data</interest>
  </rdf:Description>
  <rdf:Description rdf:about="http://www.carlboettiger.info/lab-notebook.html">
    <currentProject xmlns="http://xmlns.com/foaf/0.1/" rdf:resource="http://www.carlboettiger.info/lab-notebook.html"/>
  </rdf:Description>
  <rdf:Description rdf:nodeID="node17eprgndbx417701">
    <rdf:type rdf:resource="http://schema.org/PostalAddress"/>
    <Personaddress xmlns="http://schema.org/" xml:lang="en">Center for Stock Assessment Research, Department of Applied Math and Statistics,
University of California, Mail Stop SOE-2, Santa Cruz, CA 95064,USA</Personaddress>
    <streetAddress xmlns="http://schema.org/PostalAddress/" xml:lang="en">Center for Stock Assessment Research, Department of Applied Math and Statistics,
University of California, Mail Stop SOE-2</streetAddress>
    <addressLocality xmlns="http://schema.org/PostalAddress/" xml:lang="en">Santa Cruz</addressLocality>
    <addressRegion xmlns="http://schema.org/PostalAddress/" xml:lang="en">CA</addressRegion>
    <postalCode xmlns="http://schema.org/PostalAddress/" xml:lang="en">95064</postalCode>
    <addressCountry xmlns="http://schema.org/PostalAddress/" xml:lang="en">USA</addressCountry>
  </rdf:Description>
  <rdf:Description rdf:about="http://www.carlboettiger.info/">
    <tooltip xmlns="http://www.carlboettiger.info/" rdf:resource="http://www.carlboettiger.info/"/>
    <tooltip xmlns="http://www.carlboettiger.info/" rdf:resource="http://www.carlboettiger.info/"/>
    <tooltip xmlns="http://www.carlboettiger.info/" rdf:resource="http://www.carlboettiger.info/"/>
    <tooltip xmlns="http://www.carlboettiger.info/" rdf:resource="http://www.carlboettiger.info/"/>
  </rdf:Description>
  <rdf:Description rdf:about="http://www.carlboettiger.info/#me">
    <rdf:type rdf:resource="http://xmlns.com/foaf/0.1/Person"/>
    <account xmlns="http://xmlns.com/foaf/0.1/" xml:lang="en"/>
  </rdf:Description>
  <rdf:Description rdf:about="https://twitter.com/cboettig">
    <account xmlns="http://xmlns.com/foaf/0.1/" rdf:resource="https://twitter.com/cboettig"/>
  </rdf:Description>
  <rdf:Description rdf:about="https://github.com/cboettig">
    <account xmlns="http://xmlns.com/foaf/0.1/" rdf:resource="https://github.com/cboettig"/>
  </rdf:Description>
  <rdf:Description rdf:about="http://www.carlboettiger.info/">
    <tooltip xmlns="http://www.carlboettiger.info/" rdf:resource="http://onsclaims.wikispaces.com/"/>
    <tooltip xmlns="http://www.carlboettiger.info/" rdf:resource="http://onsclaims.wikispaces.com/file/view/ons-aci2-icon.png"/>
    <tooltip xmlns="http://www.carlboettiger.info/" rdf:resource="http://any23.org/?format=rdfxml&amp;validate=validate&amp;uri=http://www.carlboettiger.info/index.html"/>
    <tooltip xmlns="http://www.carlboettiger.info/" rdf:resource="http://any23.org/?format=rdfxml&amp;validate=validate&amp;uri=http://www.carlboettiger.info/index.html"/>
    <license xmlns="http://www.carlboettiger.info/" rdf:resource="http://creativecommons.org/publicdomain/zero/1.0/"/>
    <license xmlns="http://creativecommons.org/ns#" rdf:resource="http://creativecommons.org/publicdomain/zero/1.0/"/>
  </rdf:Description>
</rdf:RDF>
 
```


