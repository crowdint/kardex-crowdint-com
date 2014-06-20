require 'spec_helper'

feature "User profile information" do
  background do
    Capybara.current_driver = :selenium
    login_with_oauth
    click_link('Show', match: :first)
  end

  scenario "Users can see profile information" do
    expect(page).to have_content 'Biography'
    expect(page).to have_content 'Position'
    expect(page).to have_content 'Skills'
  end

  scenario "Users can back to Users from profile section" do
    click_link 'Back to users'
    expect(page).to have_content 'Users'
  end

  scenario "Users can edit profile information from profile section" do
    click_link 'Edit user'
    expect(page).to have_content 'Edit user'
    fill_in 'Bio', with: 'Lorem ipsum arkham city'
    click_button 'Update User'
    expect(page).to have_content 'Biography'
    expect(page).to have_content 'Lorem ipsum arkham city'
  end

  scenario "Users can back to Users from edit profile section" do
    click_link 'Edit user'
    click_link 'Back to users'
    expect(page).to have_content 'Users'
  end
end
