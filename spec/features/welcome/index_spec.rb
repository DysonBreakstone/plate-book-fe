require 'rails_helper'

RSpec.feature 'Home Page', vcr: { record: :new_episodes } do
  before(:each) do
    json_response = File.read('spec/fixtures/all_locations.json')
    stub_request(:get, "http://#{ENV['BACK_END_DOMAIN']}:5001/api/v1/locations").
        to_return(status: 200, body: json_response)
    visit root_path
  end

  xit 'has a search button' do
    expect(page).to have_button('Search')
  end
end
