require 'feedjira' # atom/rss API
require 'nokogiri'  # Parse HTML


module Jekyll
  class RssFeed < Liquid::Tag
    def initialize(tag_name, text, tokens)
      super
      input = text.split(/, */ )
      @text = input[0]
      @count = input[1]
      if input[1] == nil
        @count = 3
      end
    end
    def render(context)
      puts "RSS feeds with rss_feed.rb"
      feed = Feedjira::Feed.fetch_and_parse(@text)
      if defined?(feed.entries)
        out = "<ul>"
        # consider formatting properly
        for i in 0 ... @count.to_i
          doc = Nokogiri::HTML.parse(feed.entries[i].summary) # parse the content
          # Print title, content
          out = out + "<li>" +
            feed.entries[i].title + ": " +
            doc.xpath("//p[1]").text +
            doc.xpath("//p[2]").text +
            doc.css('blockquote').text +
            " <a href=\"" + feed.entries[i].url + "\">" +
            feed.entries[i].published.strftime("%Y/%m/%d") + "</a>" +
            "</li>"
        end
        out + "</ul>"
      else
        " "
      end
    end
  end
end ## end module Jekyll

Liquid::Template.register_tag('rss_feed', Jekyll::RssFeed)

