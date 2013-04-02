---
layout: post
category: open-science
tags: 
- semantics
- knitcitations
- blog

---

 

I have on ocassion been exploring the use of [semantic](/tags.html/#semantics) markup in the notebook.  In this post I illustrate how I am handling semantic citations.  One of the more intriguing ideas is the ability to add semantic meaning to citations through the CITO ontology of <span class="showtooltip" title="Shotton D (2010). Cito, The Citation Typing Ontology. _Journal
of Biomedical Semantics_, *1*. ISSN 2041-1480, 
http://dx.doi.org/10.1186/2041-1480-1-S1-S6."><a href="http://dx.doi.org/10.1186/2041-1480-1-S1-S6" rel="http://purl.org/spar/cito/usesMethodIn" >Shotton (2010)</a></span>.  Citation counts form a central part of academic discourse, but contain very little information regarding the reason for the citation.  Most notably, 'negative' citations refuting a claim carry just the same weight as those confirming or relying upon a claim.  Given the scale and expansion of academic literature, it is rarely reasonable to explore this citation graph manually.  CITO provides a language for embedding the meaning of the citation, such as "discusses", "refutes", or "usesMethodIn", to the citation.  (For instance, my earlier citation to Shotton identifies itself as "usesMethodIn", as I will explain). 

The main barrier to this approach is a lack of adoption.  One of the primary concerns is the burden it places on authors of adding the extra data.  On one hand, authors already bother formatting and reformatting layout, spelling, and reference order to the arcane specifications of different journals, which suggests authors can be persuaded to do some pretty tedious tasks if the publishers would require it.  After all, the task of adding citations is already much easier than it was in the days of paper journals.  Still, it is much simpler to remove a tedious requirement than to add a new one.  My hope is that intelligent tools can simplify this process, as they already have with other aspects of managing citations, and encourage the use of CITO.  In this spirit, I have recently started trying to consistently use the CITO ontology in my notebook entries as a test case, using some tools of my own design.  

### Semantics in knitcitations

Several months ago I created the R package [knitcitations](https://github.com/cboettig/knitcitations) to provide a citation platform for [knitr](http://yihui.name/knitr) dynamic documents, which provide executable code and automatic inclusion of results inside plain-text (markdown) descriptions.  I write most of my research scripts and many of my notebook entries in this manner. The package can generate citations by DOI, circumventing the need for maintaining bibtex or similar database of citation information, using commands such as 

```r
citet("10.1186/2041-1480-1-S1-S6")
```

Extending the package to support CITO was rather straight forward.  Using the latest version of knitcitations, one can generate in-line citations with CITO semantics simply by passing the reason for the citation as well, such as 

```r
citet("10.1186/2041-1480-1-S1-S6", cito="usesMethodIn")
```

which generates the following HTML:

```html
<a href='http://dx.doi.org/10.1186/2041-1480-1-S1-S6' property='http://purl.org/spar/cito/usesMethodIn' >Shotton (2010)</a>
```

This provides a convient platform to generate semantic citations in this lab notebook.  As before, knitcitations will also generate a complete reference list at the end of the document by calling the `bibliography` function at the end. 

### Semantic overkill?

It is possible to add far more semantic data to this reference list at the end of an article.  Invisible semantic markup can identify to a machine what value corresponds to the volume number or issue number, or journal name, e,g, using the BIBO ontology.  I have added support for ths kind of markup to knitcitations as well, and [several](/2013/02/12/notes.html) [of](/2013/02/21/notes.html) my posts provide examples. The raw markup looks like this: 

```html
<div prefix="dc: http://purl.org/dc/terms/,
                      bibo: http://purl.org/ontology/bibo/,
                      foaf: http://xmlns.com/foaf/spec/,
                      biro: http://purl.org/spar/biro/"
        rel="http://purl.org/spar/biro/ReferenceList"> <ul class='bibliography'> 
<li> <span property="dc:title">Fisheries: Does Catch Reflect Abundance?.</span> <span property="dc:creator"> <span property="foaf:givenName">Daniel</span> <span property="foaf:familyName">Pauly</span>, </span><span property="dc:creator"> <span property="foaf:givenName">Ray</span> <span property="foaf:familyName">Hilborn</span>, </span><span property="dc:creator"> <span property="foaf:givenName">Trevor A.</span> <span property="foaf:familyName">Branch</span>, </span>  (<span property="dc:date">2013</span>)  <span rel="http://purl.org/dc/terms/isPartOf" 
                            resource="[http://purl.org/dc/terms/journal]">
                        <span property="http://purl.org/dc/terms/title"
                                content=" Nature ">
                        </span>
                          <span property="bibo:shortTitle"> Nature </span>
               </span>  <span property="bibo:volume">494</span>    <a property="bibo:doi" href="http://dx.doi.org/10.1038/494303a">10.1038/494303a</a> </li>
<li> <span property="dc:title">Net Gains.</span> <span property="dc:creator"> <span property="foaf:givenName">unknown</span> <span property="foaf:familyName">unknown</span>, </span>  (<span property="dc:date">2013</span>)  <span rel="http://purl.org/dc/terms/isPartOf" 
                            resource="[http://purl.org/dc/terms/journal]">
                        <span property="http://purl.org/dc/terms/title"
                                content=" Nature ">
                        </span>
                          <span property="bibo:shortTitle"> Nature </span>
               </span>  <span property="bibo:volume">494</span>    <a property="bibo:doi" href="http://dx.doi.org/10.1038/494282a">10.1038/494282a</a> </li>
 </ul>
</div>
```


However, I have since decided that such markup is largely overkill. The DOI uniquely identifies the publication already, and allows us to programmatically retrieve the rest of the data (title, authors, journal, etc) from semantically identified XML by querying against services such as CrossRef.   *This is the essential concept of linked data*, by which both source and referer are enriched. 

Moreover, DOIs follows a specific construction that lets us reliably [identify them in plain text using regular expressions](http://stackoverflow.com/questions/27910/finding-a-doi-in-a-document-or-page), making any futher semantics to declare that we are citing the article mostly irrelevant.  This is convient for identifying all citations appearing in the notebook without any markup. The CITO example above has the advantage of providing a link and associating the DOI with the reason for the citation, by virtue of being inside the same html anchor element.    


### Replacing the reference list?

If we are not going to semantically mark up the reference list, we could consider abolishing the reference list all together.  After all, as a tool for the digital reader the concept is rather vestigal -- I hate losing my place by scrolling to the end of an article just to see to what reference number 7 refers.  With the method shown thus far, the reader can open the link to access this information, but that still interrupts the flow of reading.  The digitally native solution is a mouse-over or tooltip effect that displays this information, as many professional publishers already use in their HTML versions.  

Once again, this is straight forward to support using the knitcitations package, at least for sites that include the popular [bootstrap](http://twitter.github.com/bootstrap) javascript libraries, such as this notebook.  I have added an option to the in-text citation functions to provide such tooltips in a span element, such that calling the command


```html
<span class='showtooltip' title='Shotton D (2010). "Cito, The Citation Typing Ontology." _Journal of
Biomedical Semantics_, *1*. ISSN 2041-1480, <URL:
http://dx.doi.org/10.1186/2041-1480-1-S1-S6>.'><a href='http://dx.doi.org/10.1186/2041-1480-1-S1-S6' property='http://purl.org/spar/cito/usesMethodIn' >Shotton (2010)</a></span>
```

This behavior can be toggled on by calling 

```r
cite_options(tooltip=TRUE)
```

after loading the knitcitations library. **EDIT**: Note that this requires the javascript trigger on the class `showtooltip`, which can be done by adding this to your header:

```js
    <script type="text/javascript">
      $(document).ready(function (){
        $(".showtooltip").tooltip();
      });
    </script>

```

### Citing without DOIs

Not all the literature we may wish to cite includes DOIs, such as [arXiv](http://arxiv.org) preprints, Wikipedia pages, or other academic blogs.  Even when a DOI is present it is not always trivial to locate.  With version 0.4-0, knitcitations can produce citations given any URL using the [Greycite API](http://greycite.knowledgeblog.org) (<span class="showtooltip" title="Lord P (2012). Greycite. 
http://knowledgeblog.org/greycite [Online. last-accessed:
2012-10-10 13:36:24].  http://knowledgeblog.org/greycite."><a href="http://knowledgeblog.org/greycite" rel="http://purl.org/spar/cito/usesMethodIn" >Lord, 2012</a></span>). For instance, this citation is created with the command  `citep("http://knowledgeblog.org/greycite", cito="usesMethodIn")`.  




