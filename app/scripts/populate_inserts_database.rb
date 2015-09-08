require 'open-uri'
require 'json'
require 'date'

class PopulateInsertsDatabase 

  def self.find_new_inserts

    # Twitter configuration
    $twitter = Twitter::REST::Client.new do |config|
      config.consumer_key = Rails.application.secrets.twitter_consumer_key
      config.consumer_secret = Rails.application.secrets.twitter_consumer_secret
      config.access_token = Rails.application.secrets.twitter_access_token
      config.access_token_secret = Rails.application.secrets.twitter_access_token_secret
    end

    # Bing search configuration
    bing_news = Bing.new(Rails.application.secrets.bing_client_id, 20, 'News')
    
    # Get all draftee handles
    @draftees = Draftee.all

    # loop through all draftee twitter handles
    @draftees.each do |draftee|

      # Twitter API:
      # 1. get twitter timeline using twitter handle
      # 2. store each embedded tweet from user timeline to db

      # 1.
      @tweets = $twitter.user_timeline(draftee[:twitter])
      @tweets.each do |tweet|

        # only add to db if tweet does not exist
        unless Insert.exists?(content_id: tweet.id)
          
          # 2.
          draftee.inserts.create!(content: $twitter.oembed(tweet.id).html, date: tweet.created_at, content_id: tweet.id, type_of: "twitter")
        end
      end

      # Instagram API:
      # 1. find instagram ids from instagram handles
      # 2. use instagram ids to get instagram media 
      # 3. store embedded instagram media into db

      # 1.
      # http://stackoverflow.com/questions/11796349/instagram-how-to-get-my-user-id-from-username
      draftee_instagram = JSON.parse(open('https://api.instagram.com/v1/users/search?q=' + draftee[:instagram] + '&client_id=' + Rails.application.secrets.instagram_client_id).read)['data'][0]
      draftee_instagram_id = draftee_instagram['id']

      # 2.
      # http://stackoverflow.com/questions/17373886/how-can-i-get-a-users-media-from-instagram-without-authenticating-as-a-user
      JSON.parse(open('https://api.instagram.com/v1/users/' + draftee_instagram_id + '/media/recent/?client_id=' + Rails.application.secrets.instagram_client_id).read)['data'].each do |instagram|
        unless Insert.exists?(content_id: instagram['id'])
          # 3.
          # https://instagram.com/developer/embedding/#media_redirect
          embedded_instagram = JSON.parse(open('https://api.instagram.com/oembed?url=' + instagram['link']).read)['html']
          draftee.inserts.create!(content: embedded_instagram, date: DateTime.strptime(instagram['created_time'],'%s'), content_id: instagram['id'], type_of: "instagram")
        end
      end

      # Bing Search API:
      # 1.
      # 2.
      draftee_results = bing_news.search(draftee[:name])

    end
  end

end
