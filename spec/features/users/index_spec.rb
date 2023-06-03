require 'rails_helper'

RSpec.describe 'User Index Page', type: :feature do

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
      click_link("test")
      #expect (current_path).to eq(user_path(1))
    end
    within (all(".list-group-item")[1]) do
      expect(page).to have_link("test2")
      click_link("test2")
      #expect (current_path).to eq(user_path(2))
    end
  end
end