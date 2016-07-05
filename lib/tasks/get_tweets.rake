require "twitter_api"

namespace :posts do
  desc "get user tweet ids"
  task get_tweets: :environment do
    draftees = Draftee.all
    twitter = TwitterAPI.new

    draftees.each do |draftee|
      if draftee.tweets.first
        options = { since_id: draftee.tweets.first.t_id }
      else
        options = { count: 10 }
      end
      tweets = twitter.get_user_timeline(draftee.twitter, options)

      tweets.each do |t|
        draftee.tweets.create(t_id: t.attrs[:id_str], date: t.created_at)
      end
    end
  end
end
