require "bing_api"

namespace :bings do
  desc "get bing news articles"
  task get: :environment do
    draftees = Draftee.all
    bing = BingAPI.new

    draftees.each do |draftee|
      bings = bing.get_bings(draftee.name)
      articles = bings["value"]

      articles.each do |article|
        b = draftee.bings.new(
          title: article["name"], 
          url: article["url"], 
          description: article["description"], 
          date: article["datePublished"]
        )
        b.thumbnail = article["image"]["thumbnail"]["contentUrl"] if article["image"]
        b.save
      end
    end
  end
end

