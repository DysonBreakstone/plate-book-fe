require 'rails_helper'

RSpec.describe 'Plates Index Page', type: :feature do
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
      click_link("ABC-1234")
      #expect(current_path).to eq(plate_path(1))
    end
    
    visit plates_path
    within (".list-group") do
      expect(page).to have_link("MKV-1234")
      click_link("MKV-1234")
      #expect(current_path).to eq(plate_path(2))
    end
  end
end