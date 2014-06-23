require 'spec_helper'

feature 'Home' do
  scenario 'User can see welcome message' do
    visit root_path
    expect(page).to have_content 'WELCOME TO KARDEX'
  end
end
