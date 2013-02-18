---
comments: true
date: 2011-12-11 22:45:54
layout: post
slug: some-notes-on-open-notebooks-open-peer-review-practices
title: Some Notes on Open Notebooks, Open peer review practices.
redirects: [/wordpress/archives/3533, /archives/3533]
categories:
- open-science
---

What follows is a collection of notes, examples, and reflections I've been meaning to write down.


## 




## Revealing Revisions


Sharing version history is an important part of an open notebook really being open, and one reason why wikis have remained so popular for Open Notebook Science.  Wordpress (this platform) does version management internally, and the[ post-revision display plug-in ](http://wordpress.org/extend/plugins/post-revision-display/)makes this visible on posts.  I had experimented but disabled this a while ago because I didn't like visual impact of the long list at the end of my posts.  I may often put a post up early in the day and add subsequent notes as I go along, so my revisions are nearly exclusively additions (I show any cross-outs on the final copy anyway) so it seemed unnecessary.  Anyway, this [FF discussion](http://ff.im/NPlPW) made me feel guilty so I added them back.  Luckily the manual mode lets me have this display in the metadata section, which feels a bit more out of the way. ((Configuration notes to self:  Directions basically follow the package instructions -- I added  the two php lines to single.php in the sidebar section.  Would be overwritten by theme updates so I should write a [child theme,](http://www.carlboettiger.info/archives/1697) but I understand [my theme](http://somadesign.ca/projects/the-erudite/) is no longer being updated anyhow.  I'd have to edit the css to get color highlighting of the changes, doesn't really fit with my theme.  My theme also doesn't use the standard CSS file, but it's own directory for css files which means I have to go outside the wordpress editor to edit it.)).  We'll see.


## Revealing Impact


A while ago [Heather Piwowar](http://www.researchremix.org/wordpress/) asked me about setting up WP Post Views on my notebook so that projects like total-impact could include the data.  There should be a good plugin that just uses the API from the standard statistics plugin (now part of jetpack) to display views on individual posts, but it seems there isn't.  WP Post Views requires modifying the theme files, and requires the ajax-the-views plugin to update the display on sites using caching, and uses it's own counter (so it's view counts only start once it's installed), but I don't have time to write my own, so it now appears in the metadata section of the posts.


## ONS Logos


Interesting [discussion](http://andymaloney.wordpress.com/2011/11/24/ons-logo/#comment-69) by Andy Maloney on the use of ONS logos to track Open Notebook science.  (See mine in the footer "further information."  The choice of ONS claim is a different discussion, e.g. [here](http://www.carlboettiger.info/archives/1229#comment-491)).




## Journals with Open Peer Review


Been meaning to jot these notes down, prompted to by the open-knowledge / [G+ discussion](https://plus.google.com/107449381177524115065/posts/5iQoPnuY5R8) here.  Here's a few different models of open peer review.

Biology Direct has always practiced open peer review in which reviews are solicited; then having received the reviews (either positive or negative) the author can opt to have the paper published, can make changes & publish, or can withdraw the paper. Any time the paper is published the reviews are published with it, with the reviewers name, and with the author's reply to the reviews. [http://www.biology-direct.com/](http://www.biology-direct.com/)

The Nature journal EMBO has an innovative but less extreme process where reviews are solicited, identities are included, but the reviews are published (as a supplement) only if the paper is accepted. The open review is opt-in, with 95% opting in. Interestingly reviewers are encouraged to "cross-review" or comment on remarks of other reviewers. They have stats showing that about 10% of the time people download the peer-review comments when they download the paper, comparable to downloads of traditional supplements. [http://www.nature.com/emboj/about/process.html](http://www.nature.com/emboj/about/process.html)

Nature did an experiment with its flagship journal on unsolicited open peer review in 2006 in parallel with it's traditional peer review. They deemed it unsuccessful due to low opt-in rates among authors and few & lower quality reviews in the open. [http://www.nature.com/nature/peerreview/debate/nature05535.html](http://www.nature.com/nature/peerreview/debate/nature05535.html)

BMC Molecular Biology journals has authors recommend reviewers, non-anonymous review, and publishing of the reviews with the article.  [http://www.biomedcentral.com/bmcmolbiol/authors/peerreview](http://www.biomedcentral.com/bmcmolbiol/authors/peerreview)




## Copyright Licenses


Some vibrant discussion on non-commercial (NC) (and to some extent, share-alike, or SA) clauses in licenses on the open-knowledge list (and in the recent published literature: (Carroll, 2011), (Hagedorn _et. al._ 2011)). The question at hand is targeting Open Access publishers who use NC license, but has interesting reflections onto bloggers and software licenses.

While I'd heard discontent with NC before (particularly around PLoS ONE clones using NC clause), I was surprised at the extent -- Creative Commons is apparently considering removing it since it is so problematic.  Similar troubles have dogged the share-alike/GPL clause for software (license incompatibility, etc), and it sounds that GPL is out of favor in preference for more open/permissive BSD licenses.

## References


- Carroll M (2011).
"Why Full Open Access Matters."
*Plos Biology*, **9**.
<a href="http://dx.doi.org/10.1371/journal.pbio.1001210">http://dx.doi.org/10.1371/journal.pbio.1001210</a>.

- Hagedorn G, Mietchen D, Morris R, Agosti D, Penev L, Berendsohn W and Hobern D (2011).
"Creative Commons Licenses And The Non-Commercial Condition: Implications For The re-Use of Biodiversity Information."
*Zookeys*, **150**.
ISSN 1313-2989, <a href="http://dx.doi.org/10.3897/zookeys.150.2189">http://dx.doi.org/10.3897/zookeys.150.2189</a>.
