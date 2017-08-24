---
comments: true
date: 2011-05-28 23:22:02
layout: post
slug: notebook-technology-file-sharing-notes
title: 'Site configuration: file sharing notes'
categories:
- open-science
tags:
- code-tricks
- notebook-technology
---

Easiest way to share files is ssh onto the carlboettiger.info server,  change into the directory carlboettiger.info/ and create a new directory there -- i.e. share/.  This behaves as a regular static webpage directory that will list the files provided.

Secure access can be created by going to the goodies -->htaccess/WebDav page and selecting the option to make a directory or subdirectory secure, and then specifying the passwords, etc.  Have created the subdirectory http://carlboettiger.info/share/secure as an example of this.  See [DreamHost wiki entry for Htaccess. ](http://wiki.dreamhost.com/Htaccess)

[Dreamhost FTP](http://wiki.dreamhost.com/FTP) access requires an FTP user account.  Anonymous FTP can be set up at an additional cost but is not generally advised.  This may be a good way to allow users to upload large content to me.  At the moment I don't seem to have the root access to allow me to directly copy files from the guest ftp to my own user directory.

Looks like can make a page [WebDAV](http://wiki.dreamhost.com/index.php/WebDAV) enabled, an http protocol.  Not sure that this will be very useful.   Currently sample webdav page doesn't even display in browser.


## Git on server


Configure a root (user carlroot) account for dreamhost [through the panel](https://panel.dreamhost.com/index.cgi?tree=vserver.adminusers&).

Git [dreamhost wiki](http://wiki.dreamhost.com/Git)

For instance, this works: 

- log in to server, go to carlboettiger.info/git
- pull a public repo (read-only), i.e.

```
git clone git://github.com/cboettig/dryad.git
```

and run

```
git update-server-info
```

in that directory.  Then anyone can clone using:

```    
git clone http://carlboettiger.info/git/dryad/.git
```

but cannot push changes back.  Can clone with ssh too.



