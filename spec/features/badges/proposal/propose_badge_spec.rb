require 'spec_helper'

feature 'Propose a badge' do
  let(:user) { User.first }

  background do
    login_with_oauth
    user = User.first
    user.update_attributes(is_admin: true)
    BadgesEngine::Badge.destroy_all
  end

  scenario 'User proposing a badge to another user' do
    visit users_path
    @badge = BadgesEngine::Badge.create!(name: Faker::Lorem.word, description: Faker::Lorem.paragraph, level: Random.rand(4))
    click_link('Show', match: :first)
    click_link 'Propose a Badge'
    select BadgesEngine::Badge.last.name, from: 'Badge'
    select user.name, from: 'User'
    fill_in 'Why', with: 'Because I\'m batman!'
    click_button 'Create Badge proposal'
    expect(page).to have_content 'Badge proposal sent successfully'
  end
end
