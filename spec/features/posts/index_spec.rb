require 'rails_helper'

RSpec.describe 'Posts Index Page', type: :feature do
  before(:each) do
    json_response = File.read('spec/fixtures/all_posts.json')
    stub_request(:get, "http://localhost:5000/api/v1/posts").
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

  xit "post title links to post show page" do
    visit posts_path
    within (".list-group") do
      expect(page).to have_link("Test Post")
      click_link("Test Post")
      # expect (current_path).to eq(post_path(1))
    end
    within (".list-group") do
      expect(page).to have_link("Test Post 2")
      click_link("Test Post 2")
      # expect (current_path).to eq(post_path(2))
    end
  end
end