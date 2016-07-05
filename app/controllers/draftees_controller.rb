class DrafteesController < ApplicationController
  def show
    @draftee = Draftee.find(params[:id])
    tweets = @draftee.tweets.order(date: :desc).limit(10)
    bings = @draftee.bings.order(date: :desc).limit(10)
    @aggregate = (tweets + bings).sort_by {|x| x.date}.reverse.first(10)
  end

  private

  def draftee_params
    params.require(:draftee).permit(:name, :twitter, :instagram)
  end
end
