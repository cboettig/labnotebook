require 'pandoc-ruby'

class Jekyll::MarkdownConverter
  def convert(content)
    return super unless ( @config['markdown'] == 'pandoc' || @config['pandoc'] )
    @pandoc_extensions = @config['pandoc']['extensions'].map { |e| e.to_sym }
    ## Find pandoc extensions containing '=' and replace :option=argument with {:option => :argument}
    @template = "assets/datauri_template.html".to_sym
    PandocRuby.new(content, *@pandoc_extensions, {:template => @template}).to_html
  end
end
