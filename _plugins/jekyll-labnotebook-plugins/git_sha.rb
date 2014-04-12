# Author: Carl Boettiger, @cboettig
# License: MIT
#
# A simple filter to access the sha of a page
# Example use:
#
# {{ page.name | string_to_date }}
#

require 'git'
require 'json'

module Jekyll
  module GitSHAFilter
    def git_sha(input)
      path = input # File.join(".", page.dir, page.name)
      g = Git.open("/home/cboettig/Documents/labnotebook") # replace with site source path, see martin's code maybe
      # modified = g.log(1).object(path).first.date
      sha = g.log(1).object(path).first.sha
      sha
    end
  end
end
Liquid::Template.register_filter(Jekyll::GitSHAFilter)
