require "twitter"

class TwitterAPI
  def initialize
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key = ENV["TWITTER_CONSUMER_KEY"]
      config.consumer_secret = ENV["TWITTER_CONSUMER_SECRET"]
      config.access_token = ENV["TWITTER_ACCESS_TOKEN"]
      config.access_token_secret = ENV["TWITTER_ACCESS_TOKEN_SECRET"]
    end
  end

  def get_user_timeline username
    @client.user_timeline(username)
  end

  def get_tweet id
    @client.status(id)
  end
end
