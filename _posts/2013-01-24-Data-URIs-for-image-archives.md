---
layout: post
category: open-science
tags: 
- notebook-technology

---


Figures have been one of the standing challenges of the open notebook.  Displaying figures online requires that they are first uploaded to a server somewhere.  Recently I have used automated uploads to external servers such as figshare to host all images generated in the course of my research, and simply point to those graphs which I wish to include in a notebook page using an image link.  Unfortunately, this means that the images themselves are not being permanently archived when I deposit my notebook entries into their annual archives on figshare.  (Because figshare provides objects with unique identifier DOIs and benefits from [CLOCKSS](http://clockss.org) archival preservation, I use it to ensure a permanent backup of the notebook contents is available). I've recently discovered Data URIs, which provide a way to embed the image data directly into HTML (or markdown) entries.  I am trying to decide if they offer a better way to address this challenge, so working through my thinking here.  

## History of Figure management in the notebook

When I first started an open online notebook on the MediaWiki platform [OpenWetWare](http://openwetware.org/wiki/User:Carl_Boettiger), I simply uploaded all images manually to the wiki. Soon I discovered that it was much easier to upload them programmatically.  To accomplish this, I used Flickr as the image hosting service.  Flickr gave me a few convenient tools like batch uploads, pre-sized images and slide-shows for embedding.  More conveniently, Flickr allowed me to automate the uploading of images through the API.  Using the API in my R scripts I could [automate uploading](http://www.carlboettiger.info/2010/12/10/socialr-an-r-package-to-track-the-status-of-computations-with-social-network-tools.html) of the figures as they were created when scripts were run.   This integration became easier with my adoption of `knitr`, which has the option to automatically upload images built in (using imgur.com).  I soon extended this to [use Flickr or Wordpress](http://www.carlboettiger.info/2012/02/28/knitr-with-flickr-and-wordpress.html).

## Challenges of linked images

While this simplified the workflow considerably, it does not lend itself to archiving content well.  Since [migrating to Jekyll](http://www.carlboettiger.info/2012/09/19/migrating-from-wordpress-to-jekyll.html), it is relatively straight forward to archive the notebook entry by entry in markdown format, without all the external web content for the appearance.  Unfortunately, with images linked in from Flickr and other external hosting services are not included in this way.  Even archiving the entire HTML source for the site doesn't help, since the figures are on a remote repository.  When I migrated my OWW and Wordpress notebooks to Jekyll, the image links remained pointing to OWW or Flickr or wherever the images were originally uploaded.  Should Flickr vanish (as Delicious effectively did), the images would be lost.  The copies of the notebook entries I [deposit on figshare](http://figshare.com/authors/Carl%20Boettiger/96387) only have the links to these entries, not the entries themselves.  Even if the images were copied over, the entry would still point to the original URL, not the copy.  To address this, I started [archiving the images locally](http://www.carlboettiger.info/2012/11/30/Note-on-notebook-figures.html). This removed the external dependency and kept everything together so that it could be archived in a way that preserved the link structure, but has its own drawbacks.   

As I do far more runs of the scripts then I post to the notebook (though most of these can be found in the Github links), the image archive is much larger than what images are actually included in the notebook. Another issue is that the notebook source files are all conveniently managed with git and stored on Github, so storing the images locally involves explicitly excluding the image files which are both much larger and as binaries not ideal for version management.  


## Data URIs

The simple solution is to avoid linking the images externally, but instead embed the image data directly into the notebook entry.  [Data URIs](http://en.wikipedia.org/wiki/Data_URI_scheme) do exactly that, encoding all the image as part of the link url following a declaration of MIME type, such as

```html
<img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAUA
AAAFCAYAAACNbyblAAAAHElEQVQI12P4//8/w38GIAXDIBKE0DHxgljNBAAO
9TXL0Y4OHwAAAABJRU5ErkJggg==" 
```

Image data URIs are usually introduced to reduce the load and waiting time on the server, which has to query each external image separately (CSS sprites are a more effective way to accomplish that goal; which is what I use for the icons on this site).  They are also convenient for generating stand-alone HTML files, in which the externally linked data sources, such as images, CSS, etc, are encoded as 64bit data strings.  


## Generating URIs 

Given an image, we can generate the data URI using the `knitr` function `image_uri("image_name.png")`.  Knitr also supports data URIs as directly as an image output option, in just the same way that one would specify a custom upload function, using the command

```r
opts_knit$set(upload.fun = image_uri)
```

Pandoc can also generate HTML with data URIs for images in place of the remote image links using the `--self-contained` option, where it will download all the external images and encode them.  This may be the best strategy for creating archival versions of entries for figshare, etc.  Unfortunately the conversion is not available when running markdown to markdown, but can be effected using markdown to HTML, and then back.  The only downside of this approach is that the yaml header formatting is lost, and the output markdown used is Pandoc's flavor.


## Difficulties of Data URIs

### Not displayed in Github Markdown

My chief disappointment is realizing that Github's markdown renderer will not display data URIs, so images won't show up on the Github copy of `knitr` markdown files.  It would have been most convenient to have knitr always embed the images for my scripts and avoid external linking for Github files.  This would be particularly helpful for scripts run on remote servers where the compute nodes do not have external web connections and so images have to be uploaded from the head node after running the script.  Oh well, hopefully Github will consider addressing this.   

I don't see a good reason why Github markdown doesn't display images, since markdown displays any other valid HTML.  Perhaps it is security related since almost anything can be put in a data URI.  It may have something to do with how there server is handling images to begin with, since the images that are displayed come not from the original URL but from a separate link on `akamai.net`.  I did send in a suggestion that they address this and was told they would look into it.   Meanwhile I will continue uploading these images externally, and converting to data URIs when generating the files for the notebook version. 

### Large File Sizes

Because all of the image encoding is embedded directly within the link, and these data URIs are huge.  This creates several issues.  

- The markdown a deal less readable before it is rendered.  A decent editor can just fold these away (e.g. select block and `zf` in vim).  
- The data URIs increase the filesize of the HTML dramatically.  Compression is about 1/3rd more than the original image sizes.  This can slow load times and makes the repository larger.  As most images in the notebook are generated as basic pngs, the file sizes aren't huge (100 Kb range), but much larger than the raw HTML.  
- Not all browsers support Data URIs, so images may not render in older versions of IE 
- The markdown parser takes much longer to generate the output.  This appears to actually time out Jekyll building in my current notebook.  



## Resolution

I have a branch of the notebook, [image-uri](https://github.com/cboettig/labnotebook/blob/image-uri), in which (almost) all images are converted to data URIs.  Unfortunately, the images do not display on the Github copy and the branch takes rather much longer to compile, making this an impractical standard solution for the notebook.  

As I discussed above, I have recently experimented with hosting all images I generate on the local server, removing the dependency and archival concerns of Figshare.  Unfortunately, it makes for a very large and potentially more fragile site to have to carry around the complete image log, 99% of which does not appear in the notebook but only on Github script runs.  Keeping only the images used in posts makes more sense, but requires an extra step which is otherwise redundant, since the web being what it is can just point to the external copy. To address the primary concern is making sure that the archival copies on figshare include the images, I think I will stick with compiling an archival version with Data URIs while otherwise continuing to host the images on Flickr.  

Archival copies can be made using Pandoc by generating the site using the `--self-contained` option for the pandoc parser in `_config.yaml`, though this is rather slow. Then the archive would be the HTML files in the `_site` directory, rather than the raw markdown files. While alternatively I could use a script to just render the markdown, overall it may make more sense to archive the stand-alone HTML, since it includes more metadata and the advantages of the XML formatting.  

