---
comments: true
date: 2011-11-04 22:35:11
layout: post
slug: sparkleshare-configuration
title: Sparkleshare configuration
redirects: [/wordpress/archives/3161, /archives/3161]
categories:
- computation
tags:
- notebook-technology
---

Configured sparkleshare across my linux server & laptops, and android phone.  Provides a dropbox-style syncing and version history for all files using git.  I can sync as much space as I have hardisk capacity, with as many users and machines as I like, at no cost.  Wonderful.


### Basic setup


Get sparkleshare working on a server is dead simple, Can also use a [github](http://github.com) server, [gitorious server](http://gitorious.org/), etc. Setup is [clearly documented](https://github.com/hbons/SparkleShare/wiki/How-to-set-up-your-own-server), which is really just doing a bunch of standard stuff if you have a server or github already set up.



	
  * On the server, just needs a bare git repository you can point to.

	
  * On the client, need rsa authentication to the target server set-up, then it's dead simple again.



    
    sudo apt-get install sparkleshare
    sparkleshare start


It will ask you where the server is - (you can give it a github or gitorious server here too)

and specify the server as username@server, and specify the full path to the bare repository.


### Dashboard


Set up a dashboard on the server, gives you a web interface and also allows syncing to Android.

Getting the [dashboard client set up](https://github.com/hbons/SparkleShare-Dashboard/wiki) requires a bit more effort.  This   Uses the snazzy [node.js](http://nodejs.org/#download) server language, which requires a bit of setting up since it isn't packaged for debian lenny, which my server (Dreamhost VPS) is running, but luckily has few dependencies and can install from source just fine.  Get one the packaged tarballs, it won't work with the latest source (fails the version check).  I used 0.4.12.

on the server: (last one requires root access, can do this logged in from the root user):


```bash

wget http://nodejs.org/dist/node-v0.4.12.tar.gz
tar -xvf node-v0.4.12.tar.gz
cd node
./configure
sudo make install

```


From here the [instructions](https://github.com/hbons/SparkleShare-Dashboard/wiki) work just fine.  There are some lines in config.js that look like they need editing even though the instructions doesn't mention them.  I added the server address to the repository, and a location for the rsa key; not sure what's going on there but it works.

Note that if the repository is denoted "public" include a public link for sharing without having a user log in.  You still need to log in to the dashboard to get this link in the first place. It seems repositories should be initiated bare in directory ending in .git to be properly recognized.

Make sure the dashboard is running to use the web interface / android app. Launch the webserver with


```bash
 nohup node app.js & 
```


from the Sparkleshare-Dashboard directory (the & for running in the background and the nohup should keep it running after logging off the server).




### Further configuration notes


Removing sparkleshare-synced folder: edit

    
    ~/.config/sparkleshare/config.xml


Also learned about a shallow clone: Cannot push or clone it, but you can get only recent changes with

    
    git clone --depth 1 git@github.com:cboettig/repository


Could be handy when a collaborator wants to just grab the latest copy of a large repository.

Versioning interface is supposed to display as Get Earlier Version on right-click, but I'm only seeing ubuntu's deja vu version backup.  Fortunately any sparkleshare directory is a proper git repository, so one can always use the full git log and commands to checkout any version. though of course some of git's power isn't useful for binary-type files.

Don't try copying a directory already containing a .git repository into the sparkleshare folder.


