require 'rails_helper'

RSpec.describe "Edit comment" do
  it "brings user to edit page", :vcr do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(1)
    visit user_path(1)

    within("#comment-card-0") do
      click_on "Edit this comment"
    end

    fill_in "body", with: "This is an edit"
    click_on "commit"
    expect(current_path).to eq(user_path(1))
  end
end