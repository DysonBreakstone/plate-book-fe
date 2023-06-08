require 'rails_helper'

RSpec.feature 'User Show Page', vcr: { record: :new_episodes } do
  before(:each) do
    json_response = File.read('spec/fixtures/single_user.json')
    stub_request(:get, "#{ENV['BACK_END_DOMAIN']}/api/v1/users/3").
        to_return(status: 200, body: json_response)
  end

  it "displays the username at the top of the page" do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(3)
    visit user_path(3)

    within ("#username") do
      expect(page).to have_content("User Show Test")
    end
  end

  it "displays the user's followed plates" do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(3)
    visit user_path(3)

    within ("#plates-row") do
      expect(page).to have_content("ABCD-1234")
    end
  end

  it "displays the user's posts" do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(3)
    visit user_path(3)

    within ("#posts-row") do
      expect(page).to have_content("Test Post 5")
    end
  end

  it "displays the user's comments" do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(3)
    visit user_path(3)

    within ("#comments-row") do
      expect(page).to have_content("This is a test comment")
      expect(page).to have_button("Edit this comment")
      expect(page).to have_button("Delete this comment")
    end
  end

  it "has button to change user name" do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(3)
    visit user_path(3)

    expect(page).to have_link("update_username")
    click_on("update_username")
    expect(current_path).to eq(edit_user_path(3))
  end
end
