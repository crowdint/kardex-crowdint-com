require 'spec_helper'

feature 'badges' do
  background { login_with_oauth }

  scenario 'edit a badge' do
    visit badges_engine.badges_path
    click_link 'New Badge'
    fill_in 'Name', with: Faker::Lorem.word
    fill_in 'Description', with: Faker::Lorem.paragraph
    click_button 'Create Badge'
    expect(page).to have_content 'Badge was successfully created.'
    click_link 'Edit'
    fill_in 'Description', with: Faker::Lorem.paragraph
    click_button 'Update Badge'
  end
end
