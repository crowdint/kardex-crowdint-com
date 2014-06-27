require 'spec_helper'

feature 'checking a nomine list' do
  let!(:user1) { Fabricate :user }
  let!(:user2) { Fabricate :user }
  let!(:badge) { Fabricate :badge }
  let!(:nominee_list) do
    Fabricate :nominee_list, badge: badge, user_ids:
      [user1.id, user2.id]
  end

  background { login_with_oauth }

  scenario 'viewing nominee list index' do
    visit user_path(user1)
    click_link 'Nominate list'
    expect(page).to have_content 'Nominee lists'
    expect(page).to have_link 'Check list'
    expect(page).to have_content badge.name
  end

  scenario 'viewing a nomine list' do
    visit nominee_lists_path
    click_link 'Check list'
    expect(page).to have_content badge.name
    nominee_list.users.each do |user|
      expect(page).to have_content user.name
      expect(page).to have_content user.email
    end
  end
end
