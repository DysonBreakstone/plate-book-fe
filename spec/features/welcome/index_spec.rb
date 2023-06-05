require 'rails_helper'

RSpec.feature 'Home Page' do
  before do
    visit root_path
  end

  xit 'has a search button', :vcr do
    expect(page).to have_button('Search')
  end
end
