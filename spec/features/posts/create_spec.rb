require 'rails_helper'

RSpec.feature "create post", vcr: { record: :new_episodes } do
  describe "sad path" do
    xit "rejects inappropriate posts" do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(1)
      visit new_post_path
      fill_in("title", with: "I'm going to commit murder")
      fill_in("body", with: "I would never really do that, this is just a test.")
      fill_in("plate_number", with: "777 TTT")
      fill_in("street_address", with: "9464 County Road")
      fill_in("city", with: "Calais")
      select('Vermont', from: 'state')
      click_on("Save")

      expect(current_path).to eq(new_post_path)
      expect(page).to have_content("Either the title or post contains content that does not meet our community guidelines.")
    end
  end
end
