require 'spec_helper'

feature "Signing in" do
    background do
      puts user_omniauth_authorize_path(:google_apps)
      Capybara.current_driver = :selenium
    end

    scenario "Signing in with incorrect credentials" do
      visit  user_omniauth_authorize_path(:google_apps)
      fill_in "Email", with: 'test@crowdint.com'
      fill_in "Password", with: 'test'
      click_button 'Sign in'
      expect(page).to have_content 'The email or password you entered is incorrect.'
    end
end
