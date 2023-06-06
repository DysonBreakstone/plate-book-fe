require 'rails_helper'

RSpec.describe "Backend Service", vcr: { record: :new_episodes } do
  describe "Connection" do
    it "can register a user", :vcr do
      json = BackendService.new.register_user(234923492,"tester@gmail.com","234u23u")
      response = JSON.parse(json.body, symbolize_names: true)
      expect(response).to be_a(Hash)
      expect(response).to have_key(:data)
      expect(response[:data]).to have_key(:id)
      expect(response[:data]).to have_key(:type)
      expect(response[:data]).to have_key(:attributes)
      expect(response[:data][:attributes]).to have_key(:email)
      expect(response[:data][:attributes]).to have_key(:token)
      expect(response[:data][:attributes]).to have_key(:uid)
      expect(response[:data][:attributes][:email]).to eq("tester@gmail.com")
      expect(response[:data][:attributes][:token]).to eq("234u23u")
      expect(response[:data][:attributes][:uid]).to eq("234923492")
    end
  end
end
