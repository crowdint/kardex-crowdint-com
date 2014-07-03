require 'spec_helper'

feature 'Home' do
  background { visit root_path }

  scenario 'User can see welcome message' do
    expect(page).to have_content 'Welcome to'
  end

  scenario 'User can sign in' do
    login_with_oauth
    click_link 'SIGN IN'
    expect(page).to have_content 'Biography'
  end

  scenario 'User click on logo from landing page without login' do
    click_link('SIGN IN')
    expect(page).to have_content 'Welcome to'
  end

  scenario 'User click on logo from landing page logged in' do
    login_with_oauth
    click_link('SIGN IN')
    expect(page).to have_content 'Biography'
  end
end
