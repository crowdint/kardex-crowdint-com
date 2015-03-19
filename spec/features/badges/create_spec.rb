require 'spec_helper'

feature 'badges' do
  background do
    login_with_oauth
    User.first.update_attributes(is_admin: true)
    login_with_oauth
  end

  scenario 'creating a badge' do
    visit badges_engine.admin_badges_path
    click_link 'Create a Badge'
    fill_in 'Name', with: Faker::Lorem.word
    fill_in 'Description', with: Faker::Lorem.paragraph
    click_button 'Save'
    expect(page).to have_content BadgesEngine::Badge.first.name
    expect(page).to have_content BadgesEngine::Badge.first.description
  end
end
