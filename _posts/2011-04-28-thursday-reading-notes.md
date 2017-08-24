---
comments: true
date: 2011-04-28 13:59:43
layout: post
slug: thursday-reading-notes
title: Reading Notes, presentation prep treebase error handling
redirects: [/wordpress/archives/1522, /archives/1522]
categories:
- evolution
- ecology
tags:
- code-tricks
- reading
---

## Reading







* Oikos journal [recently started](http://oikosjournal.wordpress.com/2011/03/01/welcome-to-the-oikos-blog/) a rather nice blog. A journal long responsible for some of the best examples of developing and confronting ecological theory with empirical results, with an commendable emphasis on general principles and synthesis, it's nice to see them enter the Web2.0 ecosystem. Editor Jeremy Fox has a nice [introduction](http://oikosjournal.wordpress.com/2011/03/20/fox-quick-biography-and-some-thoughts-on-the-past-and-future-of-oikos/) to the goals of the blog -- check out the "[new idea](http://oikosjournal.wordpress.com/category/new-ideas/)s" categories for worthwhile reading. Thanks to Ethan White's [post on Jabberwocky Ecology](http://jabberwocky.weecology.org/2011/04/27/oikos-has-a-blog-blogrolling/) for bringing this to my attention. Particularly enjoyed the classic Borges quote linked as a pdf in the discussion of hand waving in ecology, which was so good I had to jot it down here 

> #### On Exactitude in Science Jorge Luis Borges, Collected Fictions, translated by Andrew Hurley.
> ...In that Empire, the Art of Cartography attained such Perfection that the map of a single Province occupied the entirety of a City, and the map of the Empire, the entirety of a Province. In time, those Unconscionable Maps no longer satisfied, and the Cartographers Guilds struck a Map of the Empire whose size was that of the Empire, and which coincided point for point with it. The following Generations, who were not so fond of the Study of Cartography as their Forebears had been, saw that that vast Map was Useless, and not without some Pitilessness was it, that they delivered it up to the Inclemencies of Sun and Winters. In the Deserts of the West, still today, there are Tattered Ruins of that Map, inhabited by Animals and Beggars; in all the Land there is no other Relic of the Disciplines of Geography.

> —Suarez Miranda, Viajes de varones prudentes, Libro IV,Cap. XLV, Lerida, 1658))


* Excellent/very relevant piece on fluctuations in fish population dynamics, (Shelton & Mangel, 2011).

