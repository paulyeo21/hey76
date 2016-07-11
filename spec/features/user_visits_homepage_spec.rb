require "rails_helper"

feature "User visits homepage" do
  scenario "successfully" do
    visit root_path
  end
end

