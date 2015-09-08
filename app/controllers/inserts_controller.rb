require 'searchbing'
class InsertsController < ApplicationController
  def index
    bing_news = Bing.new(Rails.application.secrets.bing_client_id, 20, 'News')
    draftee_results = bing_news.search(draftee[:name])
    raise :test

    @inserts = Insert.all
  end
end
