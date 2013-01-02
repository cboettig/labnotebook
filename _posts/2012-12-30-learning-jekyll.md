---
layout: post
category: open-science
tag: site-configuration

---


# Some quick thoughts on learning Jekyll

## Brief Background

[Jekyll]() is a fantastic and popular static blogging platform, written in Ruby by Github founder [](), which powers this site (at least currently).  Similar static website generators exist for Python ([Hyde]()) Haskell ([yst]()), and probably others, but Jekyll is quite widespride.  


With the (unofficial) slogan of the blogging platform for hackers, Jekyll is aimed at folks who don't mind a little coding.  If you're looking for a polished, user-friendly product where a huge community of developers has written most imaginable extensions, check out Wordpress.org.  If you want something where you can easily get into the guts and customize everything, Jekyll may be the best game in town.  Compared to a dynamic site, a static site is much more lightweight, which translates into faster, more stable, and less expensive.  What's not to like? 

## Where to start?

A couple preconfigured Jekyll setups have emerged to reduce the learning curve, most notably Octopress and Jekyll Bootstrap. In my opinion, in an attempt to make things easier through tricks such as automated Ruby makefiles (Rakefiles) I think these projects have actually made Jekyll appear much more complicated than it really is, as evidenced by the number of talented programmers running Octopress with the identical configuration.  They may get you started faster, but their use of advanced techniques to provide more functionality out-of-the-box makes for a tougher learning curve.


See the Jekyll Bootstrap introduction for a nice explanation of how Jekyll is laid out.  Understand the basic YAML headers, and the role of the `_layout`, `_includes` and `_posts` directories, and you've mastered the basics.  



## My rough guide to learn-by-doing

I believe the best way to start with Jekyll is start with a really bare-bones site.  You add features as you need them, making maintenance easy.  

Start with an empty repository.  Create a markdown file, say, `index.md`.  Write whatever you want in standard markdown, just stick a YAML header on the top. Stick what?  From your standardized testing days, think something like  `markdown:html :: yaml:xml`.  Three `-` on their own line to start, three `-` on another line to close define the block of YAML data, whose mere existence is enough to get Jekyll to pay attention to that file.  Here we specify any metadata we want. 

```

---
layout: default
---

# My site title

some text

```

And voila, we have a functional Jekyll site.  



Directories that are functional for Jekyll but do not appear in the generated website start with an underscore `_`.   

`_posts`

`_layout`

`_includes`


**YAML** and the config file.



**Markdown parser hell**.  A lot of Jekyll adopters are already familar with Github and it's flavor of markdown with such features as fenced codeblocks, thus it comes as real suprise to run into advice explaining how code blocks need to be wrapped in the never-heard-of "Liquid" syntax `{% raw %}{% highlight %}{% endraw %}`.  Ignore this nonsense.  How your markdown is parsed depends on what flavor of markdown you use, and there is a special level of hell for anyone inventing a new flavor ([Atwood 2012]()).  Fortunately Github's Tom Preston-Werner finally gave up the perfect irony that Github's flavor was not one of the built-in Jekyll parsers (though being a hacker system, this could be added manually), and you can now get that behavior by setting your chosen parser to be `redcarpet` with the convenient extensions:

```
markdown: redcarpet
redcarpet:
  extensions: ["no_intra_emphasis", "fenced_code_blocks", "autolink", "tables", "with_toc_data"]
```


[^1][1: I rely Pandoc, a markdown parser with a professor of Logic's notion of syntax, resolving some the ambiguities in the original specification and providing a convenient tool to transform its content into other formats beyond HTML, such as pdf, docx, and epub.]


**Liquid** Your next stop should really be to read [Liquid for Designers](https://github.com/Shopify/liquid/wiki/Liquid-for-Designers).  Liquid is the glue that specifies all the rules needed to assemble your site, and is quite simple.  Understand how Liquid works and you've mastered Jekyll.  Jekyll provides [some additional Liquid functions](https://github.com/mojombo/jekyll/wiki/Liquid-Extensions) common for blogs.  


Your next stop is to get some really nice customizable CSS scaffolding to control the layout for your site.  While there's a huge number of free CSS themes available, this isn't 2002, so head on over to [Twitter-Bootstrap](http://twitter.github.com/bootstrap) (a project originally created by some of the programmers at Twitter, now evolved to it's own community). The CSS-based grid layout and some very nice JQuery Javascripts tools can make your site as pretty and as interactive as you can imagine.  Like Octopress, prebuilt CSS can lead to all sites looking the same.  Check out themes for Bootstrap, and the excellent set of icons by [FontAwesome]().  


Your final step is where the hacking really begins.  Now and again you imagine something you just can't do with these tools. Your only recourse is to ~~ask on [Stackoverflow](http://stackoverflow.com) for someone to do it for you~~ learn a bit of Ruby.  Anything you can write in Ruby you can add to Jekyll as a "plugin", by defining a Liquid extension for a Ruby function.  Ruby is clearly a favorite language of web-developers thanks to its dynamic-site implementation Ruby-on-Rails and a vibrant Github community, so there's a wealth of useful tools, including an implementation to most APIs you might care to interact with (Github, Twitter, various Google APIs, are among the ones I'm using).  



