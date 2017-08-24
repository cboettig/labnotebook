# Title: codecogs plugin
# Author: Carl Boettiger, @cboettig
# License: MIT
#
# A simple filter to convert strings to dates
# Example use:
#
# {{ post.modified | string_to_date }}
#

require 'chronic'

module Jekyll
  module StringToDateFilter
    def string_to_date(input)
      Chronic.parse(input)
    end
  end
end
Liquid::Template.register_filter(Jekyll::StringToDateFilter)
