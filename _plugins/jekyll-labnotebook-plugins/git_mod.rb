# Author: Carl Boettiger, @cboettig
# License: MIT
#
# A simple filter to access the git modification time of a page
# Example use:
#
#  {{ post.path | prepend:'_posts/' | git_mod }}
#
#

require 'git'
require 'json'

module Jekyll
  module GitModFilter
    def git_mod(input)
      path = input # File.join(".", page.dir, page.name)
      g = Git.open(".") # replace with site source path, see martin's code maybe
      mod = g.log(1).object(path).first.date
      mod
    end
  end
end
Liquid::Template.register_filter(Jekyll::GitModFilter)
