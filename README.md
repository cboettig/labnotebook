Source Code for my Jekyll-based website
=======================================

**Primary server for site**: [carlboettiger.info](http://carlboettiger.info), hosted by [Dreamhost](http://dreamhost.org)

This hosts only the compiled html files of the site, not the original Jekyll source used to produce them. The working source directory can be found in its github repository: [labnotebook](http://github.com/cboettig/labnotebook)


Installing and Jekyll and plugins required to compile the site
--------------------------------------------------------------

These instructions are based on my Ubuntu 12.04 platform.  


Install Ruby version >= 1.9

```
sudo apt-get install ruby1.9.1-full
```

Make sure the [latest version is selected](http://askubuntu.com/questions/91693/how-do-you-uninstall-ruby-1-8-7-and-install-ruby-1-9-2)

```
sudo update-alternatives --config ruby
sudo update-alternatives --config gem
```

Install Jekyll and the dependencies needed for a few plugins.

`sudo gem install jekyll redcarpet feedzirra`


In the root directory of the project, run `jekyll --server`, if successfull, after a few seconds the site should be available by pointing your browser to `localhost:4000`.  


Jekyll Configuration Notes
--------------------------

The site relies on serveral extensions not available on the Jekyll copy provided on Github's gh-pages.  

* redcarpet2 -- Providing support for [Github-flavored markdown](http://github.github.com/github-flavored-markdown/)
* feedzirra -- Grab and format rss feed information  



