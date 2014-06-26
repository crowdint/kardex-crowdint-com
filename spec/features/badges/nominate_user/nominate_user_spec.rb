require 'spec_helper'

feature 'Nominate user a badge' do
  let(:user) { User.first }
  let!(:badge) { Fabricate(:badge) }

  background { login_with_oauth }

  scenario 'User proposing a badge to another user' do
    visit users_path
    click_link('Show', match: :first)
    click_link 'Nominate a user'
    select badge.name, from: 'Badge'
    select user.name, from: 'User'
    fill_in 'Why', with: 'Because I\'m batman!'
    click_button 'Create Nominee user'
    expect(page).to have_content 'Nomination sent successfully'
  end
end
