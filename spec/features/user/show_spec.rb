require 'spec_helper'

feature 'User profile information' do
  let(:user) { User.first }
  let(:badge) { Fabricate :badge }

  background do
    visit root_path
    login_with_oauth
    click_link 'Sign in'
  end

  scenario 'Users can see profile information' do
    expect(page).to have_content 'Summary'
    expect(page).to have_content 'Skills'
    expect(page).to have_content 'Account'
    expect(page).to have_content 'Position'
  end

  scenario 'Users can edit profile information from profile section' do
    click_link 'Account'
    expect(page).to have_content 'Edit user'
    fill_in 'Bio', with: 'Lorem ipsum arkham city'
    click_button 'Update User'
    expect(page).to have_content 'Summary'
    expect(page).to have_content user.bio
  end

  scenario 'User without badges can see a message' do
    expect(page).to have_content 'You don\'t have badges... yet!'
  end

  scenario 'User with badges can see your badges' do
    user.badges << badge
    visit user_path(user)
    expect(page).to have_content badge.name
  end
end
