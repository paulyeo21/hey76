class DrafteesController < ApplicationController
  def new
    @draftee = Draftee.new
  end

  def show
    @draftee = Draftee.find(params[:id])
  end

  def create
    @draftee = Draftee.new(user_params)
    if @draftee.save
      redirect_to draftee_url(@draftee)
    else
      render 'new'
    end
  end

  def json
    @suggestions = Draftee.select(:name)
    @suggestions_array = []
    @suggestions.each {|draftee| @suggestions_array.push(draftee["name"])}
    render json: {suggestions: @suggestions_array}
  end

  def index
  end

  def search
    @draftee = Draftee.find_by_name(params[:name])
    redirect_to draftee_url(@draftee)
  end

  private

    def user_params
      params.require(:draftee).permit(:name, :twitter, :instagram)
    end

end
