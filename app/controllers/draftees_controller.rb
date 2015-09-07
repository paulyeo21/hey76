class DrafteesController < ApplicationController
  def new
    @draftee = Draftee.new
  end

  def show
    @draftee = Draftee.find(params[:id])
    @inserts = Insert.where(draftee_id: params[:id])
  end

  def create
    @draftee = Draftee.new(draftee_params)
    if @draftee.save
      redirect_to draftee_url(@draftee)
    else
      render 'new'
    end
  end

  def index
    @draftees = Draftee.all
    @suggestions = Draftee.select(:name)
    @suggestions_array = []
    @suggestions.each {|draftee| @suggestions_array.push(draftee["name"])}

    respond_to do |format|
      format.html
      format.json { render :json => @suggestions_array }
    end
  end

  def search
    @draftee = Draftee.find_by_name(params[:name])
    redirect_to draftee_url(@draftee)
  end

  def home
  end

  def edit
    @draftee = Draftee.find(params[:id])
  end

  def update
    @draftee = Draftee.find(params[:id])
    if @draftee.update_attributes(draftee_params)
      redirect_to draftee_url(@draftee)
    else
      render 'edit'
    end
  end

  def destroy
    Draftee.find(params[:id]).destroy
    redirect_to draftees_path
  end

  private

    def draftee_params
      params.require(:draftee).permit(:name, :twitter, :instagram)
    end

end