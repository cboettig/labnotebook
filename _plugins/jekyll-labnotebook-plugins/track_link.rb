# Title: track_link.rb
# Author: Carl Boettiger, @cboettig
# License: MIT

module Jekyll
  module TrackLinkFilter
    def track_link(input)
      %(onclick="recordOutboundLink(this, 'Link', '| + input + |'); return false;")
    end
  end
end
Liquid::Template.register_filter(Jekyll::TrackLinkFilter)
