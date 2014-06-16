require 'spec_helper'

feature "Signing in" do
  let!(:user) { Fabricate(:user) }

  background do
    Capybara.current_driver = :selenium
    visit root_path
  end

  scenario "Signing in with incorrect credentials" do
    fill_in "Email", with: 'test@crowdint.com'
    fill_in "Password", with: 'test'
    click_button 'Sign in'
    expect(page).to have_content 'Sign in Email Password Sign in with Google Apps'
  end

  scenario "Signing in with correct credentials" do
    page.set_rack_session(:user_id => user.id)
    visit root_path
  end
end
