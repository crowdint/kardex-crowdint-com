require 'spec_helper'

feature 'badges' do
  background do
    login_with_oauth
    User.first.update_attributes(is_admin: true)
    login_with_oauth
  end

  xscenario 'edit a badge' do
    visit admin_badges_path
    click_link 'Create a Badge'
    fill_in 'Name', with: Faker::Lorem.word
    fill_in 'Description', with: Faker::Lorem.paragraph
    click_button 'Save'
    expect(page).to have_content 'Badge was successfully created.'
    click_link 'Edit'
    fill_in 'Description', with: Faker::Lorem.paragraph
    click_button 'Update Badge'
  end
end
