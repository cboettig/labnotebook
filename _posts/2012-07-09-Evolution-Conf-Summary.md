---
layout: post
title: Evolution and iEvobio conference notes 
category: evolution
tags: conference

---


Saturday
--------
* Jeremy Brown
* Graham Slater
* (Education Data Symposium)
* Cecile Ane
* Joe Felsenstein
* Lars Schmitz
* Carl Boettiger
* Liam Revell
* Brian O'Meara (Leithan McGonigle)

Sunday
------
* Marie-Josee Fortin
* Emma Goldberg 10:45 rm 209
* Networks Symposium
* Jeremy Fox 1.30p Rm 201 (Adaptation B)
* Schluter 2:15p Canada 2-3
* Rosie Redfield public lecture

Monday
------
* 9:00 Michael Landis, 203
* 9:30 Dick Gumolkiowicz 214 
* 10:30 Dean Adams
* 11 (Cavender-Bares, 214) (Bolnick, 213)
* 11:30 Mark McPeek 214

Tuesday
-------
* Luke Harmon 9am rm 214
* Luke Mahler 9am rm 210
* Rafael Maia 9:15a rm 210
* Sam Price  11:15a rm 210
* Liam Revell 11:30 Canada 2-3
* Dan Rabosky 2:30pm Canada 2-3
* Tanja Stadler 3pm  Canada 2-3
* Chris Martin 3pm rm 213

Also: ievobio Day 1.


Wednesday
---------

* #ievobio all day. 
* Slides for my #ievobio [lightning talk on rOpenSci](http://cboettig.github.com/talks/ievobio2012/)

Sunday - Tuesday twitter notes
------------------------------


### Grabbing my twitter-notes with R

Extracted with a few twitter commands

```r
library(twitteR)
me <- userTimeline("cboettig", n=300)
me <- twListToDF(me)
evol2012 <- grep("#evol2012", me$text)
ievobio <- grep("#ievobio", me$text)
writeLines(con="evol2012.txt", me$text[evol2012])
writeLines(con="ievobio.txt", me$text[ievobio])
```

Should add some gsub commands to provide html markup.  For the moment used vim:

```
:%s/@\([A-Za-z0-9_]\+\)/<a href="http:\/\/twitter.com\/\1">\1<\/a>/g
```

### Tweet log

