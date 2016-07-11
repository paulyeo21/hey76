require "rails_helper"

describe DrafteesController do
  context "#show" do
    it "get draftees successfully" do
      draftee = create(:draftee)

      get :show, { id: draftee.id }

      expect(response.status).to eq(200)
    end
  end
end
