require 'spec_helper'

feature "User Authentication" do
  background { login_with_oauth }

  scenario "User is able to signing successfully" do
    visit users_index_path
    expect(page).to have_content 'Users'
  end
end
