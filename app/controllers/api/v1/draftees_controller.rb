class Api::V1::DrafteesController < ActionController::Base
  def index
    draftees = Draftee.all
    render json: draftees
  end
end
