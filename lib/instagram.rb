require "httparty"

class Instagram
  include HTTParty
  base_uri "https://api.instagram.com"

  def initialize
  end

  def get_user_id username
    self.class.get("/v1/users/search?q=#{username}&client_id=#{ENV["INSTAGRAM_CLIENT_ID"]}")
  end
end

# instagram = Instagram.new
# response = instagram.get_user_id("b_ingram13")
# puts response
