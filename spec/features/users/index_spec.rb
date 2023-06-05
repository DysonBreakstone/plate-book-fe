require 'rails_helper'

RSpec.describe 'User Index Page', type: :feature do
  before(:each) do
    json_response = File.read('spec/fixtures/all_users.json')
    stub_request(:get, "http://localhost:5000/api/v1/users").
        to_return(status: 200, body: json_response)
  end

  it "displays 'Users' at the top of the page" do
    visit users_path
    within ("h1") do
      expect(page).to have_content("Users")
    end
  end
  it "displays all user's usernames" do
    visit users_path
    within (all(".list-group-item")[0]) do
      expect(page).to have_content("test")
    end
    within (all(".list-group-item")[1]) do
      expect(page).to have_content("test2")
    end
  end
  it "usernames link to user's show page" do
    visit users_path
    within (all(".list-group-item")[0]) do
      expect(page).to have_link("test")
    end
    within (all(".list-group-item")[1]) do
      expect(page).to have_link("test2")
    end
  end
end