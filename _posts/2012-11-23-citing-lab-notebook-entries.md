---
layout: post
categories: open-science
tags: 
- notebook-technology
- semantics
- blog

---

  C. Titus Brown has an excellent [post](http://ivory.idyll.org/blog/posting-blog-entries-to-figshare.html) discussing his exploration into the merits and technicalities cross-posting his blog posts to figshare.  The [`rfigshare` package](https://github.com/ropensci/rfigshare) written by [Ted Hart](http://emhart.github.com/) and myself can do just this, once we puzzled out some of the same challenges (Notes to Titus: though the documentation doesn't mention it, you can get a programmatic list of available categories from [http://api.figshare.com/v1/categories](http://api.figshare.com/v1/categories).  Figshare can also take code as a fileset or dataset, and may soon add a type for it.  The coolest thing about figshare is perhaps the way they add types in response to how they see users using the service).  


  The real discussion, though, is not about *how*, but *why*? Currently figshare doesn't render the html or markdown/restructured-text source (other than as plain text), so it's not a great place to *read* the posts.  This may change in the near future as well, but the primary motivation for doing this seems to be on the ability to get an honest-to-goodness DOI for your entry.  So why a DOI?  

  The answer most often put forward is that "a DOI facilitates citing a paper in the formal literature." I think that's not entirely accurate. For one, the formal literature has no trouble citing things that do not have a DOI.  Perhaps the answer is meant to mean track citations to my content, *e.g.* for statistical/impact purposes.  This may be closer to the mark, but it still needs work.  What counts depends on whose doing the counting.  Anyone browsing the citation counts of a work through different mediums has surely encountered Thompson-Reuters has very specific criteria to be included, so I don't believe they are tracking citations to anything with a DOI.  Nor, I think is Scopus.  Perhaps the target is Google then?

  If you want Google Scholar to count the number of citations to your blog post, I have good news for you.  You do not need a DOI and cross-posting to figshare.  You just need to follow the [metadata requirements](http://scholar.google.com/intl/en/scholar/inclusion.html#indexing) as outlined by Google Scholar itself.  This will help Google Scholar identify your blog post as a academic object, and add it to your profile.  Anything indexed by Google scholar that cites your blog post will count as a reference. The basics are really simple.  Have metadata such as:

```html
<meta name="resource_type" content="{{site.title}}"/>
<meta name="citation_journal_title" content="{{site.title}}"/>
<meta name="citation_publication_date" content="{{page.date }}"/>
<meta name="citation_date" content="{{page.date }}"/>
<meta name="citation_author" content="{{ site.author.name }}"/>
<meta name="citation_title" content="{{page.title}}"/>
```

Just replace `{{site.title}}` etc. with the correct values for your site.  The example above will do so automatically if you use Jekyll using information specified in the YAML header.   It seems the entry also needs a section called either "References" or "Bibliography" followed by a list of references. Not sure what format Google Scholar will do best at disambiguating.  (Note that what I refer to as "Google Scholar" metadata looks like it was originally the convention adopted by HireWire Press.)

[Phil Lord](http://www.russet.org.uk) and colleagues have written the fantastic API called [greycite](http://knowledgeblog.org/greycite) [Lord 2012], which can be used to generate citation data from any website that has semantic markup (including HTML5 semantics, also Dublin Core or OpenGraph ontologies and Google Scholar metadata).  The API can return citations formatted in bibtex or JSON.  Try it out at [greycite.knowledgeblog.org](http://greycite.knowledgeblog.org)


  Now there is another reason to use DOIs and figshare, which is, I think, entirely independent -- archival preservation (decoupled journal, anyone?).  DOIs are potentially more permanent than URLs (though I'll leave that debate to the experts). Figshare content is backed up by [CLOCKSS](http://clockss.org/). Forever is a long time, but this certainly sounds like a better archiving strategy. Figshare should be providing the necessary Google Scholar metadata on each object now.  My current practice has been to archive my notebook in annual chunks on figshare (posting entries individually feels fragmented and cluttered to me), and rely on the more native web solution of HTML metadata to allow my entries to "citable". Perhaps this is not ideal, but for the short term, the content is discoverable and citable via Google Scholar, which points to my address.  If my site vanishes from the web, one might hope that an academic search for my lab notebook might recover the content from the archived version.  


## Edit: thoughts, examples and disclaimer

I stumbled across Google's indexing of some of my lab notebook entries somewhat by accident.  For instance, one of my [entries](http://www.carlboettiger.info/2011/10/28/optimal-control-examples-continued-bellman-dynamic-programming.html) on optimal control in which I had listed some references started turning up [in Google Scholar](http://scholar.google.com/citations?view_op=view_citation&hl=en&user=zj2rRtEAAAAJ&citation_for_view=zj2rRtEAAAAJ:4TOpqqG69KYC) Being able to engage in a scholarly exchange through blogs that can cite and be cited by the formal literature certainly sounds like an important step forward in generating new publishing models.  Of course it is also obvious that the procedure I have outlined could be trivially exploited for some rather blatant gaming of Google Scholar's citation statistics.  This post certainly is not an endorsement of gaming such statistics.  If nothing else, perhaps this once again underscores the weakness of reliance on metrics of quantity when trying to infer quality.  Will we ever let go of that fallacy?  




## References

1. Titus Brown (2012) Posting blog entries to figshare, Living in an Ivory Basement. http://ivory.idyll.org/blog/posting-blog-entries-to-figshare.html 
2. Phillip Lord (2012) Greycite. Knowledge Blog. http://knowledgeblog.org/greycite 
3. Carl Boettiger (2011) Optimal Control examples continued: Bellman, Dynamic Programming, Lab Notebook http://www.carlboettiger.info/2011/10/28/optimal-control-examples-continued-bellman-dynamic-programming.html
