require 'rails_helper'

RSpec.describe "create post", vcr: { record: :new_episodes } do
  describe "sad path" do
    it "rejects inappropriate posts", :vcr do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(1)
      visit new_post_path
      fill_in("title", with: "I'm going to commit murder")
      fill_in("body", with: "I would never really do that, this is just a test.")
      fill_in("plate_number", with: "777 TTT")
      fill_in("street_address", with: "9464 County Road")
      fill_in("city", with: "Calais")
      fill_in("state", with: "VT")
      fill_in("zipcode", with: "05648")
      click_on("Save")

      expect(current_path).to eq(new_post_path)
      expect(page).to have_content("Either the title or post contains content that does not meet our community guidelines.")
    end
  end
end
