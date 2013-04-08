#
# Make API calls to the mendeley API
#
#     Mendeley.
#       new("your user's api token", "your user's api key").
#       get('/oapi/profiles/info/me/')
#         #=> Returns a hash with the current's user profile from the API.
#
#
# Dependencies:
#
# * faraday, to make the HTTP calls
# * faraday_middleware, to get the OAuth faraday middleware

require 'yaml'
require 'faraday'
require 'faraday_middleware'


class Mendeley
  attr_reader :token, :secret

  #
  # Create a new mendeley object
  #
  # @param token [String] the user's access token
  # @param secret [String] the user's access secret
  #
  def initialize(token, secret)
    @token, @secret = token, secret
  end

  #
  # Sends a get request to the mendeley API
  #
  # @param path [String] the path of the request to execute
  # @return [Hash] the json returned by the server
  #
  def get(path)
    connection.get do |req|
      req.url path
    end.body
  end

  private
  def connection
    @connection ||= Faraday.new(url: 'http://api.mendeley.com') do |connection|
      connection.request  :url_encoded
      connection.request  :oauth, oauth_data
      connection.response :json, content_type: //
      connection.adapter  *Faraday.default_adapter
    end
  end

  def oauth_data
    {
      consumer_key: consumer_key,
      consumer_secret: consumer_secret,
      token: token,
      token_secret: secret
    }
  end

  def consumer_key
    cred = YAML.load_file("/home/cboettig/.mendeley_auth.yaml")
#    cred[:consumer_key] 
    cred[:key] 
  end

  def consumer_secret
    cred = YAML.load_file("/home/cboettig/.mendeley_auth.yaml")
 #   cred[:consumer_secret] 
    cred[:secret] 
  end
end



module Jekyll
  class Mendeley < Liquid::Tag
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

      cred = YAML.load_file("/home/cboettig/.mendeley_auth.yaml")
      key = cred[:consumer_key] 
      secret = cred[:consumer_secret]

      ## Method 1 -- how do I get the token?
      key = cred[:key] 
      secret = cred[:secret] 
      token = cred[:token] 
      mendeley = Mendeley.new(token, secret)
      profile = mendeley.get('/oapi/profiles/info/me')

     ## Method 2 -- 
     require 'omniauth-mendeley'
      use OmniAuth::Builder do
        provider :mendeley, ENV[key], ENV[secret]
      end

      ### Method 3
      require 'oauth'
      con = OAuth::Consumer.new(key, secret,
                                    {:site => 'http://api.mendeley.com',
                                     :request_token_path => '/oauth/request_token',
                                     :access_token_path => '/oauth/access_token',
                                     :authorize_path => '/oauth/authorize'})
      ## Now what? looks like omniauth does this already...

    end
  end
end

