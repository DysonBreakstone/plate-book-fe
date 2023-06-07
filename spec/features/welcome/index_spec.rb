require 'rails_helper'

RSpec.feature 'Home Page', vcr: { record: :new_episodes } do
  before(:each) do
    visit root_path
  end

  it 'has a search button' do
    expect(page).to have_button('Search')
  end
end
