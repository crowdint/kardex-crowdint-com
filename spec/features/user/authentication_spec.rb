require 'spec_helper'

feature "User Authentication" do
  let(:user) { Fabricate :user }

  scenario 'User is redirected to the sign in page if visit a path without being authenticated' do
    visit user_path(user)
    expect(page).to have_content 'Welcome to'
    expect(page).to have_content 'You need to sign in or sign up before continuing.'
  end

  scenario "User is able to signing successfully" do
    login_with_oauth
    User.first.update_attributes(is_admin: true)
    login_with_oauth
    visit admin_root_path
    expect(page).to have_content 'Admin settings'
  end
end
