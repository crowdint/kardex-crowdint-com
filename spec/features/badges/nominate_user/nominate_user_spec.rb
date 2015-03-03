require 'spec_helper'

feature 'Nominate user a badge' do
  let(:user) { User.first }
  let!(:admin) { Fabricate :admin }
  let!(:badge) { Fabricate(:badge) }

  background { login_with_oauth }

  scenario 'User proposing a badge to another user' do
    visit badges_engine.badges_path
    click_link('Nominate someone', match: :first)
    select badge.name, from: 'Choose a Badge'
    select user.name, from: 'Who deserves it'
    fill_in 'Why', with: 'Because I\'m batman!'
    click_button 'Nominate'
    expect(page).to have_content 'Nomination sent successfully'
  end
end