<div>
Wishing I had checked flight timezone earlier and not had to make hasty exit from #ievobio  #whoops but #justmadeplane
<br/><br/>
You're right of course! #oversimplified 5min  RT <a href="http://twitter.com/snacktavish">@snacktavish</a> "Why R? - 99% of people are already there."- <a href="http://twitter.com/cboettig">@cboettig</a>. I disagree! #iEvoBio
<br/><br/>
J Sachs gives us ontology and semantics 101, &amp; quoting the referees critique followed by many acronyms... owl ?= rdf  #ievobio
<br/><br/>
.<a href="http://twitter.com/BetaScience">@BetaScience</a> brings us back to phylogenetic tools, but plugs his #openscience by mentioning biotorrents http://t.co/NiRtPuIr #ievobio
<br/><br/>
RT <a href="http://twitter.com/kcranstn">@kcranstn</a>: .<a href="http://twitter.com/tjvision">@tjvision</a> giving a shout-out to totalimpact http://t.co/RhGLCIry at #ievobio with <a href="http://twitter.com/jasonpriem">@jasonpriem</a> and <a href="http://twitter.com/researchremix">@researchremix</a>
<br/><br/>
Help <a href="http://twitter.com/researchremix">@researchremix</a> + <a href="http://twitter.com/tjvision">@tjvision</a> hypothesize why sharing public data results in increased citation rates: http://t.co/Ka5nTleU #ievobio
<br/><br/>
<a href="http://twitter.com/neurocy">@neurocy</a> definitely. I can't stay for the +1 day, but maybe get those guys involved too
<br/><br/>
.<a href="http://twitter.com/tjvision">@tjvision</a> presents on "Data reuse and scholarly reward" study with <a href="http://twitter.com/researchremix">@researchremix</a>, discussing #PLoS paper http://t.co/iSyCRlkw #ievobio
<br/><br/>
<a href="http://twitter.com/pete_cowman">@pete_cowman</a> <a href="http://twitter.com/LSU_FISH">@LSU_FISH</a> rm 214
<br/><br/>
and my lightening talk coming up! RT <a href="http://twitter.com/rOpenSci">@rOpenSci</a>: Hey #ievobio, <a href="http://twitter.com/_inundata">@_inundata</a> explained <a href="http://twitter.com/rOpenSci">@rOpenSci</a> at #rstats user group http://t.co/MgGYIYGS
<br/><br/>
<a href="http://twitter.com/neurocy">@neurocy</a> interesting idea! Could be very helpful both as a resource &amp; a model of how to make these things mainstream science in diff fields?
<br/><br/>
sounds like many similar ideas are in hypothes.is RT <a href="http://twitter.com/omearabrian">@omearabrian</a>: reputation seems to work well on #stackoverflow, imho #ievobio
<br/><br/>
<a href="http://twitter.com/neurocy">@neurocy</a> yup. but methods developers just took the 3 young investigator awards at main conference too... a promising sign?
<br/><br/>
<a href="http://twitter.com/neurocy">@neurocy</a> at least part of it is I think; on the informatics/developer side. Can only hope the rest of our community will follow.
<br/><br/>
RT <a href="http://twitter.com/neurocy">@neurocy</a>: <a href="http://twitter.com/cboettig">@cboettig</a> is the #ievobio community really as forward-thinking as you make it sound? you may as well be at a science 2.0 conf!
<br/><br/>
50-90%, some refs here: http://t.co/t8GA0Q5y RT <a href="http://twitter.com/hlapp">@hlapp</a> <a href="http://twitter.com/omearabrian">@omearabrian</a>: peer review not limiting vol of papers -- gets out eventually #ievobio
<br/><br/>
Whaley cites <a href="http://twitter.com/mbeisen">@mbeisen</a> http://t.co/g7tnuxgu "Peer review is f**ed -- let's fix it" #ievobio
<br/><br/>
"That is why arXiv readers are eager to nav the raw
<br/><br/>
material, and value the accel avail over the filtering by the journal" Ginsberg #ievobio
<br/><br/>
Dan is founder of http://t.co/Py8JSR03 and an established web entrepreneur #ievobio
<br/><br/>
MT <a href="http://twitter.com/kcranstn">@kcranstn</a>: download Whaley's presentation, "Re-imagining peer review" at #ievobio http://t.co/orQBtzyz
<br/><br/>
<a href="http://twitter.com/matstopel">@matstopel</a> Hi! Yup: <a href="http://twitter.com/RoseRedfield">@RoseRedfield</a> mentioned her open notebook and encouraged others, &amp; Liam Revell mentioned his #ONS dev blog.
<br/><br/>
<a href="http://twitter.com/hylopsar">@hylopsar</a> <a href="http://twitter.com/phylorich">@phylorich</a> sounds like "sometimes?" Don't  think is doing quasse+auteur with dens dep model + exp scaling on tree?
<br/><br/>
Stadler adapting her speciation-extinction models 2 SIR dynamics. Cool! but I missed what's new here to the epi lit &amp; can't find the JTB pub
<br/><br/>
Stadler: "cannot explain high imbalance" #evol2012 wouldn't an explanation require a non-Markovian branching model? / <a href="http://twitter.com/jembrown">@jembrown</a>
<br/><br/>
Tanja (Gernhard) Stadler gives Maynard Smith award talk also describing phylo methods in #rstats: TreePar. #evol2012 http://t.co/odxYnD0j
<br/><br/>
.<a href="http://twitter.com/hylopsar">@hylopsar</a> <a href="http://twitter.com/richfitz">@richfitz</a> know if Rabosky's BAMM is est. trait + speciation together (diversitree style?)
<br/><br/>
RT <a href="http://twitter.com/hylopsar">@hylopsar</a> Rabosky: BAMM: RJMCMC to identify shifts in diversification models in trees (incl time/density dpdt, incomp samp)  #evol2012
<br/><br/>
Yay for self-updating! RT <a href="http://twitter.com/matstopel">@matstopel</a> RT <a href="http://twitter.com/rob_beiko">@rob_beiko</a>: #ievobio Antonelli: goal is self-updating thingo that supports many downstream analyses
<br/><br/>
.<a href="http://twitter.com/omearabrian">@omearabrian</a> has also cloned himself to speed up writing of datelife #ievobio (writes code from two computers nearly simultaneously)
<br/><br/>
who says #rstats can't be a webserver? RT <a href="http://twitter.com/rob_beiko">@rob_beiko</a>: #ievobio O'Meara just got possessed by the R daemon, I think.
<br/><br/>
Datelife is running an #rstats server FastRWeb http://t.co/McBYogHl and http://t.co/6KDYtK8R on backend for computations #ievobio
<br/><br/>
Link to API documentation? RT <a href="http://twitter.com/rob_beiko">@rob_beiko</a>: #ievobio O'Meara: uses restful API, allows embargoed data with appropriate flag set / <a href="http://twitter.com/rOpenSci">@rOpenSci</a>
<br/><br/>
.<a href="http://twitter.com/omearabrian">@omearabrian</a> Why not use http://t.co/lKICFiOm ? Not open software, not open data, forbids data mining.  #ievobio. Use http://t.co/QSE9QO15
<br/><br/>
.#ievobio: <a href="http://twitter.com/omearabrian">@omearabrian</a>: why do this? Because one of the most popular ways is just to make it up.
<br/><br/>
.#ievobio <a href="http://twitter.com/omerabrian">@omerabrian</a> presents DateLife for the Challenge Entry on huge phylogenies.  Check it out on http://t.co/IxJbAJoa
<br/><br/>
Liam's dev blog is a kind of open lab notebook; a reference source for himself and the community #evol2012 #openscience http://t.co/iKaRJjhn
<br/><br/>
.#evol2012 #littleknownfact Liam has an active herp research program. (if he's not replying on #r-sig-phylo in 20sec, he's catching lizards)
<br/><br/>
Liam Revell gives the <a href="http://twitter.com/ASNAmNat">@ASNAmNat</a> Young Investigator award, talking about "New phylo comparative methods" #evol2012
<br/><br/>
Price uses sgima^2/alpha ratio to estimate disparity, `cause alpha is better measure of phylo signal than lambda #evol2012 #verytrue
<br/><br/>
Sam Price http://t.co/L0PNq599 asks: do vertebrate eyes evolve slower than teeth? Phylo methods to compare rates across traits #evol2012
<br/><br/>
<a href="http://twitter.com/phylorich">@phylorich</a> <a href="http://twitter.com/michaelbarton">@michaelbarton</a> agreed -- I think ecologists prefer the messy syntax of #rstats to the sterile whitespace of python! #ievobio
<br/><br/>
RT <a href="http://twitter.com/michaelbarton">@michaelbarton</a>: #bioinfsurvey python is the fastest growing in life sciences, while R is current most used. http://t.co/n3qo7Ufe #ievobio
<br/><br/>
<a href="http://twitter.com/michaelbarton">@michaelbarton</a> <a href="http://twitter.com/hylopsar">@hylopsar</a> is being modest. folks I hear are raving about a nice presentation of so many cutting edge methods ;-)
<br/><br/>
Ree chooses #python, despite 99% of phylogenetics being in #rstats.  Notes natural sciences/industry python is widespread #ievobio
<br/><br/>
Ree says current (&amp; future) is in scripting. extensible. modular. API == #rstats. but needs more interactive &amp; dynamic graphics. #ievobio
<br/><br/>
Ree describes evolution of phylo software: console (no GUI, no interaction) -&gt; desktop app (GUI, interactive) -&gt; scripting #rstats #ievobio
<br/><br/>
RT <a href="http://twitter.com/hlapp">@hlapp</a>: . <a href="http://twitter.com/kcranstn">@kcranstn</a>: Remote participation using G+ hangouts worked quite well.  #ievobio
<br/><br/>
A well-named team for working on front-end UI! RT <a href="http://twitter.com/rob_beiko">@rob_beiko</a>: #ievobio Cranston: five subgroups including my favorite, "shiny"
<br/><br/>
This time with targeted goals, worked well! RT <a href="http://twitter.com/BrownJosephW">@BrownJosephW</a>: Phylotastic == lock a bunch of geeks in a room for 5 days. #evol2012 #ievobio
<br/><br/>
.#ievobio <a href="http://twitter.com/kcranstn">@kcranstn</a> visit phylotastic on github: https://t.co/W7tHJTNw or check out the demos: http://t.co/FoZUWEyB #evol2012
<br/><br/>
<a href="http://twitter.com/pleunipennings">@pleunipennings</a> The OneZoom huge tree visualization?  not up yet, will be at http://t.co/FB2XfO8T
<br/><br/>
.<a href="http://twitter.com/hylopsar">@hylopsar</a> also uses musse approach to show these sexual color changes impact diversification rates #evol2012
<br/><br/>
Mahler used a mecca (stepwise AIC) approach to multi OU (ouch) model.  #evol2012
<br/><br/>
.<a href="http://twitter.com/hylopsar">@hylopsar</a> looks at evolution of irridescent colors in african starlings (using OUwie &amp; pmc!)
<br/><br/>
Luke presents a mecca (stepwise AIC) approach to multi OU (ouch) model.  #evol2012
<br/><br/>
Luke Mahler puts the replicated evolution story of the Anoles to the test: phylo analysis including weird taxa #evol2012
<br/><br/>
.<a href="http://twitter.com/phylorich">@phylorich</a> he omitted the error bars... still makes you wonder how far purely phylo approach to diversification can go... #evol2012
<br/><br/>
In a bonus slide in the Q&amp;A, Mark shows each speciation event matched to a glaciation event #evol2012
<br/><br/>
McPeek's synthesis of detailed community ecology, habitat, behavior, phylogenetics &amp; evolution is mindblowing. #evol2012
<br/><br/>
Mark McPeek Macroevolutionary ecology: a tale of woe and intrigue in Damselflies of N America. Lake systems make replicate #evol2012 expts
<br/><br/>
The tree of millions of tips is, at it's original scale, larger than the known universe.  Feels like a flyby in Google earth. #evol2011
<br/><br/>
Rosindell: The Google Maps of the "Tree of Life" presented for the first time at #evol2012 zooming in with rich metadata
<br/><br/>
Dick Gomulkiewicz: a pop gen look at evolution's impact on community assembly (well, invasion when rare) #evol2011
<br/><br/>
Cavender-Bares: Oaks are a "worst case scenario for the biological species concept" Coyne &amp; Orr #evol2012
<br/><br/>
I don't get it Dean. How do we pick units to compare evolution in widely different traits? #evol2012 constrained Cholesky doesn't address?
<br/><br/>
Dean Adams packing the house at #evol2012; explores thorny question of comparing rates of evolution between different traits
<br/><br/>
See the nice model of Gomulkiewicz &amp; colleagues here http://t.co/boPzbVBV #evol2012
<br/><br/>
Dick Gomulkiewicz brings a pop gen view to evolution on invasion "Evolution doesn't always matter -- that's what the theory says" #evol2012
<br/><br/>
<a href="http://twitter.com/jembrown">@jembrown</a> How'd I miss this! Does Landis have software or pub on this work out yet?
<br/><br/>
<a href="http://twitter.com/CMastication">@CMastication</a> an Anolis grahami I'm told! Perhaps you are in Jamaica (where grahami is native) or Bermuda (where it is introduced)?
<br/><br/>
Who says you can't publish #openaccess null results or replications of previous studies in <a href="http://twitter.com/sciencemagazine">@sciencemagazine</a>? http://t.co/Z5f4j5oL #evol2012
<br/><br/>
Here comes <a href="http://twitter.com/RosieRedfield">@RosieRedfield</a> #openscience punchline, calling the bluff of Science and sharing her work before July 26 embargo #evol2012
<br/><br/>
.<a href="http://twitter.com/john_s_wilkins">@john_s_wilkins</a> <a href="http://twitter.com/ironlisa">@ironlisa</a> <a href="http://twitter.com/Boraz">@Boraz</a> exactly! as <a href="http://twitter.com/RosieRedfield">@RosieRedfield</a> says, they reversed their thoughts on social media over this #evol2012 #irony
<br/><br/>
.#arseniclife authors used social media to promote-- &amp; still do: check out lead author Felisa's views on this story too: <a href="http://twitter.com/ironlisa">@ironlisa</a> #evol2012
<br/><br/>
RT <a href="http://twitter.com/David_Dobbs">@David_Dobbs</a>: the #arseniclife saga continues to highlight and recast both problems &amp; ops in scientific publishing and media. #evol2012
</div>
<br/><br/>

