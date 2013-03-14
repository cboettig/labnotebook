---
layout: post
published: false

---


From Ben: 

> I think you are right on the mark when you equate html and EML.  The former is a bit 'looser' in that you can pretty much have anything under the sun in html, whereas with EML it is highly structured an prescriptive about what information should be included and how it is formatted. Taking your fishbase.org example, you could certainly annotate it (that's the "a" in RDFa, no?) such that you ended up with a handy collection of triples:
<Lates-niloticus> <hasClassification> <ray-finned fishes>
<Lates-niloticus> <hasEnvironment> <Freshwater>
<Lates-niloticus> <hasClimate> <Tropical>
etc…(lots and lots of these)

> to query across like this:
"find all fresh the freshwater tropical fish in fishbase.org"

> In EML we might have a dataset of a bunch of different fish species - one on each row, with some attributes about each going across the columns (species, classification, environment, climate). Then we'd annotate this EML-described dataset from an ontology (perhaps extending from the core OBOE ontology) that provided the relevant concepts for this kind of fish data. (Which, incidentally, we do not have.)

> There are, depending on your perspective, many ontologies to choose from or none. What I mean is that getting a community to agree on a set of structured concepts is very difficult, no matter how simple the domain. "Cars have four wheels" /"Hey, what about those funny tear-drop-shapped cars that only have three?!" Even if you do find a "good" ontology, it needs to be tied into to other good ontologies in order to make it more broadly useful. We do not need 10 different definitions of "Gram" -- but we, as a community of ontologists, don't yet have a canonical ontology for that sort of thing. You'll notice that one of our OBOE modules includes a unit list with just these sorts of concepts: http://ecoinformatics.org/oboe/oboe.1.0/oboe-standards.owl#Gram. There are, of course, efforts to map equivalencies between different ontologies when it makes sense. Gram might be pretty standard, but it gets more subjective when you start trying to express things like "hasClimate Tropical". So that's kind of where we are with that.

> If you want to checkout the various OBOE modules that are imported in the http://ecoinformatics.org/oboe/oboe.1.0/oboe.owl you referenced, it would be worth your time to grab a copy of Protege so you can effectively explore the full ontology. It's not complete, but does represent a number of years worth of research by a number of different parties in both the ecological and computer science realms.


