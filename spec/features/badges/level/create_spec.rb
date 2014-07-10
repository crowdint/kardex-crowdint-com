require 'spec_helper'

feature 'Level' do
  let!(:badge) { Fabricate(:badge) }

  background do
    login_with_oauth
    User.first.update_attributes(is_admin: true)
    click_link 'Sign in'
    click_link 'Admin Power'
  end

  scenario 'Creating a level for a badge' do
    expect(page).to have_content 'Manage Users'
    click_link 'Badge'
    expect(page).to have_content 'Manage Badges'
    click_link 'Create a Badge'
    select 1, from: 'badge_levels_attributes_0_tier'
    fill_in 'badge_levels_attributes_0_badge_alias', with: Faker::Lorem.word
    click_link '+ Add level'
    select 2, from: 'badge_levels_attributes_0_tier'
    fill_in 'badge_levels_attributes_0_badge_alias', with: Faker::Lorem.word
    fill_in 'Name', with: Faker::Lorem.word
    click_button 'Save'
    expect(page).to have_content 'Path: 2'
  end
end
