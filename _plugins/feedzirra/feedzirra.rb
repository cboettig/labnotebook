require 'feedzirra'
feed = Feedzirra::Feed.fetch_and_parse("https://github.com/cboettig.atom")
entry = feed.entries.first

module Jekyll

  class FeedzirraBlockTag < Liquid::Tag
    def render(context)
      puts entry.content
    end
  end

end

Liquid::Template.register_tag('feedzirra', Jekyll::FeedzirraBlockTag)

