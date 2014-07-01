require 'spec_helper'

feature 'Propose a badge' do
  let(:user) { User.first }

  background { login_with_oauth }

  scenario 'proposing a new badge' do
    visit users_path
    click_link 'Show'
    click_link 'Propose a badge'
    fill_in 'Name', with: 'new badge'
    fill_in 'Description', with: 'This is a new badge'
    check user.name
    click_button 'Create Propose badge'
    expect(page).to have_content 'Badge proposal sent successfully'
  end
end
