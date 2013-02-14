require 'pandoc-ruby'

class Jekyll::MarkdownConverter

  def convert(content)
    return super unless ( @config['markdown'] == 'pandoc' || @config['pandoc'] )
    @pandoc_extensions = @config['pandoc']['extensions']
    PandocRuby.new(content, *@pandoc_extensions).to_html
  end
end
