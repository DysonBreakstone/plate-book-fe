require 'rails_helper'

RSpec.describe "Hot Plates", vcr: { record: :new_episodes } do
  it "returns json parsed by PlatebookService - 5 plates" do
    response = PlatebookService.new.get_hot_plates
    expect(response[:data].count).to eq(5)
    response[:data].each do |plate|
      expect(plate[:type]).to eq("plate")
    end
  end
end
