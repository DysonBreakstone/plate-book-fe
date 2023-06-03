require 'rails_helper'

RSpec.describe 'User Show Page', type: :feature do
  before(:each) do
    json_response = File.read('spec/fixtures/single_user.json')
    stub_request(:get, "http://localhost:5000/api/v1/users/3").
        to_return(status: 200, body: json_response)
  end

  it "displays the username at the top of the page" do
    visit user_path(3)

    within ("#username") do
      expect(page).to have_content("User Show Test")
    end
  end

  it "displays the user's followed plates" do
    visit user_path(3)
  
    within ("#plates-row") do
      expect(page).to have_content("ABCD-1234")
    end
  end

  it "displays the user's posts" do
    visit user_path(3)

    within ("#posts-row") do
      expect(page).to have_content("Test Post 5")
    end
  end

  it "displays the user's comments" do
    visit user_path(3)

    within ("#comments-row") do
      expect(page).to have_content("This is a test comment")
    end
  end
end