---
layout: post
title: Semantic Lab Notebook
categories: open-science
tags: 
- semantics
- notebook-technology
- blog
---

As the lab notebook grows, to make the maximum use of content it would be particularly useful to maximize the ability for a computer to understand the content, allowing us to identify, manipulate, and connect data using scripts and software.  This is the concept of *linked data*, or a *semantic notebook*.  I have explored this this idea before in the context of a [wordpress-based platform](2011/05/08/building-a-semantic-notebook.html), but now that Jekyll has let me strip away some of the abstraction of Wordpress it seems a good time to revisit this idea.  


Semantics in HTML5
------------------

Already the notebook is written in HTML5, which has considerable semantic structure compared to it's predecessors.  HTML5 introduces the structural elements  

* `<nav>`
* `<header>`
* `<article>`
* `<section>`
* `<aside>`
* `<footer>`

that intuitively define the organization of an page, setting off the important content from the window-dressing.  HTML5 also defines inline elements `<time>` (see the links in Caveats), and `<mark>`, and the existing tags for metadata, which let us specify `<title>`, and basic `<meta>` tags for metadata such as author, `<meta name="author" content="Author Name">`, encoding, description, and keywords.  Links `<link>` and `<a>` use the `rel` attribute to describe the link target.  Though one can write anything at all in this text, HTML5 defines a small vocabulary with recognized meaning, some old, some new, such as `<a rel="tag"`,  `rel="license"` as well as the older `<link rel="stylesheet" href="style.css">` and `<a rel="nofollow"`.   [Here is a great overview of the semantics in HTML5](http://diveintohtml5.info/semantics.html), with a bit more about the available .  To expand our vocabulary beyond these elements, however, we will need more tools.  



Linked Data
------------


W3C confusingly provides two standards for formally defining semantic content using an external vocabulary or ontology.   The first is microdata, introduced as a simpler alternative to the second, RDFa, an HTML-adaptation of the RDF XML standard (originally developed for the now-defunct XHTML 2.0). 

### Microdata

Microdata introduces new attributes into HTML tags like `<div>`, `<span>`, `<h1>`.  The first of these is `itemtype`, which points to an external resource such as schema.org to define the vocabulary.  To have this vocabulary apply to child elements, we just add the attribute `itemscope`.  Then we can set the value of attribute `itemprop` in this or following elements to give it semantically defined meaning, such as


```html
<div itemscope itemtype="http://data-vocabulary.org/Person">
  <h1 itemprop="name">Carl Boettiger</h1>
  <a itemprop="url" href="http://www.carlboettiger.info">http://carlboettiger.info</a>
  <img itemprop="photo" src="https://en.gravatar.com/userimage/12904315/7edea703b826fbbe07f2ae4d95b8416b.jpg?16"/>
</div>
```


where the terms such as `name` and `url` have precise meanings attached to "Person", as specified at the "http://data-vocabulary.org/Address".  This ability to point to an external vocabulary is really the key concept of linked data.  In the spirit of HTML5, microdata is much simpler than RDFa, but also more limited.  [Here is an excellent comparison](http://manu.sporny.org/2011/uber-comparison-rdfa-md-uf/), but for our purposes we will use RDFa as it is more common in academic use and will more seamlessly allow us to use academic ontologies.  (While microdata has a clear mapping to RDF, it is not clear that any ontology that can be expressed in RDF can also be expressed in microdata).  

### RDFa

[RDFa](http://www.w3.org/TR/xhtml-rdfa-primer/) can be written in a very similar manner.  The `itemprop` attribute is replaced by the `property` attribute, and `vocab` replaces `itemtype` and automatically implies `itemscope` to child nodes.  


```html
<div vocab="http://xmlns.com/foaf/0.1/" typeof="Person">
  <h1 property="name">Carl Boettiger</h1>
  <a property="homepage" href="http://www.carlboettiger.info">http://carlboettiger.info</a>
  <img property="depiction" src="https://en.gravatar.com/userimage/12904315/7edea703b826fbbe07f2ae4d95b8416b.jpg?16"/>
 </div>
```

We could have used only the `property` attribute along with the complete URI to the term definition instead of this structure.  `typeof` indicates that the child elements are all of the same type (in this case, all belong to the same "Person").  If we were omitting `vocab` and writing out all URIs, we would have had `<div typeof="http://xmlns.com/foaf/0.1/Person">` as well.  In RDFa, we also have the `resource` attribute, which allows us to specify a URI for the element being described.  This could be a relative or absolute URL. If the object is a link, using `resource` is not necessary, and the property is taken to describe the URL given in `href` or `src` rather than the anchor text.   

Two older options lie at either extreme: the most basic is the older technique of [microformatting](http://microformats.org/wiki/html5), basically relying on standard `class` and `rel` attributes to convey semantic information.  Simple and without new attributes, but probably too limited for our purposes so we won't concern ourselves with it further.  The other venerable approach is serve the page as XHTML, which renders in the browser in much the same way but can be parsed by a machine as XML, with all the power and extensibility that presents.  Unlike earlier HTML standards, HTML5 is already valid XML (already "serialized"), so the same page can be served in either format (earlier specs were SGML, standardized general markup languages, of which XML is just a subset).  To allow parsing of the HTML5 pages as either type (see [polyglot](http://en.wikipedia.org/wiki/Polyglot_markup)), we need only add the language and namespace to the opening `<html>` tag,

```
<html lang="en" xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
```

### Caveats

An essential caveat is that these are all new approaches which may not render well in legacy browsers, particularly Windows Internet Explorer.  Some of these, like recognizing and styling the HTML5 semantic elements in IE, can be addressed in CSS, for which Twitter Bootstrap does a decent job.  Another caveat The HTML5 spec has not been finalized, and some things are still in flux, as the [removal](http://html5doctor.com/time-and-data-element/) and [reinstatement](http://www.brucelawson.co.uk/2012/best-of-time/) of the `<time>` element illustrates.  

### Useful tools for checking implementation

* [W3C HTML5 Validator](http://validator.w3.org/nu)
* [Google rich snippets](http://www.google.com/webmasters/tools/richsnippets)
* [RDF extraction tool](http://sparql.captsolo.net/browser/browser.py?url=http://www.w3.org/2007/08/pyRdfa/extract?uri=http://www.carlboettiger.info)

Scholarly Semantic Markup for the Notebook
==========================================

Now that we've familiarized ourselves with the options, it's time to see what semantic content we can implement. 

Content/Data      Example types               Links to Potential vocabularies
------------      -------------               -------------------------------------------
Page structure    `<header>`                  [HTML5](http://diveintohtml5.info/semantics.html)
Post metadata     keywords, timestamps        [Schema.org microdata](http://schema.org/BlogPosting) or [Dublin Core](http://purl.org/terms/dc)
Author metadata   Name, contact, networks,    [FOAF](http://xmlns.com/foaf/0.1/), [Dublin Core](http://purl.org/terms/dc)
                  interests, publications) 
Licenses          CC0                         [CreativeCommons](http://creativecommons.org/ns)
Citations         bib info, reason for citing [CiTO](http://purl.org/spar/cito), [BiRO](http://purl.org/spar/biro), 
                                              [bibo](http://purl.org/ontologies/bibo), [Dublin Core](http://purl.org/terms/dc)
Taxonomic data    species names               [Darwin Core](http://rs.tdwg.org/dwc/terms/index.htm)
Ecological data   measurements, units, etc     ~~[EML](http://knb.ecoinformatics.org/software/eml/)~~ [OBOE](http://ecoinformatics.org/oboe/oboe.1.0/oboe-core.owl)


In another entry I will try and highlight where and what semantic content I have added (work in progress), with examples of each vocabulary.  The first four types are relatively static content that can be easily woven into the Jekyll template files.  Using Jekyll & Liquid to pull in template information from the `_config.yaml` should help avoid repetitive entry and make updating the linked data easier. The last three are entry-specific content, and will be more challenging.  I hope to add semantic support to [knitcitations](https://github.com/cboettig/knitcitations), including the option for CiTO types, which should make entry of citation data quick and easy ([SO question illustrating semantic citation](http://stackoverflow.com/questions/12867586)). 

The last two are much richer, specific vocabularies.  For the moment, it might be best to use these to give more precise meaning to tags, which are already used as metadata on posts.  This would allow posts to be still created in simple markdown without the burden of adding in lines of RDFa and cluttering the markup.  Meanwhile full datasets provided in EML are likely to live as separate files, rather than as a random table in the middle of a notebook entry.  

As always, feedback, corrections or suggestions are appreciated!


