---
comments: true
date: 2010-12-14 17:06:57
layout: post
slug: tues-phylogenetics-thoughts-while-writing
title: 'Tues: evolution thoughts while writing...'
redirects: [/wordpress/archives/622, /archives/622]
categories:
- evolution
---

Again spending most of the day writing.  (Maybe) processing some ideas in writing by writing in my notebook as I make my edits.


##### Ideas I'm trying to get across in today's edits


Parameter estimation is more demanding of the data than model choice.  Knowing if a value is different from zero is easier than knowing what it is.


### Code updates to-do


	
* Need to add S3 wrapper functions for ouch so both can call montecarlotest() in the pmc package.  OUCH test currently uses the older power_between_models() test in phyloniche package.

	
* Check that plot.pow() can turn off the null distribution and the data line

	
* Delete old amazon image

	
* Add libgsl0-dev to amazon image

	
* Add pageup recursive history search to amazon image

	
* Complete and secure a basic setup as the public image

	
* Setup a private image with security configurations to avoid repeating all the steps below.



### Amazon Notes


Running on cluster steps:



	
  * Copy over .flickrrc and hpc-autotweets, move latter  to /usr/local/bin



	
  * configure git: copy .ssh/id_rsa and id_rsa.pub to ec2 .ssh



    
    git config --global user.name cboettig
    git config --global user.email cboettig@gmail.com


Then initiate and pull repository:

    
    git init .
    git pull git@github....
    git remote add origin git@github....
    


Can push back git push now.  last step means don't have to add git@github...  after the push command.  Does mean git pull won't run, need git pull origin master.

Also update the local dev copy to avoid conflicts

    
    git pull origin master





	
  * Install and run package!


Troubleshooting: git add needs a force to add .Rdat over the .gitignore list.  Also, in-script pushes aren't working since they need the password.  Somehow the gitup() file doesn't write the actual data -- due to function warpper?  Have to save externally.


### MISC Notes


Fantastic Mendeley group on all [the papers in TreeBASE](http://www.mendeley.com/groups/734351/treebase/), well curated: from Rod Page


> My initial goal is to clean up this list, add missing DOIs and PubMed identifiers, fix incorrect metadata, etc. Once we have PubMed ids we can retrieve sequences for individual TreeBASE studies, as well as NCBI taxids. Sequences may include geo-coordinates (for sequences or associated specimens), so we can build maps and query TreeBASE geographically. NCBI taxids (which TreeBASE already has for some taxa) enable queries using the taxonomic hierarchy. All obvious stuff, but hard to do unless the bibliographic data is in better shape.


Also thinking about how to promote a community discussion on the issues I'm trying to raise in this paper and a smaller unit of publishing.  The r-sig-phylo mailing list has provided some excellent discussions of technical pitfalls before.

Should paper focus on interesting and clear or on comprehensive and technical?  Can other channels accomplish the former?
