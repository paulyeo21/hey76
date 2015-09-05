class StaticPagesController < ApplicationController

  def search
    @draftee = Draftee.find_by_name(params[:name])
    if @draftee.present?
      redirect_to draftee_url(@draftee)
    else
      render :home
    end
  end

  def home
  end

  def mosaic
  end

end