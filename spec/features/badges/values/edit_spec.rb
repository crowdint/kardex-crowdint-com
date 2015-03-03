require 'spec_helper'

feature 'values' do
  let!(:value) { Fabricate(:value) }

  background do
    login_with_oauth
    User.first.update_attributes(is_admin: true)
    login_with_oauth
  end

  scenario 'edit a value' do
    visit badges_engine.admin_values_path
    click_link 'Edit'
    fill_in 'Name', with: Faker::Lorem.word
    click_button 'Update Value'
    expect(page).to have_content 'Value was successfully updated'
    expect(page).to have_content BadgesEngine::Value.last.name
  end
end
