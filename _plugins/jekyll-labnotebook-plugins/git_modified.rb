# Title: git_modified.rb
# Author: Carl Boettiger, @cboettig
# Licence: MIT

# A custom filter to return the date that git has for the page modification time 
# Not very robust, will break if a custom title is set.  
#
#
# Unfortunately we don't seem to have access to "page.name"  
# for the filename or page.base for the page path by the time
# we are running filters (Generators do have access to this I think,
# so we could alternatively write that data across) 
# https://github.com/mojombo/jekyll/blob/master/lib/jekyll/layout.rb
# Example use: 
#
# {{ post.url | git_modified }}
# 

# require 'ruby-git'
require 'chronic'

module TextFilter
  def git_modified(input)
    path = input.gsub(/(\d\d\d\d)\/(\d\d)\/(\d\d)\/(.*)\.html/, "\\1-\\2-\\3-\\4.md")
    modif = `git log -n 1 --format="%ai" -- ../_posts/#{path}`
    modif = Chronic.parse(modif)
  end
end
Liquid::Template.register_filter(TextFilter)
