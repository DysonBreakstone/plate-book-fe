require 'rails_helper'

RSpec.describe "Edit username", vcr: { record: :new_episodes } do
  it "can edit user name" do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(3)
    visit edit_user_path(3)

    fill_in "new_user_name", with: "Sandra"
    click_on "commit"
    expect(current_path).to eq(user_path(3))
  end
end