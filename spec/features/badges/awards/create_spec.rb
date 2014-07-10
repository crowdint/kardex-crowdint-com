require 'spec_helper'

feature 'Awards' do
  background { login_with_oauth }

  scenario 'Creating a award' do
    visit badges_engine.awards_path
    click_link 'New Award'
    fill_in 'Title', with: Faker::Lorem.word
    fill_in 'Description', with: Faker::Lorem.paragraph
    click_button 'Create Award'
    expect(page).to have_content 'Award was successfully created.'
    expect(page).to have_content 'Title'
    expect(page).to have_content 'Description'
  end
end
