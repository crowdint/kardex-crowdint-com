require 'spec_helper'

feature "User profile information" do
  background do
    visit root_path
    login_with_oauth
    click_link 'Sign in'
  end

  scenario "Users can see profile information" do
    expect(page).to have_content 'Summary'
    expect(page).to have_content 'Skills'
    expect(page).to have_content 'Account'
  end

  scenario "Users can edit profile information from profile section" do
    click_link 'Account'
    expect(page).to have_content 'Edit user'
    fill_in 'Bio', with: 'Lorem ipsum arkham city'
    click_button 'Update User'
    expect(page).to have_content 'Summary'
    expect(page).to have_content 'Lorem ipsum arkham city'
  end
end
