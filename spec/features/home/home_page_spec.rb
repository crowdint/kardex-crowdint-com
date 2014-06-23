require 'spec_helper'

feature 'Home' do
  background do
    Capybara.current_driver = :selenium
  end

  scenario 'User can see welcome message' do
    visit root_path
    expect(page).to have_content 'WELCOME TO KARDEX'
  end
end
