---
layout: post
category: evolution
tags: 
- ropensci
- rnexml

---


- test_ape.R unit tests now passing.
Should still revise the coercion methods in nexml_write.R to something more clever.  We aren't
coercing a tree to a nexml, we are building a nexml from a tree.  Likewise handling
the otu assignments of species names should be done directly [11:20 am 2013/08/28](https://github.com/ropensci/RNeXML/commit/8a182d4cc6fb75099067142327788be8d51eef6e)
- start cleaning up old read/write methods obsoleted by toNeXML/fromNeXML methods [10:59 am 2013/08/28](https://github.com/ropensci/RNeXML/commit/ffb7342f1d28b351984685a83e11d7df488696e8)
- inherited classes now replace all the original classes [10:54 am 2013/08/28](https://github.com/ropensci/RNeXML/commit/004d31fc2c87a4cf2dba45ab08f1b8a663ab5258)
- All inheritance-based classes appearing in inst/examples/trees.xml now implemented [10:53 am 2013/08/28](https://github.com/ropensci/RNeXML/commit/d9e649ac64b697d4ea982a1bb78b403400984392)
- added classes for otu, otus, tree, trees, nexml, edge, rootEdge [12:04 am 2013/08/28](https://github.com/ropensci/RNeXML/commit/b9543f64352759f4dbb1f77a170cced78280c9a7)




- Working on #1 : What works and what doesn't:
The example in inst/tests/inheritance.R should run using the class
definitions in R/inherited_classes.R.  Other class definitions are
obsoleted by these updates and should eventually be removed.
The ape methods should be unaffected, since the S4 classes have the
same structure as before, only defined through inheritance instead.

ToDo:
- Remove the obsoleted methods in classes.R, nexml_read.R and nexml_write.R
- Check the ape.R unit tests, update other unit tests
- Write remaining essential classes out by hand based on
inheritance and schema definitions: e.g. edge, otu, otus, tree, trees, nexml [04:26 pm 2013/08/27](https://github.com/ropensci/RNeXML/commit/fd2e6b0f8f31823c4c65916a20fe339fb2038646)
- Begun replacing class definitions with inheritance-based classes
taking a brute-force approach in defining conversion methods.
Conversion methods between XML and S4 explicitly assign attributes
and values to S4 slots, rather than using the clever XML package
functions to guess what goes where (since that approach cannot
include a call to callNextMethod, which allows us to recursively
go down the inheritance classes. The up side of this approach is
that you don't have to think much to write methods, it's merely verbose.) [04:11 pm 2013/08/27](https://github.com/ropensci/RNeXML/commit/8b45dee59848702c5aea6bf23ea06802b462d55d)

- fixed ape tests, extended setAs('nexml', 'phylo')
to handle the case of multiple trees [04:27 pm 2013/08/28](https://github.com/ropensci/RNeXML/commit/4fa252e20c7ee44a93573d3eb2c5dd3e781103c3)
- Now use otu labels as species names in both directions, closes #8
See updated tests in inst/test/test_ape.R.
Note that coercing phylo->tree is still permitted, since resulting S4 tree is valid (though really intended as internal),
but coercing tree->phylo is no longer available as a separate routine, since this is lossy as the tip.labels are not
stored in tree but in nexml@otu [03:54 pm 2013/08/28](https://github.com/ropensci/RNeXML/commit/abf298614f587d7eb99c67a0acd15d731690df54)
- updated nexml->ape conversion to get tip.labels from otus
instead of just using the otu attribute on the node, which simply corresponds to the id of the otu element in otu.
the taxon (species name) is in the label of the matching element instead.  Still needs some testing and a unit test
to confirm the label is correct.  This addresses 1/2 of #8.

Still need to handle the case of coercing ape->nexml, in which a method generates the otus node from the tip.label list
and matches the id to node's otu attribute.  This means that ape->tree doesn't look at tip.label, but just generates
locally unique keys for the node otu attribute [01:40 pm 2013/08/28](https://github.com/ropensci/RNeXML/commit/b97df1abac843b33214109d95c5baaa740dbe83e)


