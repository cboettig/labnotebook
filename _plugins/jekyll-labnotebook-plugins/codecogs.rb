# Title: codecogs plugin
# Author: Carl Boettiger, @cboettig
# License: MIT
#
# A simple filter to replace mathjax-latex syntax with images of the
# equations as rendered by codecogs.  This is useful to filter content
# entered into the atom feed, where javascript and css-based rendering
# of equations won't work.

# Credits to Noam Ross http://www.noamross.net/blog/2012/4/4/math-in-rss-feeds.html for inspiring this approach and to
# helpful folks on SO for the regexpr: http://stackoverflow.com/questions/13166112/ruby-regexp-to-replace-equations

# Example use:
#
# {{ post.content | codecogs }}
#

module Jekyll
  module ImageFilter
    def codecogs(input)
#    puts "generating images for equations in RSS feed with codecogs.rb"
    desired = input.gsub(/\\\[\s*(.*?)\s*\\\]/, "<div style=\"text-align:center;\"><img src=\"http://latex.codecogs.com/png.latex?\\1\" alt=\"\\1\" /></div>")
    desired.gsub(/\\\(\s*(.*?)\s*\\\)/, "<img src=\"http://latex.codecogs.com/png.latex?\\1\\inline\"/>")
    end
  end
end
Liquid::Template.register_filter(Jekyll::ImageFilter)
