---
comments: true
date: 2011-09-09 09:55:39
layout: post
slug: how-google-views-me-by-search-terms-or-citation-counts
title: 'How google views me: by search terms or citation counts?'
redirects: [/wordpress/archives/2559, /archives/2559]
categories:
- open-science
tags:
- blog
---

How Google search views me: here's a word cloud of search terms reaching my site in August.  Word cloud produced with R: click-through for link to source-code. Uses the rather convenient tm package for text-mining functions in R. Note that this shows the frequency of individual words used in searches, rather than the whole search term. 

![]( http://farm7.staticflickr.com/6073/6128330822_c3f089a3da_o.png )


Code:

```R

require(tm)
require(wordcloud)
require(RColorBrewer)

carl <- read.csv("searchterms.csv", colClasses=c("character", "numeric"))

words <- character(sum(carl[[2]]))
m <- 1
for(i in 1:length(carl[[1]])){
  n <- carl[[2]][i]
  x <- carl[[1]][i]
  words[m:(m+(n-1))] <- rep(x, n)
  m <- m+n
}

 carl <- Corpus(DataframeSource(carl))
 carl <- tm_map(carl, removePunctuation)
 carl <- tm_map(carl, tolower)

 carl.tdm <- TermDocumentMatrix(carl)
 carl.m <- as.matrix(carl.tdm)
 carl.v <- sort(rowSums(carl.m), decreasing=TRUE)
 carl.d <- data.frame(word=names(carl.v), freq=carl.v)

pal2 <- brewer.pal(8,"Dark2")

png("wordcloud.png", width=800,height=800) 
#larger canvas doesn't increase plot size
wordcloud(carl.d$word,carl.d$freq, scale=c(8,.4),min.freq=1,
max.words=Inf, random.order=FALSE, rot.per=.15, colors=pal2)
dev.off()

require(socialR)
upload("wordcloud.png", script="wordcloud.R")

```



Here's another way that Google views me: results from the [Google citation gadget](http://code.google.com/p/citations-gadget/)




	
  * Citations for "Carl Boettiger": **77**

	
  * Cited Publications: **18**

	
  * H-Index: **5**





Hmm... I think the wordcloud approach might be more accurate... Perhaps no one needed reminding not to trust these kinds of tools, despite the predilection to believe anything quantitative (See the real story on my CV tab (pdf).  The other lesson might be that alternative forms of publishing are likely to get picked up by some of these algorithms.  Many of the [items](http://scholar.google.com/scholar?start=0&q=author:%22Carl+Boettiger%22&hl=en&lr=lang_en&as_sdt=0,5) that come up are talks I've deposited on Nature Precedings, and a few are even just notebook posts.  Interesting that there's a growing number of services designed to help scientists strengthen their review dossier using these tools.

Does this mean that alternative publishing (_i.e._ conference slides, prepints, notebook posts) is a good way to trick the metrics?  That people won't trust the numbers of bloggers, etc, assuming they are inflated?  Or that these kinds of communication methods may gain acceptance as part of the scientific discourse?  


