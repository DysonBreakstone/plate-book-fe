require 'rails_helper'

RSpec.describe "Platebook Service" do
  describe "Connection" do
    xit "gets all users" do
      WebMock.allow_net_connect!
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
      WebMock.disable_net_connect!
    end
    xit "get user" do
      WebMock.allow_net_connect!
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
      WebMock.disable_net_connect!
    end
    xit "get all plates" do
      WebMock.allow_net_connect!
      json = PlatebookService.new.get_all_plates
      expect(json).to be_a(Hash)
      expect(json).to have_key(:data)
      expect(json[:data]).to be_an(Array)
      expect(json[:data].first).to have_key(:id)
      expect(json[:data].first).to have_key(:type)
      expect(json[:data].first).to have_key(:attributes)
      expect(json[:data].first[:attributes]).to have_key(:plate_number)
      WebMock.disable_net_connect!
    end
    xit "get plate" do
      WebMock.allow_net_connect!
      json = PlatebookService.new.get_plate(1)
      expect(json).to be_a(Hash)
      expect(json).to have_key(:data)
      expect(json[:data]).to have_key(:id)
      expect(json[:data]).to have_key(:type)
      expect(json[:data]).to have_key(:attributes)
      expect(json[:data][:attributes]).to have_key(:plate_number)
      WebMock.disable_net_connect!
    end
    xit "get all posts" do
      WebMock.allow_net_connect!
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
      WebMock.disable_net_connect!
    end
    xit "get post" do
      WebMock.allow_net_connect!
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
      WebMock.disable_net_connect!
    end
    xit "get locations" do
      WebMock.allow_net_connect!
      json = PlatebookService.new.get_locations
      expect(json).to be_a(Hash)
      expect(json).to have_key(:data)
      expect(json[:data]).to be_an(Array)
      expect(json[:data].first).to have_key(:id)
      expect(json[:data].first).to have_key(:type)
      expect(json[:data].first).to have_key(:attributes)
      expect(json[:data].first[:attributes]).to have_key(:lat)
      expect(json[:data].first[:attributes]).to have_key(:lng)
      WebMock.disable_net_connect!
    end
  end
end