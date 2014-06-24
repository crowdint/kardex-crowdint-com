require 'spec_helper'

feature 'Home' do
  background { visit root_path }

  scenario 'User can see welcome message' do
    expect(page).to have_content 'WELCOME TO KARDEX'
  end

  scenario 'User can sign in' do
    login_with_oauth
    click_link 'Sign in'
    expect(page).to have_content 'Biography'
  end
end
