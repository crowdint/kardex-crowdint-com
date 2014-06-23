require 'spec_helper'

feature 'Propose a badge' do
  let(:badge) { BadgesEngine::Badge.first.name }
  let(:user) { User.first }

  background do
    login_with_oauth
    click_link('Show', match: :first)
  end

  scenario 'User proposing a badge to another user' do
    click_link 'Propose a Badge'
    select badge, from: 'Badge'
    select user.name, from: 'User'
    fill_in 'Why', with: 'Because I\'m batman!'
    click_button 'Create Badge proposal'
    expect(page).to have_content 'Badge proposal sended successfully'
  end
end
