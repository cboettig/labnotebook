# Author: Carl Boettiger
# License: MIT
# Now requires authentication.  [See issue](https://github.com/sferik/twitter/issues/315#issuecomment-9204980)
# on how to write authentication file
#
# Save authentication credentials in a file named _twitter.yml in the root directory as follows:
#
# :consumer_key: XXXXXXXXXXXXXXXX
# :consumer_secret: XXXXXXXXXXXXXX
# :oauth_token: XXXXXXXXXX
# :oauth_token_secret: XXXXXXXXXXXXXXXX
#
# (Where your tokens are in place of the XXs)
# For travis deployment, export these using travis encryption and allow travis to write the the yml file.
#

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

        puts "Generating twitter feed with twitter API and twitter_feed.rb"

        # Initialize a redcarpet markdown renderer to autolink urls
        # Could use octokit instead to get GFM
        markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML,
                                           :autolink => true)

        out = "<ul>"


#         cred = YAML.load_file("_twitter.yml")
#         @client = Twitter::REST::Client.new(
#           :consumer_key => cred[":consumer_key"],
#           :consumer_secret => cred[":consumer_secret"],
#           :access_token => cred[":oauth_token"],
#           :access_token_secret => cred[":oauth_token_secret"]
#         )
        @client = Twitter::REST::Client.new(
          :consumer_key => ENV["TWIT_KEY"],
          :consumer_secret => ENV["TWIT_SECRET"],
          :access_token => ENV["TWIT_TOK"],
          :access_token_secret => ENV["TWIT_TOK_SECRET"]
        )
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

