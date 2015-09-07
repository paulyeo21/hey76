class InsertsController < ApplicationController

  def index
    
    # Get all draftee handles
    @draftees = Draftee.all

    # loop through all draftee twitter handles
    @draftees.each do |draftee|

      # Twitter API:
      # Get tweets for each draftee with twitter
      @tweets = client.user_timeline(draftee[:twitter], :count => 5)
      @tweets.each do |tweet|

        # only add to db if tweet does not exist
        unless Insert.exists?(content_id: tweet[:id])

          # add embedded html field and date time of when created
          draftee.inserts.create!(content: client.oembed(tweet[:id]).html, date: tweet[:created_at], content_id: tweet[:id], type: "twitter")
        end
      end

      # Instagram API:
      
    end

    @inserts = Insert.all
  end

  def client
    Twitter::REST::Client.new do |config|
      config.consumer_key = Rails.application.secrets.twitter_consumer_key
      config.consumer_secret = Rails.application.secrets.twitter_consumer_secret
      config.access_token = Rails.application.secrets.twitter_access_token
      config.access_token_secret = Rails.application.secrets.twitter_access_token_secret
    end
  end

end
