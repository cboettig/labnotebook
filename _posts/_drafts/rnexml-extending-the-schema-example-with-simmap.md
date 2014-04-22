---
layout: post
published: false
category: evolution
tags:
- RNeXML

---


A key feature of the NeXML format is the ability to extend the schema
to define new data types as the need arises.  This can be done through
either of two general ways: embedding XML (preferrably one adhering to a
specficied schema to mantain schema validation; see phenoscape project
for an example), or using metadata annotation (in the RDFa format).
The latter has several advantages.

- We can use the methods in `RNeXML` to easily generate and use these
`meta` elements without any knowledge of XML.

- We can also more easily leverage powerful semantic methods for RDF
manipulation.

- They are easier to interpret, since meta elements are defined within the
original NeXML schema. Tools designed to parse NeXML thus can manipulate
this information without resulting to raw XML parsing.


