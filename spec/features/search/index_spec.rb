require 'rails_helper'

RSpec.feature 'Search Index Page', vcr: { record: :new_episodes } do
  it "displays Search Results at the top of the page" do
    visit "/search?category=plates&query=ABC"

    expect(page).to have_content("Search Results")
    expect(page).to have_content("ABC-1234")
  end

  it "can search by plates" do
    visit "/search?category=plates&query=ABC"
    expect(page).to have_link("ABC-1234")
  end

  it "can search by posts" do
    visit "/search?category=posts&query=Test"
    expect(page).to have_link("Test Post")
    expect(page).to have_link("Test Post 2")
    expect(page).to have_link("Test Post 3")
    expect(page).to have_link("Test Post 4")
  end

end
