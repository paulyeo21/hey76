require "rails_helper"

describe Api::V1::DrafteesController do
  context "#index" do
    it "return all draftees" do
      draftee = create(:draftee)

      get :index

      expect(response.status).to eq(200)
      expect(response.body).to eq([draftee].to_json)
    end
  end
end
