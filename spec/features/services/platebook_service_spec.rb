require 'rails_helper'

RSpec.feature "Platebook Service", vcr: { record: :new_episodes } do
  describe "Connection" do
    it "gets all users" do

      json = PlatebookService.new.get_all_users

      expect(json).to be_a(Hash)
      expect(json).to have_key(:data)
      expect(json[:data]).to be_an(Array)
      expect(json[:data].first).to have_key(:id)
      expect(json[:data].first).to have_key(:type)
      expect(json[:data].first).to have_key(:attributes)
      expect(json[:data].first[:attributes]).to have_key(:email)
      expect(json[:data].first[:attributes]).to have_key(:token)
      expect(json[:data].first[:attributes]).to have_key(:uid)

    end
    it "get user" do

      json = PlatebookService.new.get_user(1)
      expect(json).to be_a(Hash)
      expect(json).to have_key(:data)
      expect(json[:data]).to have_key(:id)
      expect(json[:data]).to have_key(:type)
      expect(json[:data]).to have_key(:attributes)
      expect(json[:data][:attributes]).to have_key(:username)
      expect(json[:data][:attributes]).to have_key(:email)
      expect(json[:data][:attributes]).to have_key(:token)
      expect(json[:data][:attributes]).to have_key(:uid)

    end
    it "get all plates" do

      json = PlatebookService.new.get_all_plates
      expect(json).to be_a(Hash)
      expect(json).to have_key(:data)
      expect(json[:data]).to be_an(Array)
      expect(json[:data].first).to have_key(:id)
      expect(json[:data].first).to have_key(:type)
      expect(json[:data].first).to have_key(:attributes)
      expect(json[:data].first[:attributes]).to have_key(:plate_number)

    end
    it "get plate" do

      json = PlatebookService.new.get_plate(1)
      expect(json).to be_a(Hash)
      expect(json).to have_key(:data)
      expect(json[:data]).to have_key(:id)
      expect(json[:data]).to have_key(:type)
      expect(json[:data]).to have_key(:attributes)
      expect(json[:data][:attributes]).to have_key(:plate_number)

    end
    it "get all posts" do

      json = PlatebookService.new.get_all_posts
      expect(json).to be_a(Hash)
      expect(json).to have_key(:data)
      expect(json[:data]).to be_an(Array)
      expect(json[:data].first).to have_key(:id)
      expect(json[:data].first).to have_key(:type)
      expect(json[:data].first).to have_key(:attributes)
      expect(json[:data].first[:attributes]).to have_key(:title)
      expect(json[:data].first[:attributes]).to have_key(:body)
      expect(json[:data].first[:attributes]).to have_key(:user_id)
      expect(json[:data].first[:attributes]).to have_key(:plate_posts)
      expect(json[:data].first[:attributes]).to have_key(:parent_plates)

    end
    it "get post" do

      json = PlatebookService.new.get_post(1)
      expect(json).to be_a(Hash)
      expect(json).to have_key(:data)
      expect(json[:data]).to have_key(:id)
      expect(json[:data]).to have_key(:type)
      expect(json[:data]).to have_key(:attributes)
      expect(json[:data][:attributes]).to have_key(:title)
      expect(json[:data][:attributes]).to have_key(:body)
      expect(json[:data][:attributes]).to have_key(:user_id)
      expect(json[:data][:attributes]).to have_key(:plate_posts)
      expect(json[:data][:attributes]).to have_key(:parent_plates)

    end
    it "get locations" do

      json = PlatebookService.new.get_locations
      expect(json).to be_a(Hash)
      expect(json).to have_key(:data)
      expect(json[:data]).to be_an(Array)
      expect(json[:data].first).to have_key(:id)
      expect(json[:data].first).to have_key(:type)
      expect(json[:data].first).to have_key(:attributes)
      expect(json[:data].first[:attributes]).to have_key(:lat)
      expect(json[:data].first[:attributes]).to have_key(:lng)

    end

    it "gets search results" do
      params = {category: "plates", query: "ABC"}
      json = PlatebookService.new.get_all_search(params)
      expect(json).to be_a(Hash)
      expect(json).to have_key(:data)
      expect(json[:data]).to be_an(Array)
      expect(json[:data].first).to have_key(:id)
      expect(json[:data].first).to have_key(:type)
      expect(json[:data].first).to have_key(:attributes)
      expect(json[:data].first[:attributes]).to have_key(:plate_number)
      expect(json[:data].first[:attributes]).to have_key(:posts)
    end
  end
end
