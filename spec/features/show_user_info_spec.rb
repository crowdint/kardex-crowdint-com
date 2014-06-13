require 'spec_helper'

feature "Signing in" do

  let!(:user) { Fabricate(:user) }

  background do
    Capybara.current_driver = :selenium
    visit user_omniauth_authorize_path(:google_apps)
  end

  scenario "Signing in with incorrect credentials" do
    # PENDING
    #fill_in "Email", with: 'test@crowdint.com'
    #fill_in "Password", with: 'test'
    #click_button 'Sign in'
    #expect(page).to have_content 'The email or password you entered is incorrect.'
  end

  scenario "Signing in with correct credentials" do
    # PENDING
    #@auth_hash = double(info: { email: user.email, name: user.name })
    #@request = stub(env: { 'omniauth.auth' => @auth_hash })
    #user.stub(:request).and_return(@request)
  end
end
