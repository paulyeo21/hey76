require "bing_api"

namespace :posts do
  desc "get bing news articles"
  task get_bings: :environment do
    d = Draftee.find(1)
    bings = BingAPI.new.get_bings(d.name)
    news = bings["value"]

    news.each do |n|
      bing = d.bings.new(
        title: n["name"], 
        url: n["url"], 
        description: n["description"], 
        date: n["datePublished"]
      )
      bing.thumbnail = n["image"]["thumbnail"]["contentUrl"] if n["image"]
      bing.save
    end
  end
end

