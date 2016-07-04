class DrafteesController < ApplicationController
  def show
    @draftee = Draftee.find(params[:id])
  end

  private

  def draftee_params
    params.require(:draftee).permit(:name, :twitter, :instagram)
  end
end
