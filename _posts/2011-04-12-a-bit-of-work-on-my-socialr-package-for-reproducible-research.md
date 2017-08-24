---
comments: true
date: 2011-04-12 09:55:42
layout: post
slug: a-bit-of-work-on-my-socialr-package-for-reproducible-research
title: A bit of work on my socialR package for reproducible research
redirects: [/wordpress/archives/1361, /archives/1361]
categories:
- open-science
---

A few small updates on my [socialR](http://www.carlboettiger.info/archives/565) package, (continued from my [earlier](http://www.carlboettiger.info/archives/1355) entries) which should hopefully help it evolve from a personal tool to a portable package one day.  Starting by incorporating support for native R packages to handle the  API interface to flickr, twitter, and github, rather than just calling command-line scripts.  Jeff Gentry has just released an ROAuth package for authentication, which can be used by his twitteR package.  A bit of configuring, but these are now working.  

Successfully installed by setting 

    
    
    export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH
    


in the terminal, and added this line to /etc/ld.so.conf.d/*.conf,



    
    registerTwitterOAuth(exampleOauth)
    requestURL = "https://api.twitter.com/oauth/request_token"
    accessURL = "http://api.twitter.com/oauth/access_token"
    authURL = "http://api.twitter.com/oauth/authorize"
    twitCred = OAuthFactory$new(consumerKey=consumerKey,
                                              consumerSecret=consumerSecret,
                                              requestURL=reqURL,
                                              accessURL=accessURL,
                                              authURL=authURL)
    twitCred$handshake()
    registerTwitterOAuth(twitCred)
    save(list="twitCred", file="twitteR_credentials")


Note that you must specify consumerKey and consumerSecret from registering as a twitteR app: [http://twitter.com/apps/new](http://twitter.com/apps/new)
In the future one can then authenticate just by loading the credentials and calling register:

    
    load("twitteR_credentials")
    registerTwitterOAuth(twitCred)


Can now send tweets or direct messages;

    
    tweet("text")
    dm("text", "user")
    



I have been having a problem with this creating double-posts on my ubuntu machine (apparently not a problem on other architectures).  Jeff has been very responsive and just sent me an updated version of the package, which works brilliantly.  Note that you can "delete" posts, which will let you repost them without an error (but does not actually remove them from the tweet stream, or actually double-post?)


    
    
    ns <- tweet("tweet this")
    deleteStatus(ns)
    tweet("tweet this")
    



[blackbirdpie url="http://twitter.com/#!/tweeting_cpu/status/57836211762503681"]

Kudos and thanks to Jeff for his help with this.  Nice to have this working.  Now for flickR...  


