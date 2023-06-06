require 'rails_helper'

RSpec.describe 'Post Show Page', vcr: { record: :new_episodes } do
  it 'displays the post title and body with the license' do
    visit post_path(1)

    within("#post-card") do
      expect(page).to have_content("Test Post")
      expect(page).to_not have_content("Test Post 2")
      expect(page).to have_content("This is a test post")
    end
  end

  it 'shows the license plate number as well as the poster and time' do
    visit post_path(1)

    within("#post-card") do
      expect(page).to have_content("ABC-1234")
      expect(page).to have_content("User: test")
      expect(page).to have_link("test")
      expect(page).to have_content("3:00 PM 06/05/2023")
    end
  end

  it 'has a comment section' do
    visit post_path(1)

    within("#comments-row") do
      expect(page).to have_content("Comments")
    end
  end

  it 'has comments' do
    visit post_path(1)

    within("#comment-card-0") do
      expect(page).to have_content("This is a test comment")
      expect(page).to have_link("User Show Test")
      expect(page).to have_content("3:00 PM 06/05/2023")
    end
  end

  it 'has a link to log in if you are not logged in' do
    visit post_path(1)

    within("#comment-form-row") do
      expect(page).to have_link("Login to Add Comment")
    end
  end

  it 'has a comment form if you are logged in' do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(1)
    visit post_path(1)

    within("#comment-form-row") do
      expect(page).to have_field("body")
      expect(page).to have_button("Submit")
    end
  end

  it 'can add a comment' do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(1)
    visit post_path(1)

    within("#comment-form-row") do
      fill_in "body", with: "This is a nice post"
      click_on "Submit"
    end

    expect(current_path).to eq(post_path(1))
    expect(page).to have_content("This is a nice post")
  end
end