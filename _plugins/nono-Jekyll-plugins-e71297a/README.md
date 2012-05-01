Jekyll Plugins
==============

To install the plugins simply put them in a folder named `_plugins` in your
project directory.


Redcarpet 2
-----------

This plugin uses [Redcarpet 2](https://github.com/tanoku/redcarpet) to render
Markdown, and [pygments](http://pygments.org/) for syntax hightlighting.

Install the redcarpet gem with `gem install redcarpet`.

It's possible to choose the redcarpet that you want to use by adding theses
lines to the `_config.yml` file:

```yaml
markdown: redcarpet2
redcarpet:
  extensions: ["no_intra_emphasis", "fenced_code_blocks", "autolink", "strikethrough", "superscript", "with_toc_data"]
```

And the nice bonus is that you no longer need to `{% highlight %}` to
highlight code. You can simply use the fenced code blocks like on github:

    ```ruby
    puts "This code will be highlighted"
    ```


Copyheart
---------

Released under the MIT license.

♡2012 by Bruno Michel. Copying is an act of love. Please copy and share.