* New warning signals [article](http://www.jstor.org/stable/full/10.1086/659945) by Vasilis in Am Nat.(Dakos _et. al._ 2011) ((Hmm.. JSTOR uses DOIs in its URL, but Am Nat doesn't seem to process the dois for the ahead-of-print articles. Hence no automatic citation)). And of course Carpenter et. al's empirical study in a lake ecosystem, in _Science_(Carpenter _et. al._ 2011)


* Ecological monographs has a nice article on stability, resilience and phase shifts in the classic otter-urchin system, nice alterantive stable states example despite temporal and site heterogeneity. (Watson & Estes, 2011)


* Species and trait diversification rates: Science article in electric fishes. (based on Brownie. Supplement claims AICc avoids type I errors associated with small sample size in chi^2, unfortunately I think the error rate remains high.) Diversification rates follow (Rabosky _et. al._ 2007), comparing fit by likelihood ratio, estimated mu/lambda by trying 4 values,


> Given our small dataset and the difficulty in estimating extinction rates from comparative data (Rabosky, 2010), we set the relative extinction fraction to ε = μ / λ rather than attempting to estimate it from the data (Alfaro _et. al._ 2009). We repeated our analyses using a range of ε values (ε = 0, 0.5, 0.9, and 0.99) (Rabosky _et. al._ 2007).

Hmm... irregular optimization method... Highlights the need for adequate power and estimates there-of to make inferences from phylogenetic data.

	
* Also in _Science_ Sidlauskas and colleagues make the most of Facebook (Sidlauskas _et. al._ 2011) for fish ids.



## Hastings lab presentation


Presentation in Hastings lab on Warning Signals.  Background. methods. Results.


## Prep Wainwright lab presentation




### (next Tuesday)




* Replicate (Price _et. al._ 2010) (on full Labrid dataset?)
* Repeat with release of constraint model, unconstrained model
* MCMC implementation?
* Assembling TreeBASE demo and further goals
* Attempt improved optimizer for TreePar package

## Coding


Exploring better error handling for TreeBASE package. From Duncan:


```r

ans <- try(read.nexus(con))
# and then check the class of ans to see if it is "try-error",
 if(is(ans, "try-error")) {
     # do something for the error
 } else {
      # you have your object
     ....
 }

```

> 
The second approach is to manage the HTTP request for the document so that you can detect when the file is not available. You can use either getURL() or getURLContent() in the RCurl package.



```r

 txt = getURL("http://purl.org/phylo/treebase/phylows/tree/TB2:Tr9917?format=nexus",
               header = TRUE, followlocation = TRUE)
 parseHTTPHeader(txt)

```



> 
In this case, the HTTP server returns a status code of 302 to indicate that the URL has moved. Following that redirection, we get a 200 status indicating success and the content is the HTML you see in your browser that indicates authorization issues. So to verify an error, you'd have to parse the HTML and look for the tell-tale message.

It would be better if the server returned a 40* error status indicating authorization problems.When getURL() returns regular content, you can pass that to read.nexus() as a text connection,
e.g.



```r

  o = read.nexus(textConnection(txt))

```



## Play: ubuntu release


And wow, the new Ubuntu release (11.04, Natty Nawhal) is no small shift. OpenOffice->LibreOffice, Rhythmbox replaced with Banshee, and omg, the veritable GNOME interface replaced with something I've never heard of ([Unity](http://en.wikipedia.org/wiki/Unity_%28desktop_environment%29), developed by Canonical). Described as a "smart-phone style" interface and "easier than a Mac", I don't know -- if those things should count as universal praise. Overall pretty [promising](http://www.zdnet.com/blog/open-source/what-you-need-to-know-about-the-new-ubuntu/8760).

## References


- Shelton A and Mangel M (2011).
"Fluctuations of Fish Populations And The Magnifying Effects of Fishing."
*Proceedings of The National Academy of Sciences*, **108**.
ISSN 0027-8424, <a href="http://dx.doi.org/10.1073/pnas.1100334108">http://dx.doi.org/10.1073/pnas.1100334108</a>.

- Dakos V, Kéfi S, Rietkerk M, van Nes E and Scheffer M (2011).
"Slowing Down in Spatially Patterned Ecosystems at The Brink of Collapse."
*The American Naturalist*, **177**.
ISSN 00030147, <a href="http://dx.doi.org/10.1086/659945">http://dx.doi.org/10.1086/659945</a>.

- Carpenter S, Cole J, Pace M, Batt R, Brock W, Cline T, Coloso J, Hodgson J, Kitchell J, Seekell D, Smith L and Weidel B (2011).
"Early Warnings of Regime Shifts: A Whole-Ecosystem Experiment."
*Science*, **332**.
ISSN 0036-8075, <a href="http://dx.doi.org/10.1126/science.1203672">http://dx.doi.org/10.1126/science.1203672</a>.

- Watson J and Estes J (2011).
"Stability, Resilience, And Phase Shifts in Rocky Subtidal Communities Along The West Coast of Vancouver Island, Canada."
*Ecological Monographs*, **81**.
ISSN 0012-9615, <a href="http://dx.doi.org/10.1890/10-0262.1">http://dx.doi.org/10.1890/10-0262.1</a>.

- Rabosky D, Donnellan S, Talaba A and Lovette I (2007).
"Exceptional Among-Lineage Variation in Diversification Rates During The Radiation of Australia'S Most Diverse Vertebrate Clade."
*Proceedings of The Royal Society B: Biological Sciences*, **274**.
ISSN 0962-8452, <a href="http://dx.doi.org/10.1098/rspb.2007.0924">http://dx.doi.org/10.1098/rspb.2007.0924</a>.

- Rabosky D (2010).
"Extinction Rates Should Not be Estimated From Molecular Phylogenies."
*Evolution*, **64**.
<a href="http://dx.doi.org/10.1111/j.1558-5646.2009.00926.x">http://dx.doi.org/10.1111/j.1558-5646.2009.00926.x</a>.

- Alfaro M, Santini F, Brock C, Alamillo H, Dornburg A, Rabosky D, Carnevale G and Harmon L (2009).
"Nine Exceptional Radiations Plus High Turnover Explain Species Diversity in Jawed Vertebrates."
*Proceedings of The National Academy of Sciences*, **106**.
ISSN 0027-8424, <a href="http://dx.doi.org/10.1073/pnas.0811087106">http://dx.doi.org/10.1073/pnas.0811087106</a>.

- Sidlauskas B, Bernard C, Bloom D, Bronaugh W, Clementson M and Vari R (2011).
"Ichthyologists Hooked on Facebook."
*Science*, **332**.
ISSN 0036-8075, <a href="http://dx.doi.org/10.1126/science.332.6029.537-c">http://dx.doi.org/10.1126/science.332.6029.537-c</a>.

- Price S, Wainwright P, Bellwood D, Kazancioglu E, Collar D and Near T (2010).
"Functional Innovations And Morphological Diversification in Parrotfish."
*Evolution*.
<a href="http://dx.doi.org/10.1111/j.1558-5646.2010.01036.x">http://dx.doi.org/10.1111/j.1558-5646.2010.01036.x</a>.
