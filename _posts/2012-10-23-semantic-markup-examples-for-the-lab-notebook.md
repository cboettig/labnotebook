---
layout: post
category: open-science 
tags: 
- semantics
- notebook-technology

exclude_from_search: true

---

All notebook entries are formatted with XHTML compliant (polyglot) HTML5 semantic structure.  This means that any entry can be parsed with a generic XML parser to extract the entry content in `<article>`, the `<header>`, `<footer>`, `<aside>`, etc.  The `<head>` section provides `<title>` and essential `<meta>` tags declaring the character encoding (which also sets the MIME type for HTML5).   

### Head 

In `_includes/header.html` we introduce some basic academic archive metadata using the Dublin Core ontology. The html5 `<header>` seems like a good place for `dc:title`.  Other metadata is added invisibly using `content` in a `meta` tag.  

```html
<head prefix="dc: http://purl.org/dc/terms/">
<!-- HTML5 metadata -->
<meta charset="utf-8" /> <!--same as <meta http-equiv='Content-Type' content='Type=text/html; charset=utf-8'> -->
<meta name="author" content="Carl Boettiger" />
<meta name="keywords" content="Ecology, Evolution, Open Science, Reproducible Research" />
<meta name="description" content="My open lab notebook: research in theoretical ecology and evolution" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>{% raw %}{{ page.title }}{% endraw %}</title>
<!-- RDFa Metdata (in Dublin Core) -->
<meta property="dc:creator" content="Carl Boettiger" />
<meta property="dc:title" content="{% raw %}{{ page.title }}{% endraw %}" />
<meta property="dc:type" content="Lab Notebook" />
<meta property="dc:format" content="text/html" />
<meta property="dc:language" content="en" />
```

### Sidebar

More metadata is displayed in the sidebar (in an html5 `aside` element), including date, tags and category.  I've added the following RDFa to describe these (see examples with the Jekyll liquid code in `_includes/sidebar.html`)

```html
<aside prefix="dc: http://purl.org/dc/terms/">
Posted on
<time datetime="{% raw %}{{ page.date | date_to_xmlschema }}{% endraw %}" 
      property="dc:created">{% raw %}{{ page.date | date_to_string }}{% endraw %}</time>.
```

This puts the date in an HTML5 time element described as the `dc.created` time of the publication.  Tags and categories use a little Liquid code so Jekyll can import them from the YAML header.  The link to the tag page is described with the HTML `rel` attribute for tag, while the tag itself is given the RDFa property of a blog keyword from schema.org.  Categories are given the more formal `dc:subject` property.   (See `_includes/pagetags.html` for Jekyll/Liquid code for looping over multiple tags, etc).  

```html
  <a rel="tag" class="tag" href="/tags.html#{% raw %}{{ tag | cgi_escape }}{% endraw %}">#<span 
  property="http://schema.org/BlogPosting/keywords">{% raw %}{{ tag }}{% endraw %}</span></a>
  <a rel="tag" class="category" href="/categories.html#{% raw %}{{ category | cgi_escape }}{% endraw %}"><span property="dc:subject">{% raw %}{{ category }}{% endraw %}</span></a>
```

