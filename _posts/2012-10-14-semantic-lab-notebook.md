---
layout: post
title: Semantic Lab Notebook
categories: open-science

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
  <a itemprop="url" href="http://carlboettiger.info">http://carlboettiger.info</a>
  <img itemprop="photo" src="https://en.gravatar.com/userimage/12904315/7edea703b826fbbe07f2ae4d95b8416b.jpg?16"/>
</div>
```


where the terms such as `name` and `url` have precise meanings attached to "Person", as specified at the "http://data-vocabulary.org/Address".  This ability to point to an external vocabulary is really the key concept of linked data.  In the spirit of HTML5, microdata is much simpler than RDFa, but also more limited.  [Here is an excellent comparison](http://manu.sporny.org/2011/uber-comparison-rdfa-md-uf/), but for our purposes we will use RDFa as it is more common in academic use and will more seemlessly allow us to use academic ontologies.  (While microdata has a clear mapping to RDF, it is not clear that any ontology that can be expressed in RDF can also be expressed in microdata).  

### RDFa

RDFa can be written in a very similar manner.  The `itemprop` attribute is replaced by the `property` attribute, and `vocab` replaces `itemtype` and automatically implies `itemscope` to child nodes.  


```html
<div vocab="http://xmlns.com/foaf/0.1/" typeof="Person">
  <h1 property="name">Carl Boettiger</h1>
  <a property="homepage" href="http://carlboettiger.info">http://carlboettiger.info</a>
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


Scholarly Semantic Markup for the Notebook
==========================================

Now that we've familiarized ourselves with the options, it's time to see what semantic content we can implement. 

* Page structure - HTML5
* Blog structure - microdata from http://schema.org/BlogPosting, or Dublin Core?
* Author metadata - foaf (Name, contact info, social networks, interests, publications).
* Licenses - http://creativecommons/ns#  
* Citations - SPAR ontologies, including purl.org/spar/CiTO, purl.org/spar/biro.  Also purl.org/ontologies/bibo, DC
* Ecological data - EML http://knb.ecoinformatics.org/software/eml/
* Taxonomic data - Darwin Core

In another entry I will try and highlight where and what semantic content I have added.  HTML templates with Jekyll tags may be able to pull the actual values in from `_config.yaml` and the yaml headers, preserving the Jekyll ethos Markdown and YAML: human readable source without cluttered markup.  

