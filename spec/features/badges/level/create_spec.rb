require 'spec_helper'

feature 'Level' do
  let!(:badge) { Fabricate(:badge) }

  background { login_with_oauth }

  xscenario 'Creating a level for a badge' do
    visit admin_levels_path
    click_link 'New level'
    select badge.name, from: 'Badge'
    fill_in 'Tier', with: Random.rand(4)
    fill_in 'Badge alias', with: Faker::Lorem.word
    click_button 'Create Level'
    expect(page).to have_content 'level was successfully created.'
    expect(page).to have_content 'Tier'
    expect(page).to have_content 'Alias'
  end
end
