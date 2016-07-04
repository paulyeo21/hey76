require "twitter_api"

namespace :posts do
  desc "get user tweet ids"
  task get_tweets: :environment do
    twitter = TwitterAPI.new
    b = Draftee.find(1)

    tweets = twitter.get_user_timeline(b.twitter)
    tweets.each do |t|
      b.tweets.create(t_id: t.attrs[:id_str], date: t.created_at)
    end
  end
end
