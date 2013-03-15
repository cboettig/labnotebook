---
comments: true
date: 2011-11-01 20:18:38
layout: post
slug: server-file-management-from-bowser-ajaxplorer-mollify
title: 'server file management from bowser: ajaxplorer, mollify'
redirects: [/wordpress/archives/3116, /archives/3116]
categories:
- computation
tags:
- notebook-technology
---

A few notes on trying out some server-based file sharing solutions.  



##  [ajaXplorer](http://www.ajaxplorer.info/)


Kind of amazingly good and easy to install, with configuration-free functionality like previews of images and playing mp3s. More secure file sharing (at least, public link not generated until asked for, can have password assigned to it).  Sharing is the only step not activated by default.  Create a folder called "public" in the ajaxplorer directory, and this feature will appear.   

Curious about performance issues, we'll see.  



##  [Mollify](http://www.mollify.org/)


A bit cleaner, mysql or sqlite based; configuration is considerably more challenging. Seems that performance may be better for large system.   

In the configuration file, follow directions.  Note that Dreamhost does not use the localhost for mysql, follow directions and set to the hostname given in panel: mysql.mydomain.com.  Delete the line that has the socket, since it isn't used.

Add support to share public links:
add this to the configuration.php file:

```php

<?php
 $SETTINGS = array(
                        "enable_public_links" => TRUE
                );
?>

```



Add support for flash uploader (See [additional configuration directions](http://code.google.com/p/mollify/wiki/ConfigurationAdditionalOptions))

Go to mollify/ directory, edit index.html:
In the section about mollify-init that looks like:

```php

<script type="text/javascript">
    mollify.init({
        "service-path": "backend/",
    });
</script>

```


edit to read as:

```php

<script type="text/javascript" language="javascript" src="client/swfupload.js"></script>
<script type="text/javascript">
    mollify.init({
        "service-path": "backend/",
        "file-uploader": "flash"
    });
</script>

```



Has plugin support which should deliver previews, a file viewer and text editors, but I was unable to get these to work.  Is activated using the following php in configuration file:

```php

<?php
    $SETTINGS = array(
                        "enable_public_links" => TRUE
                );
    $PLUGINS = array(
                "FileViewerEditor" => array(
                        "viewers" => array(
                                "Image" => array("gif", "png", "jpg"),
                                "TextFile" => array("txt", "php", "html"),
                                "Google" => array("pdf", "tiff", "doc")

                        ),
                        "previewers" => array(
                                "Image" => array("gif", "png", "jpg")
                        ),
                        "editors" => array(
                                "TextFile" => array("txt")
                        ),
                )
        );
?>

```

menu now displays preview and view options, but these do not display content.  Of course these work on the demo site; not sure what is wrong.  




## Dropbox-style Linked & synced sharing 


e.g. [sparkleshare](http://sparkleshare.org)?

