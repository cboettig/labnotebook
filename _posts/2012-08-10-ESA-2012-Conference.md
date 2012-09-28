---
layout: post
category: ecology
tags: conference

---


* **[My Schedule](/assets/files/ESA2012_cboettig_schedule.pdf)**
* Meetings/discussion with Don Strong, Tony Ives, Marten Scheffer, Justin Yeakel, Karen Abbott, Jarrett Byrnes, Christopher Lortie.   
* Check in with Paul Armsworth on working group
* rOpenSci tutorial session (below)
* tweetup
* My contributed talk (below)


## rOpenSci tutorial, Thursday

A year out from our launch at ESA last year, we presented an introduction and tutorial on rOpenSci.  Slides and links to more information are all available at [esa.ropensci.org](http://esa.ropensci.org).  

## Slides from my talk, Friday

<iframe src="http://www.slideshare.net/slideshow/embed_code/13962709?hostedIn=slideshare&page=upload" width="476" height="400" frameborder="0" marginwidth="0" marginheight="0" scrolling="no"></iframe>


## Twitter Notes (generated from R)





```r
library(twitteR)
hashtag <- "#ESA2012"
user <- "cboettig"
```




Generate a list of a user's conference tweets



```r
tweets <- twListToDF(userTimeline(user, n = 500))
tagged <- grep(hashtag, tweets$text, ignore.case = TRUE)
```




Write to file, making links appear as links



```r
text <- tweets$text[tagged]
text <- gsub("(@[A-Za-z0-9_]+)", "<a href=\"http://twitter.com/\\1\">\\1</a>", 
    text)
text
```

### My twitter notes

 [1] ".<a href=\"http://twitter.com/@luketkelly\">@luketkelly</a> uses GAMM for species response from time since fire, interval, intensity, etc, then solves SDP for optimal policy #esa2012"                                                  
 [2] ".<a href=\"http://twitter.com/@luketkelly\">@luketkelly</a> optimizes distrib of time since fire to maximize geom mean of biodiversity - better than arithmetic or shannon. #esa2012"                                                    
 [3] ".<a href=\"http://twitter.com/@luketkelly\">@luketkelly</a> on optimal fire histories for conserving biodiversity #esa2012 w/ amazing images from down under"                                                                            
 [4] "Armsworth's analysis in eco let http://t.co/w5W8Ubsa #esa2012"                                                                                                                                                                           
 [5] "Armswortth shows paying farmers for biodiversity gains is best when spatially targeted &amp; worse with multispecies targets #esa2012"                                                                                                   
 [6] "Fun at #esa2012 where a physics PhD student presents the experimental study testing the mathematical theories presented by the ecology PhD"                                                                                              
 [7] "Yet another Science paper described at #esa2012 resilience session: warning signals in yeast dynamics http://t.co/QRGwSH2x"                                                                                                              
 [8] "Michael Pace shows early warning in zooplankton levels in lake ecosystem experiment. #esa2012 Why is cv=1 a special value?"                                                                                                              
 [9] "David Seekell speaking on conditional #heteroskedacity as an early warning signal of sudden shifts #esa2012"                                                                                                                             
[10] "See Will's recent paper for correct link to Doak et al http://t.co/fVclkNM9 #esa2012 (link pdfs from homepages &amp; help a tweep out!)"                                                                                                 
[11] "Notes that portfolio effect is inevitable, cites Dan Doak paper: http://t.co/3RDcyI8L need different null #esa2012"                                                                                                                      
[12] "96% of returning CA salmon come from hatcheries #esa2012"                                                                                                                                                                                
[13] "Portfolio effects in salmon stocks: do fish manage risk better than bankers? Will Satterthwaite up now #esa2012"                                                                                                                         
[14] "Alex Perkins examines impact of poor mixing in disease dynamics, draws analogy to #esa2012 mixers. Transmission is a very local process!"                                                                                                
[15] "Learn how 2 get data &amp; full text open access literature/metadata through R/#rstats w/ <a href=\"http://twitter.com/@ropensci\">@ropensci</a> 11:30a F150 http://t.co/zkifSTuU #esa2012"                                              
[16] "de Roos just showed how total biomass can increase with *increased* mortality. #Wow. #esa2012"                                                                                                                                           
[17] "de Roos: asymmetry/differences in age/size responses (e.g. biomass production) leads to alternate stable states #esa2012"                                                                                                                
[18] "Andrre de Roos shows how ontogenetic assymetry (size structure) breaks basic pop dyn predictions #esa2012"                                                                                                                               
[19] "Check out <a href=\"http://twitter.com/@luketkelly\">@luketkelly</a> 's talk at #esa2012 Friday (10:20a?) #notetoself"                                                                                                                   
[20] "#esa2012 Come to the <a href=\"http://twitter.com/@nceas\">@nceas</a> &amp; <a href=\"http://twitter.com/@sesync\">@sesync</a> mixer, 6:30 PM-8:00 PM, in conference center rm F150"                                                     
[21] "In case you missed the talk or the links, see <a href=\"http://twitter.com/@jebyrnes\">@jebyrnes</a> slides online http://t.co/nCcrvAYE #esa2012"                                                                                        
[22] ".<a href=\"http://twitter.com/@jebyrnes\">@jebyrnes</a> mentions Nielsen's book on online #openscience. Also see his TED talk http://t.co/UkCYR7xV #esa2012"                                                                             
[23] ".<a href=\"http://twitter.com/@jebyrnes\">@jebyrnes</a> reminds us that we live in the 21st century.  \"Taking the science conversation online\" #esa2012"                                                                               
[24] "Ruckelshaus <a href=\"http://twitter.com/@NatCapProject\">@NatCapProject</a> echoes Kareiva's theme of collaborating with groups you don't agree with: \"I'm with stupid\" #esa2012"                                                     
[25] "Karevia: Best levers for change are private sector, not public. Don't testify before congress, but before Walmart &amp; DOW #esa2012"                                                                                                    
[26] "Karieva cites G. West on cities and creativity, possibly this paper: http://t.co/WBGJtLTl #esa2012"                                                                                                                                      
[27] "Karevia channels Sarah Palin: how's that \"hope-y change-y thing going?\" #esa2012 need more than talking to congress about ecology"                                                                                                     
[28] "Olsen: problem isn't information, it's informatics (making sense of information) #esa2012"                                                                                                                                               
[29] "Olsen: cites Karevia, biggest problem is scientists cease to be good listeners. #esa2012 Buisnesses hire improv actors to learn this"                                                                                                    
[30] "Randy Olsen: scientists evolved from humans. Split was pretty recent. Still have vestiges of story-telling. Don't lose them! #esa2012"                                                                                                   
[31] "Can find the room by the line going deep into the hallway RT <a href=\"http://twitter.com/@carlystrasser\">@carlystrasser</a>: .<a href=\"http://twitter.com/@se_hampton\">@se_hampton</a> is TEARING IT UP. join the fun  A106 #ESA2012"
[32] "to be accessible to reviewers RT <a href=\"http://twitter.com/@rOpenSci\">@rOpenSci</a>: Ecological Monographs now requires data to be deposited prior to publication #esa2012"                                                          
[33] "Ben Bolker on the need for off-the-shelf methods: not enough staticians for every ecologist to have a stats buddy 4 custom methods #esa2012"                                                                                             
[34] "#esa2012 stats discussion: \"all modeling is exploratory. If you think AIC confirms your hypothesis, you're wrong\""                                                                                                                     
[35] "Yeakel uses perturbations/return rate to estimate elasticity, more senstive to fun. form, see http://t.co/AX3ds7uR #esa2012 #mustread"                                                                                                   
[36] "Yeakel cites http://t.co/UYaDso0d on nonpar bayes, compares to generalized models #esa2012"                                                                                                                                              
[37] "Excellent #esa2012 session understand vs predict in modelling. Explores ecologist's v of Breiman's \"Two Cultures\" http://t.co/TIDL87hZ"                                                                                                
[38] "Kellner: Multispecies modelling has biggest impact when including non-consumptive value http://t.co/lj3NN0Be #esa2012"                                                                                                                   
[39] "Kellner presents rich model for multispecies management of fisheries, see http://t.co/fdopymKB #esa2012"                                                                                                                                 
[40] "Bobby describing  disease modeling: humans are essentially widgets that eventually fail #esa2012"                                                                                                                                        
[41] "Not nearly enough room for the crowd outside Karen Abbott's talk: what's so special about alternative stable states? #esa2012"                                                                                                           
[42] "#esa2012 <a href=\"http://twitter.com/@sesync\">@sesync</a> panel live peer-review of audience-submitted ideas. Levin: \"It should count: I view social science as subset of ecology\""                                                  
[43] "Ray Hilborn \"fisheries management is people management\" need socio-econ context of ecology. <a href=\"http://twitter.com/@sesync\">@sesync</a> #esa2012"                                                                               
[44] "Molly discusses \"most important number you've never heard of\" - Social cost of carbon #esa2012 <a href=\"http://twitter.com/@sesync\">@sesync</a> ($25/ton is current est)"                                                            
[45] "Lopez-Hoffman explores equitable water-rights that conserve ecosystem services, e.g. Colarado river use <a href=\"http://twitter.com/@sesync\">@sesync</a> #esa2012"                                                                     
[46] "Levin: cites common-pool resources example from African cattle http://t.co/j35iY3MO #esa2012"                                                                                                                                            
[47] "Simon Levin speaking <a href=\"http://twitter.com/@sesync\">@sesync</a> panel: polycentric appches to international agreements on enviro resources #esa2012"                                                                             
[48] "#esa2012 <a href=\"http://twitter.com/@sesync\">@sesync</a> will focus on \"wicked problems\" (technical term) using theme-driven, interdisciplinary approaches"                                                                         
[49] "Excellent #esa2012 session intro 2 <a href=\"http://twitter.com/@sesync\">@sesync</a>: \"if you're familiar with <a href=\"http://twitter.com/@nceas\">@nceas</a>, you're familiar w/ synthesis\". Now focus on socio-econ + uncert"     
[50] "#esa2012 <a href=\"http://twitter.com/@biocreativity\">@biocreativity</a> Speaking of art-science collab, don't forget Dr. Scheffer's \"Critical Transitions, the Movie\" http://t.co/2nM6RxL9"                                          
[51] "Lubchenco discusses NOAA's effort to create climate services like their drought forecasting software: http://t.co/zSRN3Y2U #esa2012"                                                                                                     
[52] "Lubchenco's Q&amp;A brings with disclaimer about Hatch Act: she is speaking for the agency, not the campaign, and can't answer some Q's #esa2012"                                                                                        
[53] "At #esa2011 plenary, Pacala encouraged us to spend some time on policy-rel issues. #esa2012 Lubchenco raises the bar: run for office!"                                                                                                   
[54] "For instance, to promote outreach, NOAA workers are encouraged to use social media, see their policy: http://t.co/SqSw6UeK #esa2012"                                                                                                     
[55] "Lubchenco trumpets success of Magnuson-Stevens Act of 2007 (http://t.co/bOqdasVT) as the policy which will end overfishing #esa2012"                                                                                                     
[56] "Lubchenco discusses examples of ecosystem thinking in policy such as the Ocean Policy Task Force: http://t.co/XeyAkQVc #ESA2012"                                                                                                         
[57] "#esa2012 Lubchenco on the challenge of scale across ecological, social + econ contexts: highlights DeFries 2012 http://t.co/NEU3AdiQ"                                                                                                    
[58] "Jane Lubchenco, opening plenary of #esa2012, dedicates her talk to economics Nobel Laureate Elinor Ostrom http://t.co/XZLEeUnQ"                                                                                                          
[59] ".<a href=\"http://twitter.com/@mickresearch\">@mickresearch</a> speaker ready rooms are D134 &amp; F152 7a-7p, by reservation(?) (program pg 7).  Looking forward to your talk btw #esa2012"                                             
[60] "#esa2012 is trying to facilitate networking for young scientists by labeling cocktail tables by sub-field during tonight's reception"                                                                                                    
[61] "Off to Portland for #esa2012"                                                                                                                                                                                                            



### Mentions at conference, (other than retweets)



```r
mentions <- twListToDF(searchTwitter(paste("@", user, sep = ""), 
    n = 300))
with_hashtag <- grep(hashtag, mentions$text, ignore.case = TRUE)
rt <- grep("RT\\s", mentions$text)
me_not_rt <- with_hashtag[!(with_hashtag %in% rt)]
```




Again, write the output 



```r
text2 <- mentions$text[me_not_rt]
text2 <- gsub("(@[A-Za-z0-9_]+)", "<a href=\"http://twitter.com/\\1\">\\1</a>", 
    text2)
text2
```

 [1] ". <a href=\"http://twitter.com/@cboettig\">@cboettig</a> building cost of switching policies into models necessary &amp; provide better outcomes that reduce costs of management #ESA2012"                                                                                                                                                                                                                                                                                                                                                                                                                                 
 [2] ". <a href=\"http://twitter.com/@cboettig\">@cboettig</a> most optimal management strategies produce fluctuations that policy makers don't like - we can model their dislike! #esa2012"                                                                                                                                                                                                                                                                                                                                                                                                                                     
 [3] ".<a href=\"http://twitter.com/@cboettig\">@cboettig</a> enthusiastically uniting decision theory and resilience theory for management.  Making math exciting!  #esa2012"                                                                                                                                                                                                                                                                                                                                                                                                                                                   
 [4] "Go see <a href=\"http://twitter.com/@cboettig\">@cboettig</a> (Carl Boettiger's) talk today in E143 at 920 - he gives a great engaging talk #esa2012"                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
 [5] "#FF #ESA2012 <a href=\"http://twitter.com/@DynamicEcology\">@DynamicEcology</a> <a href=\"http://twitter.com/@labroides\">@labroides</a> <a href=\"http://twitter.com/@qaecology\">@qaecology</a> <a href=\"http://twitter.com/@cboettig\">@cboettig</a> <a href=\"http://twitter.com/@paulrehrlich\">@paulrehrlich</a> <a href=\"http://twitter.com/@tessafrancis\">@tessafrancis</a> <a href=\"http://twitter.com/@lizabio\">@lizabio</a> <a href=\"http://twitter.com/@gigi_rose\">@gigi_rose</a> <a href=\"http://twitter.com/@IngaPLaPuma\">@IngaPLaPuma</a> <a href=\"http://twitter.com/@sarcozona\">@sarcozona</a>"
 [6] "Awesome! MT <a href=\"http://twitter.com/@cboettig\">@cboettig</a>: Fun at #esa2012 where physics student presents experiment testing the mathematical theories presented by ecology PhD"                                                                                                                                                                                                                                                                                                                                                                                                                                  
 [7] ".<a href=\"http://twitter.com/@cboettig\">@cboettig</a> says readme.txt is the best way to keep track of dataset versions. Can version control that on github #ESA2012"                                                                                                                                                                                                                                                                                                                                                                                                                                                    
 [8] "<a href=\"http://twitter.com/@jasonpriem\">@jasonpriem</a> <a href=\"http://twitter.com/@_inundata\">@_inundata</a> <a href=\"http://twitter.com/@cboettig\">@cboettig</a> Don't worry- you made an appearance earlier when <a href=\"http://twitter.com/@totalimpactdev\">@totalimpactdev</a> was discussed! #ESA2012"                                                                                                                                                                                                                                                                                                    
 [9] "<a href=\"http://twitter.com/@carlystrasser\">@carlystrasser</a> <a href=\"http://twitter.com/@_inundata\">@_inundata</a> <a href=\"http://twitter.com/@cboettig\">@cboettig</a> Sorry to be missing that! #ESA2012"                                                                                                                                                                                                                                                                                                                                                                                                       
[10] "We've reached the part of the workshop where .<a href=\"http://twitter.com/@_inundata\">@_inundata</a> and <a href=\"http://twitter.com/@cboettig\">@cboettig</a> slamming MATLAB now... #ESA2012"                                                                                                                                                                                                                                                                                                                                                                                                                         
[11] "<a href=\"http://twitter.com/@cboettig\">@cboettig</a> - let db managers know that you would use a repository + API to share your data with them - move ecology data forward #esa2012"                                                                                                                                                                                                                                                                                                                                                                                                                                     
[12] ".<a href=\"http://twitter.com/@cboettig\">@cboettig</a>: R is a pain to learn. <a href=\"http://twitter.com/@rOpenSci\">@rOpenSci</a> packages and tools take advantage of your current knowledge base. #ESA2012"                                                                                                                                                                                                                                                                                                                                                                                                          
[13] "<a href=\"http://twitter.com/@ropensci\">@ropensci</a> <a href=\"http://twitter.com/@cboettig\">@cboettig</a>: scripting analyses makes science reproducible, repeatable, &amp; creates an analytical workflow #esa2012"                                                                                                                                                                                                                                                                                                                                                                                                   
[14] ".<a href=\"http://twitter.com/@cboettig\">@cboettig</a> showing Michener's Info Entropy Graph: more time passing means less remembered about data #ESA2012"                                                                                                                                                                                                                                                                                                                                                                                                                                                                
[15] "<a href=\"http://twitter.com/@jacquelyngill\">@jacquelyngill</a> <a href=\"http://twitter.com/@cboettig\">@cboettig</a> <a href=\"http://twitter.com/@treebiology\">@treebiology</a> <a href=\"http://twitter.com/@jenedavison\">@jenedavison</a> would you like to write about #ESA2012 for <a href=\"http://twitter.com/@Scitable\">@Scitable</a> http://t.co/tPzaPL2U"                                                                                                                                                                                                                                                  
[16] "Fun #ESA2012 tweetup. Nice meeting you! <a href=\"http://twitter.com/@cboettig\">@cboettig</a> <a href=\"http://twitter.com/@MiriamGoldste\">@MiriamGoldste</a> <a href=\"http://twitter.com/@SarahBisbing\">@SarahBisbing</a> <a href=\"http://twitter.com/@bonebraking\">@bonebraking</a> <a href=\"http://twitter.com/@JacquelynGill\">@JacquelynGill</a> <a href=\"http://twitter.com/@msanclem\">@msanclem</a> <a href=\"http://twitter.com/@luketkelly\">@luketkelly</a> <a href=\"http://twitter.com/@edyong209\">@edyong209</a>"                                                                                   
[17] "Check out <a href=\"http://twitter.com/@cboettig\">@cboettig</a>'s talk at #ESA2012 Friday 9:20 in E143. Unknown unknowns: management strategies under uncertainty &amp; alt stable states"                                                                                                                                                                                                                                                                                                                                                                                                                                
[18] "<a href=\"http://twitter.com/@cboettig\">@cboettig</a> <a href=\"http://twitter.com/@luketkelly\">@luketkelly</a> is at 10:30 on Friday in E144 at #ESA2012. Optimal fire history for conserving biodiversity."                                                                                                                                                                                                                                                                                                                                                                                                            
[19] "#ESA2012 tweetup was a great idea. Nice meeting you guys <a href=\"http://twitter.com/@cboettig\">@cboettig</a> <a href=\"http://twitter.com/@MiriamGoldste\">@MiriamGoldste</a> <a href=\"http://twitter.com/@SarahBisbing\">@SarahBisbing</a> <a href=\"http://twitter.com/@bonebraking\">@bonebraking</a> <a href=\"http://twitter.com/@JacquelynGill\">@JacquelynGill</a> <a href=\"http://twitter.com/@msanclem\">@msanclem</a> and co"                                                                                                                                                                               
[20] "Rt <a href=\"http://twitter.com/@cboettig\">@cboettig</a> in case you missed the talk or the links, see <a href=\"http://twitter.com/@jebyrnes\">@jebyrnes</a> slides online http://t.co/cUiwTe23 #esa2012"                                                                                                                                                                                                                                                                                                                                                                                                                
[21] "<a href=\"http://twitter.com/@cboettig\">@cboettig</a> <a href=\"http://twitter.com/@ropensci\">@ropensci</a> for all other journals too I mean. Why not share the data? #esa2012"                                                                                                                                                                                                                                                                                                                                                                                                                                         
[22] "<a href=\"http://twitter.com/@cboettig\">@cboettig</a> <a href=\"http://twitter.com/@ropensci\">@ropensci</a> agreed. Or at least a subset of data for referees and the readership to access #esa2012"                                                                                                                                                                                                                                                                                                                                                                                                                     
[23] "<a href=\"http://twitter.com/@cboettig\">@cboettig</a> which leads to the suggestion that we need stats mentors and editors in eeb. #esa2012"                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
[24] "MT <a href=\"http://twitter.com/@forestdim\">@forestdim</a>: Inspired by <a href=\"http://twitter.com/@cboettig\">@cboettig</a> 's stardom to tweet. Ppl mistaking me 4 <a href=\"http://twitter.com/@edyong209\">@edyong209</a>. Need 2 now ride the wave of false ID #ESA2012"                                                                                                                                                                                                                                                                                                                                           
[25] "Yay for Baysian stats! MT <a href=\"http://twitter.com/@cboettig\">@cboettig</a>: #esa2012 stats discussion: \"If you think AIC confirms your hypothesis, you're wrong\""                                                                                                                                                                                                                                                                                                                                                                                                                                                  
[26] "Why code should be made avail: MT <a href=\"http://twitter.com/@cboettig\">@cboettig</a> Ben Bolker: not enuf staticians 4 each ecologst to have a stats buddy 4 custom methods #esa2012"                                                                                                                                                                                                                                                                                                                                                                                                                                  
[27] "Conversation at #esa2012 Hastings lab dinner: pole dancing at the 2016 Olympics? http://t.co/slpeBcNA <a href=\"http://twitter.com/@Dr_Bik\">@Dr_Bik</a> <a href=\"http://twitter.com/@cboettig\">@cboettig</a>"                                                                                                                                                                                                                                                                                                                                                                                                           
[28] "<a href=\"http://twitter.com/@cboettig\">@cboettig</a> Thanks for the art-science tip! #ESA2012 #biocreativity \"Critical Transitions, The Movie\" TONIGHT Portland Blrm 251 8-10p"                                                                                                                                                                                                                                                                                                                                                                                                                                        
[29] "Let's hear it for statistics! MT <a href=\"http://twitter.com/@ropensci\">@ropensci</a>: Check out <a href=\"http://twitter.com/@rOpenSci\">@rOpenSci</a> developer talks: <a href=\"http://twitter.com/@_inundata\">@_inundata</a> Tues 840a, F150 &amp; <a href=\"http://twitter.com/@cboettig\">@cboettig</a> 920a, E143. #esa2012"                                                                                                                                                                                                                                                                                     
[30] "Not on rOpenSci... MT <a href=\"http://twitter.com/@rOpenSci\">@rOpenSci</a>: Check out talks by <a href=\"http://twitter.com/@rOpenSci\">@rOpenSci</a> developers: <a href=\"http://twitter.com/@_inundata\">@_inundata</a> Tues 8:40 am F150 - <a href=\"http://twitter.com/@cboettig\">@cboettig</a> 9:20 am E143 #esa2012"                                                                                                                                                                                                                                                                                             
[31] "Check out talks by <a href=\"http://twitter.com/@rOpenSci\">@rOpenSci</a> developers: <a href=\"http://twitter.com/@_inundata\">@_inundata</a> Tues 8:40 am F150 - <a href=\"http://twitter.com/@cboettig\">@cboettig</a> 9:20 am E143 #esa2012"                                                                                                                                                                                                                                                                                                                                                                           


