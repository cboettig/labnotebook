---
layout: post
category: open-science
tags: site-configuration

---


Figures have been one of the standing challenges of the open notebook.  Displaying figures online requires that they are first uploaded to a server somewhere.  I have recently discovered the ability to embed photos directly into the notebook using the 64bit encoding of data URIs.  This resolves some long-standing problems in archiving the notebook, though it isn't a perfect solution.  

## History of Figure management in the notebook

When I first started an open online notebook on the MediaWiki platform [OpenWetWare](http://openwetware.org/wiki/User:Carl_Boettiger), I simply uploaded all images manually to the wiki. Soon I discovered that it was much easier to upload them programmatically.  To accomplish this, I used Flickr as the image hosting service.  Flickr gave me a few convenient tools like batch uploads, pre-sized images and slide-shows for embedding.  More conveniently, Flickr allowed me to automate the uploading of images through the API.  Using the API in my R scripts I could [automate uploading](http://www.carlboettiger.info/2010/12/10/socialr-an-r-package-to-track-the-status-of-computations-with-social-network-tools.html) of the figures as they were created when scripts were run.   This integration became easier with my adoption of `knitr`, which has the option to automatically upload images built in (using imgur.com).  I soon extended this to [use Flickr or Wordpress](http://www.carlboettiger.info/2012/02/28/knitr-with-flickr-and-wordpress.html).

## Challenges of linked images

While this simplified the workflow considerably, it does not lend itself to archiving content well.  Since [migrating to Jekyll](http://www.carlboettiger.info/2012/09/19/migrating-from-wordpress-to-jekyll.html), it is relatively straight forward to archive the notebook entry by entry in markdown format, without all the external web content for the appearance.  Unfortunately, with images linked in from Flickr and other external hosting services are not included in this way.  Even archiving the entire HTML source for the site doesn't help, since the figures are on a remote repository.  When I migrated my OWW and Wordpress notebooks to Jekyll, the image links remained pointing to OWW or Flickr or wherever the images were originally uploaded.  Should Flickr vanish (as Delicious effectively did), the images would be lost.  The copies of the notebook entries I [deposit on figshare]() only have the links to these entries, not the entries themselves.  Even if the images were copied over, the entry would still point to the original URL, not the copy.  To address this, I started [archiving the images locally](http://www.carlboettiger.info/2012/11/30/Note-on-notebook-figures.html). This removed the external dependency and kept everything together so that it could be archived in a way that preserved the link structure, but it still had weaknesses.  

As I do far more runs of the scripts then I post to the notebook (though most of these can be found in the Github links), the image archive is much larger than what images are actually included in the notebook. Another issue is that the notebook source files are all conveniently managed with git and stored on Github, but I exclude the image files which are both much larger and as binaries not ideal for version management.  

## Data URIs

The simple solution is to avoid linking the images externally, but instead embed the image data directly into the notebook entry.  [Data URIs](http://en.wikipedia.org/wiki/Data_URI_scheme) do exactly that.  Image data URIs are usually introduced to reduce the load and waiting time on the server, which has to query each external image separately (CSS sprites are a more effective way to accomplish that goal; which is what I use for the icons on this site).  

I wrote a little script to download each of the images and replace them with data URIs for all existing entries in the notebook. Knitr also supports data URIs as an image output option; simply add the command

```r
opts_knit$set(upload.fun = image_uri)
```

to the beginning of the script. 

## Difficulties of Data URIs

My chief disappointment is realizing that Github's markdown renderer will not display data URIs, so images won't show up on the Github copy of `knitr` markdown files.  This is perhaps the most annoying, as it would be most convenient to have knitr always embed the images for my scripts and avoid external linking for Github files.  This would be particularly helpful for scripts run on remote servers where the compute nodes do not have external web connections and so images have to be uploaded from the head node after running the script.  Oh well, hopefully Github will consider addressing this.   

I don't see a good reason why Github markdown doesn't display images, since markdown displays any other valid HTML.  Perhaps it is security related since almost anything can be put in a data URI.  It may have something to do with how there server is handling images to begin with, since the images that are displayed come not from the original URL but from a separate link on `akamai.net`.  I did send in a suggestion that they address this and was told they would look into it.   Meanwhile I will continue uploading these images externally, and converting to data URIs when generating the files for the notebook version. 

2. The data URIs are huge, which makes the markdown a deal less readable before it is rendered.  A decent editor can just fold these away (e.g. select block and `zf` in vim).  
3. The data URIs increase the filesize of the HTML dramatically.  Compression is about 1/3rd more than the original image sizes.  This can slow load times and makes the repository larger.  As most images in the notebook are generated as basic pngs, the file sizes aren't huge (100 Kb range), but much larger than the raw HTML.  
4. Not all browsers support Data URIs, so images may not render in older versions of IE 


## Generating URIs 

Pandoc, my markdown parser, can also generate URIs from images.  Unfortunately this only works for HTML outputs, while my goal is to archive the markdown files. To generate the image URIs in the Markdown stage, I use the `knitr` output function `opts_knit$set(upload.fun = image_uri)`.  For images not generated by R, I use the `knitr` function `image_uri` to convert the image file to a URI. 

So now just about all of the existing images in the notebook have been converted to data URIs, and I have updated the [github repository](https://github.com/cboettig/labnotebook/blob/master/_posts/) and the permanent [figshare archives](http://figshare.com/authors/Carl%20Boettiger/96387) of entries to include the figures.  Feedback, suggestions or critiques of this strategy are welcome!
