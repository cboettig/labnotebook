---
layout: post
category: open-science
tags: 
- notebook-technology
- Jekyll

exclude_from_search: true

---


# Some quick thoughts on learning Jekyll

After recieving a few queries on how to get started with Jekyll I thought I'd jot down my own opinions here.  Of course there is already rather good documentation for the software and plenty of blogs providing tutorials.  While no doubt more than adequate, I have more opinions on how to get started actually *learning* what's going on than I could easily fit into a tweet, and also a couple favorite links to references so I thought I'd jot down my reply in long form here.  

## Brief Background

[Jekyll](https://github.com/mojombo/jekyll) is a fantastic and popular static blogging platform, written in Ruby by a Github founder, [Tom Preston-Werner](http://tom.preston-werner.com/), which powers this site (at least currently).  Similar static website generators exist for Python ([Hyde](https://github.com/hyde/hyde)) Haskell ([yst](https://github.com/jgm/yst)), and probably others, but Jekyll is quite widespread.  


With the (unofficial) slogan of the bloging platform for hackers, Jekyll is aimed at folks who don't mind a little coding.  If you're looking for a polished, user-friendly product where a huge community of developers has written most imaginable extensions, check out Wordpress.org.  If you want something where you can easily get into the guts and customize everything, Jekyll may be the best game in town.  Compared to a dynamic site, a static site is much more lightweight, which translates into faster, more stable, and less expensive.  What's not to like? 

## Where to start?

A couple pre-configured Jekyll setups have emerged to reduce the learning curve, most notably [Octopress](https://github.com/imathis/octopress) and [Jekyll Bootstrap](https://github.com/plusjade/jekyll-bootstrap). In my opinion, in an attempt to make things easier through tricks such as automated Ruby makefiles (Rakefiles) I think these projects have actually made Jekyll appear much more complicated than it really is, as evidenced by the number of talented programmers running Octopress with the identical configuration.  They may get you started faster, but their use of advanced techniques to provide more functionality out-of-the-box makes for a tougher learning curve.


See the Jekyll-Bootstrap's [introduction](http://jekyllbootstrap.com/lessons/jekyll-introduction.html) to Jekyll for a nice explanation of how Jekyll is laid out.  Understand the basic YAML headers, and the role of the `_layout`, `_includes` and `_posts` directories, and you've mastered the basics.  Or read on below for my take on getting started.  

## Running Jekyll

For a basic site hosted on Github, one never actually has to run Jekyll locally -- just push the site to a gh-pages branch of a Github repository, or to the master branch of a repository named `username.github.com` for a personal website, and Jekyll will be run by the server.  Jekyll is frequently run locally instead, allowing the user to copy the static website it generates to any (static) web server (see Hosting options, below).   Simply install Jekyll following the directions on its [homepage README](https://github.com/mojombo/jekyll).[^1]


## My rough guide to learn-by-doing

I believe the best way to start with Jekyll is start with a really bare-bones site.  You add features as you need them, making maintenance easy.  

Start with an empty repository.  Create a markdown file, say, `index.md`.  Write whatever you want in standard markdown, just stick a [YAML](http://en.wikipedia.org/wiki/YAML) header on the top. Stick what?  From your standardized testing days, think something like  `markdown:html :: yaml:xml`.  Three `-` on their own line to start, three `-` on another line to close define the block of YAML data, whose mere existence is enough to get Jekyll to pay attention to that file.  Here we specify any metadata we want. 

```
    ---
    layout: default
    ---

    # My site title

    some text

```

And voilà, we have a functional Jekyll site.  The basic thing to remember is that everything else is gravy, to be mastered as you have a need for it.  The advanced features can be super helpful once you know them, but in the beginning they may just get in the way of understanding what's actually going on.  


### Getting deeper: Jekyll site file structure

Directories that are functional for Jekyll but do not appear in the generated website start with an underscore `_`.   

* Root directory.  You don't need any of the standard directories for a barebones site.  As we saw above, any markdown file with YAML header matter in the root directory will be parsed.  Don't like markdown?  We could write these files in html (with .html extension) instead.  Jekyll will parse them as long as they have some YAML header matter, allowing us to still use things like page templates and other tricks from Liquid code described below.  

* `_posts` Your posts live here.  They should be titled in `YYYY-MM-DD-post-title.md` format, which will allow Jekyll to automatically figure out the post date and title, while also keeping the posts neatly organized in this directory.  (The title and the publication date, optionally including time can alternatively be given in the YAML header matter if you don't like this convention.   See below).  

* `_layout`  For a completely barebones site, you don't need this directory.  Here you can provide files defining the basic HTML layout, or template, for each of the pages in your website. If your familiar with HTML, you can go ahead and set up a page as you like, and then add the single line of Liquid code in the body to pull in the HTML generated by parsing the markdown files.  The mimimal layout file might look something like this (see an HTML tutorial for details):


```html
<!doctype html>
<html lang=en>
<head>
<meta charset=utf-8>
<title> {% raw %}{{ page.title }}{% endraw %} </title>
</head>
<body>

{% raw %}{{ page.content }}{% endraw %}

</body>
</html>
```

where the double braces and words `page.title` and `page.content` are Liquid code that will tell Jekyll to insert the title and content of the page in the appropriate spot.  To use a layout, save this file in `_layout` with the desired layout name, e.g. `plainlayout`, and then it can be applied to any page (markdown or html file in the root directory) or post by adding `layout: plainlayout` to the YAML header of that file.  This provides a super convenient way to create page templates for a static site.  

* `_includes`  Often one might have several layouts corresponding to different kinds of pages on your site.  To avoid copy-pasting the parts of the layout that stay the same (perhaps all have the same header matter pointing to your CSS files and analytics tracker), you can just place these snippets inside the `_includes` directory with their own filenames.  For instance, we could move the header text to a file called `header` in that directory with the contents:

```html
<!doctype html>
<html lang=en>
<head>
<meta charset=utf-8>
<title> {% raw %}{{ page.title }}{% endraw %} </title>
</head>
```


To automatically reuse a snippet of HTML code in any file on your site (a layout file or other), we need to learn one more Liquid command.  This one goes between brace-percent symbols, and uses the command `include`, followed by the filename, like so:   


```
{% raw %}{% include header %}{% endraw %}
<body>
{% raw %}{{ page.content }}{% endraw %}
</body>
</html>
```

The above example provides a shorter layout file, which pulls in the header snippet.  If you have only one layout, this is of course pointless, but the more you add to and change your site, the more useful the ability to reuse a single HTML chunk with just a line of code becomes.  

### Configuration

* **YAML** and the `_config.yml` file.  Recall that YAML is the very human-readable data structure, whose syntax is explained quite throughly on [it's wikipedia page](http://en.wikipedia.org/wiki/YAML). One glance at an example reveals almost all you need to know about the syntax, such as:

```

---
layout: post
category: ecology
tags: 
  - howto
  - jekyll
modified: 2013-01-07
---
```

Lists can be done in a variety of ways, comma-s

One of the Jekyll beginner's mysteries is knowing just what words/metadata/variables are already available in Jekyll and how to add those that are not. [A list appears on the Jekyll Wiki](https://github.com/mojombo/jekyll/wiki/Template-Data).  Note that the syntax uses the ruby structure, so `page.title` and `page.date` are both part of the page.  We can create any custom variable by adding it to that page's yaml header.  For instance, `modified` is not defined anywhere in Jekyll's default Template Data, but none-the-less we can access this modification date in this page's `layout` or the page itself using {% raw %}{{ page.modified }} {% endraw %} liquid tag.  

Metadata belonging to the site as a whole, rather than a particular page, is specified in the `_config.yml` file, along with a few options telling Jekyll how to parse the site. Again, the [Jekyll wiki has a great overview](https://github.com/mojombo/jekyll/wiki/Configuration).  As the extension implies, this entire file is in YAML.  If we want to create new global variables, such as our twitter account, we can just add them to the YAML like so:

```
author:
  twitter: cboettig
  github: cboettig
```

(note the indentation for hierarchy) and now my twitter username is available through the liquid command `site.author.twitter`.  Again, it's just another trick to insert some text, just like `_layout` and `_includes`.  Only use can prove how helpful this can be.  



**Markdown parser hell**.  A lot of Jekyll adopters are already familar with Github and it's flavor of markdown with such features as fenced codeblocks, thus it comes as real suprise to run into advice explaining how code blocks need to be wrapped in the never-heard-of "Liquid" syntax `{% raw %}{% highlight %}{% endraw %}`.  Ignore this nonsense.  How your markdown is parsed depends on what flavor of markdown you use, and there is a special level of hell for anyone inventing a new flavor ([Atwood 2012](http://www.codinghorror.com/blog/2012/10/the-future-of-markdown.html)).  Fortunately Github's Tom Preston-Werner finally gave up the perfect irony that Github's flavor was not one of the built-in Jekyll parsers (though being a hacker system, this could be added manually), and you can now get that behavior by setting your chosen parser to be `redcarpet` with the convenient extensions [^2] 

```
markdown: redcarpet
redcarpet:
  extensions: ["no_intra_emphasis", "fenced_code_blocks", "autolink", "tables", "with_toc_data"]
```


## More advanced tricks


**Liquid** Your next stop should really be to read [Liquid for Designers](https://github.com/Shopify/liquid/wiki/Liquid-for-Designers).  Liquid is the glue that specifies all the rules needed to assemble your site, and is quite simple.  Understand how Liquid works and you've mastered Jekyll.  Jekyll provides [some additional Liquid functions](https://github.com/mojombo/jekyll/wiki/Liquid-Extensions) common for blogs.  


Your next stop is to get some really nice customizable CSS scaffolding to control the layout for your site.  While there's a huge number of free CSS themes available, this isn't 2002, so head on over to [Twitter-Bootstrap](http://twitter.github.com/bootstrap) (a project originally created by some of the programmers at Twitter, now evolved to it's own community). The CSS-based grid layout and some very nice JQuery Javascripts tools can make your site as pretty and as interactive as you can imagine.  Like Octopress, prebuilt CSS can lead to all sites looking the same.  Check out themes for Bootstrap, and the excellent set of icons by [FontAwesome](http://fortawesome.github.com/Font-Awesome/).  


Your final step is where the hacking really begins.  Now and again you imagine something you just can't do with these tools. Your only recourse is to ~~ask on [Stackoverflow](http://stackoverflow.com) for someone to do it for you~~ learn a bit of Ruby.  Anything you can write in Ruby you can add to Jekyll as a "plugin", by defining a Liquid extension for a Ruby function.  Ruby is clearly a favorite language of web-developers thanks to its dynamic-site implementation Ruby-on-Rails and a vibrant Github community, so there's a wealth of useful tools, including an implementation to most APIs you might care to interact with (Github, Twitter, various Google APIs, are among the ones I'm using).  


## Hosting options

Because Jekyll generates a static site, it can be hosted almost anywhere for nothing or next to nothing in costs.  The primary question to consider is your choice of domain name.  If you wish to host your site from university domain name, just copy the contents of `_site` into your `public_html` or similarly named directory on the web server.  

While having a university affiliated domain can appear more official and help with discoverability, buying your own domain name as your permanent Internet home may be a more reliable long-term solution. Once you've purchased a domain name from a provider, a static site can be hosted at your own domain name for next to nothing on [Amazon S3](http://docs.amazonwebservices.com/AmazonS3/latest/dev/WebsiteHosting.html), or for literally nothing [through Github](https://help.github.com/articles/setting-up-a-custom-domain-with-pages).  



[1]: Details on installing and running ruby gems for Jekyll will vary by operating system, so I won't bother with more details here.  Some further background for linux based platforms at least appears in my [site's info file](http://www.carlboettiger.info/README.html).  

[2]: I rely Pandoc, a markdown parser with a professor of Logic's notion of syntax, resolving some the ambiguities in the original specification and providing a convenient tool to transform its content into other formats beyond HTML, such as pdf, docx, and epub.


