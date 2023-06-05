require 'rails_helper'

RSpec.feature 'Home Page' do
  before(:each) do
    json_response = File.read('spec/fixtures/all_locations.json')
    stub_request(:get, "http://localhost:5000/api/v1/locations").
        to_return(status: 200, body: json_response)
    visit root_path
  end

  it 'has a search button' do
    expect(page).to have_button('Search')
  end
end
