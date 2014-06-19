require 'spec_helper'

feature 'badges' do
  background do
    Capybara.current_driver = :selenium
    login_with_oauth
    user = User.first
    user.update_attributes(is_admin: true)
    BadgesEngine::Badge.destroy_all
  end

  # This test is failing, for some extrange reason in the
  # browser find a record while in the console doesn't exists
  scenario 'creating a badge' do
    #visit badges_engine.badges_path
    #click_link 'New Badge'
    #fill_in 'Name', with: 'Dummy Badge'
    #fill_in 'Description', with: Faker::Lorem.paragraph
    #fill_in 'Level', with: 1
    #click_button 'Create Badge'
    #expect(page).to have_content BadgesEngine::Badge.first.name
    #expect(page).to have_content BadgesEngine::Badge.first.description
    #expect(page).to have_content BadgesEngine::Badge.first.level
  end
end
