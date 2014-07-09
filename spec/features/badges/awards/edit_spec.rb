require 'spec_helper'

feature 'Awards edit' do
  background { login_with_oauth }

  xscenario 'edit a badge' do
    visit badges_engine.awards_path
    click_link 'New Award'
    fill_in 'Title', with: Faker::Lorem.word
    fill_in 'Description', with: Faker::Lorem.paragraph
    click_button 'Create Award'
    expect(page).to have_content 'Award was successfully created.'
    click_link 'Edit'
    fill_in 'Description', with: Faker::Lorem.paragraph
    click_button 'Update Award'
  end
end
