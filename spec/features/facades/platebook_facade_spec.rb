require 'rails_helper'

RSpec.describe "platebook_facade", :vcr do
  it "all_users" do
    params = {}
    response = PlatebookFacade.new(params).all_users
    expect(response).to be_a(Array) 
    expect(response.first).to be_an_instance_of(User)
  end

  it "all_plates" do
    params = {}
    response = PlatebookFacade.new(params).all_plates
    expect(response).to be_a(Array)
    expect(response.first).to be_an_instance_of(Plate)
  end

  it "all_posts" do
    params = {}
    response = PlatebookFacade.new(params).all_posts
    expect(response).to be_a(Array)
    expect(response.first).to be_an_instance_of(Post)
  end

  it "user" do
    params = {id: 1}
    response = PlatebookFacade.new(params).user
    expect(response).to be_an_instance_of(User)
  end

  it "plate" do
    params = {id: 1}
    response = PlatebookFacade.new(params).plate
    expect(response).to be_an_instance_of(Plate)
  end

  it "post" do
    params = {id: 1}
    response = PlatebookFacade.new(params).post
    expect(response).to be_an_instance_of(Post)
  end

  it "search" do
    params = {category: "plates", search: "X"}
    response = PlatebookFacade.new(params).search
    expect(response).to be_a(Array)
    expect(response.first).to be_an_instance_of(Plate)

    params = {category: "posts", search: "Test"}
    response = PlatebookFacade.new(params).search
    expect(response).to be_a(Array)
    expect(response.first).to be_an_instance_of(Post)
  end
end