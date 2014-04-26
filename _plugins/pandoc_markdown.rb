module Jekyll
  module Converters
    class Markdown < Converter
      safe true

      pygments_prefix "\n"
      pygments_suffix "\n"

      def setup
        return if @setup
        @parser = case @config['markdown']
          when 'redcarpet'
            RedcarpetParser.new @config
          when 'kramdown'
            KramdownParser.new @config
          when 'rdiscount'
            RDiscountParser.new @config
          when 'maruku'
            MarukuParser.new @config
          when 'pandoc'
            PandocParser.new @config
          else
            STDERR.puts "Invalid Markdown processor: #{@config['markdown']}"
            STDERR.puts " Valid options are [ maruku | rdiscount | kramdown ]"
            raise FatalException.new("Invalid Markdown process: #{@config['markdown']}")
        end
        @setup = true
      end

      def matches(ext)
        rgx = '(' + @config['markdown_ext'].gsub(',','|') +')'
        ext =~ Regexp.new(rgx, Regexp::IGNORECASE)
      end

      def output_ext(ext)
        ".html"
      end

      def convert(content)
        setup
        @parser.convert(content)
      end
    end
  end
end

module Jekyll
  module Converters
    class Markdown
      class PandocParser
        def initialize(config)
	  require 'pandoc-ruby'
          @config = config
        rescue LoadError
          STDERR.puts 'You are missing a library required for Pandoc. Please run:'
          STDERR.puts ' $ [sudo] gem install pandoc-ruby'
          raise FatalException.new("Missing dependency: pandoc-ruby")
        end

        def convert(content)
	  @pandoc_extensions = @config['pandoc']['extensions']
	  PandocRuby.new(content, *@pandoc_extensions).to_html5
        end
      end
    end
  end
end
