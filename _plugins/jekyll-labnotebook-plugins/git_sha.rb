# Title: git_sha.rb
# Author: Carl Boettiger, @cboettig
# Licence: MIT
# Description: A custom filter to return the SHA hash associated with the last commit of a page
# REQUIREMENTS: Uses `path` variable set in the base_name.rb plugin
# 
# Example use: 
#
# {{ post.path | git_sha }}
# 

require 'ruby-git'


module TextFilter
  def git_sha(input)
    path = input #input.gsub(/(\d\d\d\d)\/(\d\d)\/(\d\d)\/(.*)\.html/, "\\1-\\2-\\3-\\4.md")
    sha = `git log -n 1 --format="%H" -- ../_posts/#{path}`
    sha
  end
end
Liquid::Template.register_filter(TextFilter)
