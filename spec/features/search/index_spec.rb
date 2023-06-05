require 'rails_helper'

RSpec.describe 'Search Index Page', :vcr do
  it "displays Search Results at the top of the page" do
    visit "/search?category=plates&query=X"
    expect(page).to have_content("Search Results")
    expect(page).to have_content("000XXX")
  end

  it "can search by plates" do
    visit "/search?category=plates&query=X"
    expect(page).to have_link("000XXX")
    expect(page).to have_link("XXXX")
    expect(page).to have_link("XXX111")
  end

  it "can search by posts" do
    visit "/search?category=posts&query=Test"
    expect(page).to have_link("Test Post")
    expect(page).to have_link("Test Post 2")
    expect(page).to have_link("Test Post 3")
    expect(page).to have_link("Test Post 4")
  end

end