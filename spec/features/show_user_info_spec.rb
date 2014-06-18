require 'spec_helper'

feature "Signing in" do
  background do
    Capybara.current_driver = :selenium
    login_with_oauth
  end

  scenario "Signing in with correct credentials" do
    expect(page).to have_content('Users')
  end
end
