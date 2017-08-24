---
layout: post
categories: ecology
tags:
- eml
- semantics
- ropensci
---


A lot has been happening in the `reml` development over on our package Github page, particularly through discussion on the [issues tracker](http://ropensci.org/reml) we have been working through several of the major conceptual challenges in designing the package.


### Semantics


**Writing Semantics**.  Lots of elements of the EML schema have semantic meaning, but we can't start leveraging ontological tools while these terms are defined only as part of the Schema vocabulary. In their current state, they are just "meaningless bits of syntax", e.g. the schema only defines `gram` as a valid text string that lives at `//attribute/measurementScale/ratio/unit/standardUnit`. A computer reading the schema could never formally decide that this is the same gram we use to measure mass.  We use formal semantics to say this: that is, that text-string `gram` means [http://ecoinformatics.org/oboe/oboe.1.0/oboe-standards.owl#Gram](http://ecoinformatics.org/oboe/oboe.1.0/oboe-standards.owl#Gram), which is embued with meaning.  

We've made some definite progress in how to go about making this leap from structure to meaning after considering a variety of potential avenues.  A few [open questions](https://github.com/ropensci/reml/issues/5#issuecomment-21573824) (and a lot of implementation) remain.  A useful observation comes from Ben in pointing out how we can add RDF directly to the EML, rather than relying on a second external schema file:


```xml
<eml>
…
<dataTable id="http://some.namespace#myUniqueEntityId1">
        <attribute id="http://some.namespace#myUniqueAttributeId1"/>
        <attribute id="http://some.namespace#myUniqueAttributeId2"/>
</dataTable>
…
<additionalMetadata>
        <describes>http://some.namespace#myUniqueAttributeId1</describes>
        <metadata>
                <!-- RDF stuff here that annotates http://some.namespace#myUniqueAttributeId1 -->
                <rdf:RDF
                        xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
                        xmlns:o="http:/oboe-core#">
                        <rdf:Description rdf:about="http://some.namespace#myUniqueAttributeId1">
                                <o:entity>Air</o:entity>
                                <o:characteristic>Temperature</o:characteristic>
                                <cd:unit>Celsius</cd:unit>
                        </rdf:Description>
                </rdf:RDF>
        </metadata>
</additionalMetadata>
<additionalMetadata>
        <describes>http://some.namespace#myUniqueAttributeId2</describes>
        <metadata>
                <!-- RDF stuff here that annotates http://some.namespace#myUniqueAttributeId2 -->
        </metadata>
</additionalMetadata>
</eml>

```






A complete implementation goes beyond translating the schema vocabulary to ontogogical terms where it makes sense to do so (e.g. units of measurement, taxonomy) 

Where else does it make sense to translate schema vocabularly into semantics?  

- Licenses?  (dc:rights)
- Titles, people, dates, rest of citation information (via `dc:title`, `dc:contributor`, `prism:` or `fabio:` etc)
- attribute

Would it be possible to create a XSLT stylesheet that one would apply to an EML file to produce corresponding RDF/XML file (that I could then amend to the original EML in an `additionalMetadata` element)?  I see the value of having the semantic metadata embedded in a single file, but rather than merely implementing R code that says "when you write a `<standardUnit>Celsius` node, also write this `additionalMetadata` node, it seems logical to have a tool that could simply read EML and say, "hey, `<standardUnit>Celsius`, that's an `<RDF ...`".  Perhaps similar mappings could be made for taxonomy (though might need to query ubio for the identifier etc and so be beyond the scope of XSLT)?  

Such an XSLT might also map things like `<creator>`, `<title>`, `<intellectionalRights>` etc to their ontological meanings too.  Of course I don't know anything about XSLT, and before we can programmatically combine spreadsheets, etc we really need to be adding custom semantics for all attributes, not just making RDFs of the things that are already defined...


Whoops, we can get lost down the rabbit hole quickly here. e.g. Why not write all data to triples (e.g. see tools for [RDF from CSV](http://www.w3.org/wiki/ConverterToRdf#CSV_.28Comma-Separated_Values.29)... (Longevity of RDF? Of any given XML schema?)

- RDF as schema-less XML?


**Reading Semantics** (and actually doing something with it): the really hard problem motivating this exercise:  [#8](https://github.com/ropensci/reml/issues/8).  We'll get to this one eventually.  


### Schema-oriented design

We can leverage the `.xsd` schema files much more directly in creating our parser using a strategy built around S4 classes, as discussed in issue [#38](https://github.com/ropensci/reml/issues/38).  This leaves us with a lot of coercion to do. On the up side, we have reasonble S4 classes representing the EML contents, so we can consider it "parsed".  Defining how we write into these S4 objects instead of how we write into XML directly also makes our implementation more robust to changes in the schema. Coercion with S4 can leverage a variety of heurstics to make this pretty easy (e.g. simple matching of slot names, guessing parsing etc).  Also allows us to have things like `data.frames` that carry their metadata around with them.  