The next and previous buttons get the HTML5 `rel` values `next` and `prev` (see [HTML5 semantics](http://diveintohtml5.info/semantics.html)).  Note that all the Dublin Core elements are properties of the page on which they occur. 


### Footer

The `<footer>` contains licenses and contact information through social media.  I've used the FOAF vocabulary to indicate my membership to the various social networks provided in the links. The social networks are properties of a `FOAF:person`, (me), which is indicated in the RDFa `resource`:

```html
<div class="span4" vocab="http://xmlns.com/foaf/0.1/" typeof="Person"
resource="http://www.carlboettiger.info#me">
  <a property="account" href="mailto:cboettig@gmail.com"><img
  src="/assets/img/icon-email.png" alt="email"> </a>
  <a property="account" href="https://twitter.com/cboettig"><img
  src="/assets/img/icon-twitter.png" alt="twitter"> </a>
  <a property="account" href="https://github.com/cboettig"><img
  src="{{site.url}}/assets/img/icon-github.png"
  alt="github"> </a> <a property="account"
  href="http://www.mendeley.com/profiles/carl-boettiger"><img
  src="/assets/img/icon-mendeley.png" alt="mendeley"></a>
<a href="/atom.xml"><img src="/assets/img/icon-rss.png"
alt="feed"></a> </div>
```

It might be worth adding more FOAF terms describing the relationship of these networks (such as distinguishing my profile name and the base url) using meta elements to avoid adding clutter text. I use the Creative Commons namespace to identify my CC0 license.  The license is a property of the page on which it is found, like the Dublin Core metadata.

```html
<a property="http://creativecommons.org/ns#license"
href="http://creativecommons.org/publicdomain/zero/1.0/"><img
src="http://i.creativecommons.org/l/zero/1.0/88x31.png" alt="CC0"
style="float:right"></a>
```

![When these elements are combined in a given entry, the RDFa generates this structure](/assets/figures/post-rdfa.png)

### Easily entering RDFa

All of this markup content is either generally static or filled in programatically by Jekyll from the YAML headers (e.g. title, categories, tags, date), leaving me free to put the RDFa into the template files just once and forget about it.  In this way I can continue to write everything in Markdown, rather than the more cumbersome HTML riddled by the addition of RDFa attributes. Unfortunately there is no easy way to escape this in writing the Homepage markup, described below, but a single case isn't so bad.  

Another obvious candidate for linked data in the posts is the citation information.  This markup can probably be automatically generated for each post using scripts (see [Automated feeds in notebook entries](http://www.carlboettiger.info/2012/10/05/notes.html)), so I plan to add this to my knitcitations package when I get a chance (including CiTO support!).   

### Homepage 

My homepage contains a brief description about me that is ripe for FOAF and schema.org. While this content is reasonably static, it does mean writing directly in HTML+RDFa, with the markup making the source almost unreadable.  (It might be possible to force more of this data into YAML header and have it added through the invisible `meta` tags, but that seems rather convoluted).  Capturing the "buisness card" information as well as the "social" information requires mixing ontologies, which can lead to some interesting complications.  To make a long story short:

a. Implicit logic *is possible* with linked data: we can infer that `schema:jobTitle` can be a property of a `foaf:Person` because it is a property of a `schema:Person` and someone declares them as `owl:equivalentProperty`.  
b. In practice it may be most robust to explicitly declare the relation by exploiting the fact that we can give multiple arguments to attributes like `property` and `typeof`.  


```html
<div id="me" prefix="foaf: http://xmlns.com/foaf/0.1/" prefix="schema:
http://schema.org/Person" typeof="foaf:Person schema:Person"
resource="http://www.carlboettiger.info#me"> 
I am  <a property="foaf:homepage schema:url"
href="http://www.carlboettiger.info"><span property="foaf:name
schema:name"><span property="foaf:givenName schema:givenName">Carl</span>
<span property="foaf:familyName schema:familyName">Boettiger</span></span></a>, <span
property="schema:jobTitle">a graduate student</span>
```

(This excerpt gives the general flavor, see the html source of [index.html](http://www.carlboettiger.info) for a full example.)

![The homepage generates this RDFa structured graph (from rdfa.info/play)](/assets/figures/homepage-rdfa.png)



## Notes

Some background reading on semantics

* Nice [collection of posts on scholarly html](http://scholarlyhtml.org/faq/), but too little mention of the serious linked data stuff coming out of biscol, ievobio/nescent, etc. In particular, Martin's [history](http://blogs.plos.org/mfenner/2011/03/19/a-very-brief-history-of-scholarly-html/) gives some nice perspective.  
* The war for schema.  Which ontologies should we choose? (e.g. [schema.org's take](http://blogs.plos.org/mfenner/2011/06/07/schema-org-for-scholarly-html/)
* On [the good & the bad of schema.org and the role of search giants](http://manu.sporny.org/2011/false-choice/)

Mixing ontologies had me very confused.  

* How do we  [mix ontologies](http://stackoverflow.com/questions/12983766)
* How do we meet [Google Rich Snippets requirements using FOAF?](http://answers.semanticweb.com/questions/19200/satisfy-google-rich-snippets-person-standard-using-foaf)
* How do we [avoid redundant vocabulary terms?](http://answers.semanticweb.com/questions/19275/what-to-do-about-redundant-rdfa-or-machines-that-speak-only-one-language)
* We can avoid the redundancy using implicit reasoning (exploiting the logic of linked data), but we may prefer to be explict.  [This video](http://vimeo.com/28667500) does a nice job of explaining these concepts. If we do semantics right, we should be able to "dereference" an object away from a particular ontology.   



### Tools and Resources
* [Google rich snippets](http://www.google.com/webmasters/tools/richsnippets)
* [rdfa extractor](http://getschema.org/rdfaliteextractor/about) (into RDF, JSON, n3).  Also has validator, but doesn't point to the `nu` variant for html5. 
* [RDFa Play](http://rdfa.info/play/). Wow, very nice.  
* [sameAs.org](http://sameas.org) -- search onotologies for an existing term, identify identical terms in different ontologies, etc.  Simply brilliant, what I've always wanted!



### knitcitations update: adding formats an semantics.   

* Looking at citeproc / [CSL](http://citationstyles.org/) [github page](https://github.com/citation-style-language).  
* Raw citeproc is an XML stylesheet, XSLT, which can render XML into HTML (and much more).  Possible other options are using something like citeproc-js or citeproc-ruby, or writing citeproc-R.  
* Not quite clear how to take a CSL and a set of references and generate HTML; aforementioned packages may address this.  
* For the moment, probably easier to convert R `bibitem` to display with RDFa with scholarlyhtml recommended ontology than to enter raw XML reference and format via citeproc.  Should also support adding in the cito tags.  With full addresses in property, should be able to avoid any need for namespace/header modifications.  


