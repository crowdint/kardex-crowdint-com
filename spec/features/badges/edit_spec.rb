require 'spec_helper'

feature 'badges' do
  background do
    login_with_oauth
    User.first.update_attributes(is_admin: true)
    click_link 'Sign in'
    click_link 'Admin Power'
  end

  scenario 'edit a badge' do
    expect(page).to have_content 'Manage Users'
    click_link 'Badge'
    expect(page).to have_content 'Manage Badges'
    click_link 'Create a Badge'
    fill_in 'Name', with: Faker::Lorem.word
    fill_in 'Description', with: Faker::Lorem.paragraph
    click_button 'Save'
    expect(page).to have_content 'Manage Badges'
    click_link 'Edit'
    fill_in 'Description', with: Faker::Lorem.paragraph
    click_button 'Save'
  end
end
