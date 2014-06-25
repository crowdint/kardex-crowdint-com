require 'spec_helper'

feature 'value' do
  background { login_with_oauth }

  scenario 'creating a value' do
    visit badges_engine.values_path
    click_link 'New Value'
    fill_in 'Name', with: Faker::Lorem.word
    fill_in 'Description', with: Faker::Lorem.paragraph
    click_button 'Create Value'
    expect(page).to have_content 'Value was successfully created'
    expect(page).to have_content BadgesEngine::Value.last.name
    expect(page).to have_content BadgesEngine::Value.last.description
  end
end
