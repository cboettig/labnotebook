# Title: track_link.rb
# Author: Carl Boettiger, @cboettig
# License: MIT


module TextFilter
  def track_link(input)
    '"onclick="recordOutboundLink(this, \"Link\", \"' + input + '\"); 
    return false;"'
  end
end
Liquid::Template.register_filter(TextFilter)
