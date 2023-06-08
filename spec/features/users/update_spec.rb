require 'rails_helper'

RSpec.describe "update user", vcr: { record: :new_episodes } do
  describe "Sad Path" do
    it "Something went wrong" do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(1)
      visit edit_user_path(1)
      fill_in "new_user_name", with: ""
      click_on "commit"

      expect(current_path).to eq(edit_user_path(1))
      expect(page).to have_content("Something went wrong.")
    end

    it "User already exists" do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(2)
      visit edit_user_path(2)
      fill_in "new_user_name", with: "User 1"
      click_on "commit"

      expect(current_path).to eq(edit_user_path(2))
      expect(page).to have_content("Username already taken")
    end
  end
end