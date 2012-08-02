require 'feedzirra'
require 'octokit'
require 'twitter'
require 'redcarpet'

# Need to store feed in cache and just call update?

module Jekyll
  class TwitterFeed < Liquid::Tag
    def initialize(tag_name, text, tokens)
      super
      @user = text
    end
    def render(context)
      # Initialize a redcarpet markdown renderer to autolink urls
      markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML,
                                                 :autolink => true, :space_after_headers => true)
      out = "<ul class=\"unstyled\">"
      tweets = Twitter.user_timeline(@user)
      for i in 0 ... 3
      out = out + "<li>" + markdown.render(tweets[i].text) +
        " <a href=\"http://twitter.com/" + @user + "/statuses/" + 
        tweets[i].id.to_s + "\">"  + tweets[i].created_at.to_s + "</a> " + 
        "</li>"
      end
      out + "</ul>"
    end
  end


  class GithubFeed < Liquid::Tag
    def render(context)
      out = "<ul class=\"unstyled\">"
      feed = Feedzirra::Feed.fetch_and_parse("https://github.com/cboettig.atom")
      # consider formatting properly
      for i in 0 ... 3
        out = out + "<li>" + feed.entries[i].title + " <a href=\"" + feed.entries[i].url + "\">" +
          feed.entries[i].published.to_s + "</a>" + "</li>" 
      end
      out + "</ul>"
    end
  end

  class GitCommits < Liquid::Tag
    def initialize(tag_name, text, tokens)
      super
      @text = text
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


end

Liquid::Template.register_tag('twitter_feed', Jekyll::TwitterFeed)
Liquid::Template.register_tag('github_feed', Jekyll::GithubFeed)
Liquid::Template.register_tag('github_commits', Jekyll::GitCommits)

