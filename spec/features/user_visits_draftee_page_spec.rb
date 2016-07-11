require "rails_helper"

feature "User visits draftee page" do
  scenario "successfully" do
    draftee = create(:draftee)
    visit draftee_path(draftee.id) 
  end
end

