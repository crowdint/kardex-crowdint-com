require 'spec_helper'

feature 'Home' do
  background { visit root_path }

  # FIXME asap after DEMO
  xscenario 'User can see welcome message' do
    expect(page).to have_content 'WELCOME TO KARDEX'
  end

  xscenario 'User can sign in' do
    click_link 'Sign in'
    login_with_oauth
    expect(page).to have_content 'Biography'
  end
end
