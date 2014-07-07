require 'spec_helper'

feature "User Authentication" do
  background do
    login_with_oauth
    User.first.update_attributes(is_admin: true)
    login_with_oauth
  end

  scenario "User is able to signing successfully" do
    visit admin_root_path
    expect(page).to have_content 'Admin settings'
  end
end
