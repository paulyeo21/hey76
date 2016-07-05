require "twitter_api"

desc "get user tweet ids"
task tweets: :environment do
  draftees = Draftee.all
  twitter = TwitterAPI.new

  draftees.each do |draftee|
    if draftee.tweets.present?
      options = { since_id: draftee.tweets.last.t_id }
    else
      options = { count: 10 }
    end
    tweets = twitter.get_user_timeline(draftee.twitter, options)

    tweets.sort_by {|t| t.attrs[:id_str]}.each do |t|
      draftee.tweets.create(t_id: t.attrs[:id_str], date: t.created_at)
    end
  end
end
