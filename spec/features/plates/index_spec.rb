require 'rails_helper'

RSpec.feature 'Plates Index Page', vcr: { record: :new_episodes } do
  before(:each) do
    json_response = File.read('spec/fixtures/all_plates.json')
    stub_request(:get, "#{ENV['BACK_END_DOMAIN']}/api/v1/plates").
        to_return(status: 200, body: json_response)
  end

  it "displays 'Plates' at the top of the page" do
    visit plates_path
    within ("h1") do
      expect(page).to have_content("Plates")
    end
  end

  it "displays all plates' numbers" do
    visit plates_path
    within (all(".list-group-item")[0]) do
      expect(page).to have_content("ABC-1234")
    end
    within (all(".list-group-item")[1]) do
      expect(page).to have_content("MKV-1234")
    end
  end

  it "each plate number links to the plate's show page" do
    visit plates_path
    within (".list-group") do
      expect(page).to have_link("ABC-1234")
    end

    visit plates_path
    within (".list-group") do
      expect(page).to have_link("MKV-1234")
    end
  end
end
