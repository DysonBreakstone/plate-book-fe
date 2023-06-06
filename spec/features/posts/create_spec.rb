require 'rails_helper'

RSpec.feature "create post", vcr: { record: :new_episodes } do
  describe "sad path" do
    it "rejects inappropriate posts" do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(1)
      visit new_post_path
      fill_in("title", with: "I'll kill everyone")
      fill_in("body", with: "Just Kidding, just testing the sad path")
      fill_in("plate_number", with: "777 TTT")
      fill_in("street_address", with: "200 E Colfax Ave")
      fill_in("city", with: "Denver")
      select('Colorado', from: 'state')
      click_on("Save")

      expect(current_path).to eq(new_post_path)
      expect(page).to have_content("Either the title or post contains content that does not meet our community guidelines.")
    end
  end
end
