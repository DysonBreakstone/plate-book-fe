require 'rails_helper'

RSpec.describe 'Plate Show Page', type: :feature, vcr: { record: :new_episodes } do
  before(:each) do
    json_response = File.read('spec/fixtures/single_plate.json')
    stub_request(:get, "http://#{ENV['BACK_END_DOMAIN']}:5001/api/v1/plates/1").
        to_return(status: 200, body: json_response)

    visit plate_path(1)
  end

  it "displays the plate number at the top of the page" do
    within ("#plate-number") do
      expect(page).to have_content("ABC-1234")
    end
  end

  it "displays the plate's posts group" do
    within("#posts-title") do
      expect(page).to have_content("Posts")
    end
  end

  it "displays the plate's posts" do
    within("#post-card-0") do
      expect(page).to have_content("Title: Test Post")
      expect(page).to have_content("Created: 9:07 PM 06/03/2023")
      expect(page).to have_content("Comments: 1")
      expect(page).to have_content("User: test")
    end

    within("#post-card-1") do
      expect(page).to have_content("Title: Test Post 2")
      expect(page).to have_content("Created: 9:07 PM 06/03/2023")
      expect(page).to have_content("Comments: 0")
      expect(page).to have_content("User: test2")
    end
  end

  it "has the posts title as a link to the post show page" do
    within("#post-card-0") do
      expect(page).to have_link("Test Post", href: post_path(1))
    end

    within("#post-card-1") do
      expect(page).to have_link("Test Post 2", href: post_path(2))
    end
  end

  it "has the user as a link to the user show page" do
    within("#post-card-0") do
      expect(page).to have_link("test", href: user_path(1))
    end

    within("#post-card-1") do
      expect(page).to have_link("test", href: user_path(2))
    end
  end
end
