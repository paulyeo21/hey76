require "httparty"

class BingAPI
  include HTTParty
  base_uri "https://api.cognitive.microsoft.com/bing/v5.0/news"

  def initialize
    @headers = { "Ocp-Apim-Subscription-Key" => ENV["BING_API_KEY"] }
  end

  def get_bings query
    self.class.get("/search?q=#{query}", headers: @headers)
  end
end
