require 'rails_helper'

RSpec.feature 'Posts Index Page', vcr: { record: :new_episodes } do
  before(:each) do
    json_response = File.read('spec/fixtures/all_posts.json')
    stub_request(:get, "http://#{ENV['BACK_END_DOMAIN']}:5001/api/v1/posts").
        to_return(status: 200, body: json_response)
  end

  it "displays 'Posts' at the top of the page" do
    visit posts_path
    within ("h1") do
      expect(page).to have_content("Posts")
    end
  end

  it "displays all posts' titles" do
    visit posts_path
    within (".list-group") do
      expect(page).to have_content("Test Post")
      expect(page).to have_content("Test Post 2")
      expect(page).to have_content("Test Post 3")
      expect(page).to have_content("Test Post 4")
    end
  end

  it "post title links to post show page" do
    visit posts_path
    within (".list-group") do
      expect(page).to have_link("Test Post")
    end
    within (".list-group") do
      expect(page).to have_link("Test Post 2")
    end
  end
end
