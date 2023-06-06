require 'rails_helper'

RSpec.describe "Create comments" do
  describe "Happy Path" do
    it "posts comment", :vcr do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(1)
      visit post_path(1)

      expect(page).to have_no_content("Samuel Jones")
      expect(page).to have_field('body')
      
      fill_in "body", with: "Samuel Jones"
      click_on("commit")
      
      expect(page).to have_content("Samuel Jones")
    end
  end

  describe "Sad Paths", :vcr do
    it "has no text field if not logged in", :vcr do
      visit post_path(1)
      expect(page).to have_no_field("body")
      expect(page).to have_link("Login to Add Comment")
    end

    it "explicit content", :vcr do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(1)
      visit post_path(1)

      fill_in "body", with: "I'm going to kill you"
      click_on "commit"

      expect(page).to have_no_content("I'm going to kill you")
    end
  end

end
