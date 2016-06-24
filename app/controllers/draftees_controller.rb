class DrafteesController < ApplicationController
  def show
    @draftee = Draftee.find(params[:id])
    # @inserts = Insert.where(draftee_id: params[:id])
  end

  private

  def draftee_params
    params.require(:draftee).permit(:name, :twitter, :instagram)
  end
end
