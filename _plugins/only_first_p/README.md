## Requirements

The truncator requires [Nokogiri][4] to parse out the HTML string.

## Usage

If you're using Jekyll, add the only_first_p.rb file to your` _plugins` directory - this will give you the helper `only_first_p` as a [Liquid][3] filter. In your views, you can use this function in order to *show only first paragpaph of page/post*

    page | only_first_p

[3]:http://liquidmarkup.org
[4]:http://nokogiri.org/
