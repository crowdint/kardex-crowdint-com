require 'spec_helper'

feature "Edit user profile information" do
  background do
    Capybara.current_driver = :selenium
    login_with_oauth
    click_link('Edit', match: :first)
  end

  scenario "Users can edit profile information" do
    expect(page).to have_content 'Edit user'
    fill_in 'Bio', with: 'Lorem ipsum arkham city'
    click_button 'Update User'
    expect(page).to have_content 'Biography'
    expect(page).to have_content 'Lorem ipsum arkham city'
  end


  scenario "Users can back to Users show from edit profile section" do
    click_link 'Check user'
    expect(page).to have_content 'Edit user'
  end
end
