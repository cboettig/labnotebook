require 'feedzirra' # atom/rss API
require 'octokit'   # Github API
require 'twitter'   # Twitter API
require 'redcarpet' # Formatting links
require 'nokogiri'  # Parse HTML

# Need to store feed in cache and just call update?

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
                                                 :autolink => true, :space_after_headers => true)
      out = "<ul>"
      tweets = Twitter.user_timeline(@user)
      for i in 0 ... @count.to_i
      out = out + "<li>" + markdown.render(tweets[i].text) +
        " <a href=\"http://twitter.com/" + @user + "/statuses/" + 
        tweets[i].id.to_s + "\">"  + tweets[i].created_at.strftime("%I:%M %Y/%m/%d") + "</a> " + 
        "</li>"
      end
      out + "</ul>"
    end
  end


  class GithubFeed < Liquid::Tag
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
      out = "<ul>"
      feed = Feedzirra::Feed.fetch_and_parse("https://github.com/" + @user + ".atom")
      # consider formatting properly
      for i in 0 ... @count.to_i
        doc = Nokogiri::HTML.parse(feed.entries[i].content) # parse the content
        # Print title, content
        out = out + "<li>" + 
          feed.entries[i].title + ": " +
          "<em>" + 
          doc.css('blockquote').text.gsub(/\n/, ' ').squeeze(' ').strip[0 .. 150] +
          "</em>" + 
          " <a href=\"" + feed.entries[i].url + "\">" +
          feed.entries[i].published.strftime("%I:%M %Y/%m/%d") + "</a>" +
          "</li>" 
      end
      out + "</ul>"
    end
  end

  class GitCommits < Liquid::Tag
    def initialize(tag_name, text, tokens)
      super
      input = text.split(/, */ )
      @text = input[0]
      @count = input[1]
      if input[1] == nil
        @count = 3
      end
      @address = "cboettig/"+"#{@text}"
    end

    def render(context) 
      repo = Octokit.commits(@address) 
      out = "<ul>"
      for i in 0 ... [repo.size, 2].min
        out = out + "<li>" +
          "<a href=\"" + repo[i].commit.url + "\">" +
          repo[i].commit.author.date +
          "</a>" +
          " " + repo[i].commit.message + "</li>"
      end
      out = out + "</ul>"
      out

    end
  end

## Use context-specific github flavored markdown to convert sha into link.  e.g.
## Octokit.markdown("Hello world github/linguist#1 **cool**, and #1!", :mode => "gfm", :context => "github/gollum")




  class MendeleyFeed < Liquid::Tag
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
      out = "<ul>"
      feed = Feedzirra::Feed.fetch_and_parse("http://www.mendeley.com/groups/" + @text + "/feed/rss/")
      # consider formatting properly
      for i in 0 ... @count.to_i
        doc = Nokogiri::HTML.parse(feed.entries[i].summary) # parse the content
        # Print title, content
        out = out + "<li>" + 
          feed.entries[i].title + ": " +
          doc.xpath("//p[1]").text +  
          doc.xpath("//p[2]").text + 
#          "<em>" + doc.css('blockquote').text + "</em>" + 
          " <a href=\"" + feed.entries[i].url + "\">" +
          feed.entries[i].published.strftime("%I:%M %Y/%m/%d") + "</a>" +
          "</li>" 
      end
      out + "</ul>"
    end
  end





end ## end module Jekyll



Liquid::Template.register_tag('twitter_feed', Jekyll::TwitterFeed)
Liquid::Template.register_tag('github_feed', Jekyll::GithubFeed)
Liquid::Template.register_tag('github_commits', Jekyll::GitCommits)
Liquid::Template.register_tag('mendeley_feed', Jekyll::MendeleyFeed)





