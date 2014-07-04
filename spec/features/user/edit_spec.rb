require 'spec_helper'

feature "Edit user profile information" do
  background do
    visit root_path
    login_with_oauth
    click_link 'Sign in'
    click_link 'Account'
  end

  scenario "Users can edit profile information" do
    expect(page).to have_content 'Name'
    fill_in 'Bio', with: 'Lorem ipsum arkham city'
    click_button 'Update User'
    expect(page).to have_content 'Summary'
    expect(page).to have_content 'Lorem ipsum arkham city'
  end


  scenario "Users can back to Users show from edit profile section" do
    click_link 'Check user'
    expect(page).to have_content 'Account'
  end
end
