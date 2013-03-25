# Title: git_sha.rb
# Author: Carl Boettiger, @cboettig
# Licence: MIT

# A custom filter to return the SHA hash associated with the last commit of a page
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
# {{ post.url | git_sha }}
# 

require 'ruby-git'


module TextFilter
  def git_sha(input)
    path = input.gsub(/(\d\d\d\d)\/(\d\d)\/(\d\d)\/(.*)\.html/, "\\1-\\2-\\3-\\4.md")
    sha = `git log -n 1 --format="%H" -- ../_posts/#{path}`
    sha
  end
end
Liquid::Template.register_filter(TextFilter)
