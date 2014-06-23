require 'spec_helper'

feature 'Propose a badge' do
  let(:user) { User.first }

  background do
    login_with_oauth
  end

  # FIXME: This test actually it does not pass, the reason can be found here:
  # http://stackoverflow.com/questions/18423104/created-data-did-not-appear-when-testing
  xscenario 'User proposing a badge to another user' do
    @badge = BadgesEngine::Badge.create! name: 'Dummy', level: Random.rand(4)
    click_link 'Sign in'
    click_link 'Show'
    click_link 'Propose a Badge'
    select @badge.name, from: 'Badge'
    select user.name, from: 'User'
    fill_in 'Why', with: 'Because I\'m batman!'
    click_button 'Create Badge proposal'
    expect(page).to have_content 'Badge proposal sended successfully'
  end
end
