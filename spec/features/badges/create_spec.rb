require 'spec_helper'

feature 'badges' do
  background { login_with_oauth }

  scenario 'creating a badge' do
    visit badges_engine.badges_path
    click_link 'New Badge'
    fill_in 'Name', with: Faker::Lorem.word
    fill_in 'Description', with: Faker::Lorem.paragraph
    fill_in 'Level', with: 1
    click_button 'Create Badge'
    expect(page).to have_content BadgesEngine::Badge.first.name
    expect(page).to have_content BadgesEngine::Badge.first.description
    expect(page).to have_content BadgesEngine::Badge.first.level
  end
end
