# Now requires authentication.  [See issue](https://github.com/sferik/twitter/issues/315#issuecomment-9204980)
# on how to write authentication file

require 'twitter'   # Twitter API
require 'redcarpet' # Formatting links

module Jekyll
  class TwitterFeed < Liquid::Tag
    def initialize(tag_name, text, tokens)
      super
      input = text.split(/, */ )
      @user = input[0]
      @count = input[1]
      if input[1] == nil
        @count = 3
      end
    end
    def render(context)
      # Initialize a redcarpet markdown renderer to autolink urls
      # Could use octokit instead to get GFM
      markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML,
                                         :autolink => true)

      out = "<ul>"


      Twitter.connection_options = {:timeout => 50, :open_timeout => 20} # increase timeout to avoid frequent errors 
      @client = Twitter::Client.new(YAML.load_file("/home/cboettig/.twitter_auth.yaml"))
      tweets = @client.user_timeline(@user)
      for i in 0 ... @count.to_i
      out = out + "<li>" + 
        markdown.render(tweets[i].text) +
        " <a href=\"http://twitter.com/" + @user + "/statuses/" + 
        tweets[i].id.to_s + "\">"  + tweets[i].created_at.strftime("%I:%M %Y/%m/%d") + "</a> " + 
        "</li>"
      end
      out + "</ul>"
    end
  end
end

Liquid::Template.register_tag('twitter_feed', Jekyll::TwitterFeed)

