---
comments: true
date: 2011-11-22 18:51:19
layout: post
slug: some-configuration-notes-rstudio-setup-syntax-highlighting-in-sweave
title: 'some configuration notes: RStudio setup, syntax highlighting in sweave'
redirects: [/wordpress/archives/3302, /archives/3302]
categories:
- computation
---

Installing R-Studio on my dreamhost VPS server.  Dreamhost runs debian lenny, which is a bit dated, making it necessary to install from source.  (Would be easy on a modern ubuntu server).  Here we go. 

First, we probably want to install R from source to begin with (Lenny comes with cutting-edge R 2.7.1...). This needs to be done with shared libs enabled.  Also I needed to run it without recommended-packages to get the initial install working

```bash

./configure --with-recommended-packages=no --enable-R-shlib 
make 
sudo make install
# now install the shared libs
make prefix=/path/to/here install-libR
# and install the recommended packages 
tools/./rsync-recommended

```


Patience is required.  Increasing memory available during this task by about 400MB (through the dreamhost panel) might be a good idea.  

Rstudio source install uses cmake and packages the dependencies itself, so installation isn't necessarily intuitive.  Note that we will compile dependencies from source included in RStudio, rather than just grabbing libboost-dev over apt-get.  

Download and extract the tarball, and cd into the base rstudio directory. Then install the dependencies -- sit tight, this can take a while.  Again, the extra 400MB memory helps.  


```bash

cd dependencies/linux/older
./install-boost

```




```bash

cd ../../..
mkdir build
cd build
cmake -DRSTUDIO_TARGET=Server -DCMAKE_BUILD_TYPE=Release ..

```


Still stuck at this stage.  Filed [help ticket](http://support.rstudio.org/help/discussions/problems/1169-installing-server-edition-by-source-on-debian-lenny).  



Trying out the desktop IDE. Might take a bit to get me to edit code outside of vim though...




##  Sweave documents with pretty formatting, flexible graphic layout and syntax highlighting 



Install the package SweaveListingUtils in order to have syntax highlighting in Sweave documents.  Requires a few extra commands in the sweave file, see its vignette for details.  Here's a working template combined with the elsarticle class.  This also illustrates modifying the footer of elsarticle without changing the class; see my [tex-overflow](http://tex.stackexchange.com/questions/35712/modify-footer-used-by-elsarticle-cls/35714#35714) question.  

[gist id=1387759]




###  Latex equations in R plots 


The plotmath syntax can be annoying.  If you're willing to restrict your device output to generating tex files that you then run pdflatex on for pdf graphics, you can get around this nicely with tikzDevice package.  See [stackoverflow](stackoverflow.com/questions/8190087/italic-greek-letters-latex-style-math-in-r-plot-titles-with-ggplot/) answers.  



##  Misc 



Google tasks in my system tray? Nope. Apparently this used to be [possible](http://namsisi.wordpress.com/2009/02/22/gmail-tasks-in-your-ubuntu-system-tray/) with [prism](http://prism.mozillalabs.com/), a mozillalabs project to allow web applications to run natively in the desktop ((ironically the opposite direction from google's chrome-os and the direction of mobile developers)).  The project is no longer supported but [will be replaced](http://mozillalabs.com/blog/2011/02/prism-is-now-chromeless/) by chromeless, a more ambitious version which is still pre-alpha.  




Eventually should learn to use google+.  Looks like I need to spend some time organizing circles.  seems like having separate accounts (e.g. facebook for friends/personal stuff, twitter for professional) is much easier. too lazy to use facebook already.  


