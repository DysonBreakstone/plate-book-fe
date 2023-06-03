require 'rails_helper'

RSpec.feature 'Home Page' do
  before do
    visit root_path
  end

  it 'has a search button' do
    expect(page).to have_button('Searceagr')
  end
end
