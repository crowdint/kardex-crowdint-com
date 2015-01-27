require 'spec_helper'

feature "User Module Authentication" do
  background do
    login_with_oauth
    Role.create!(name: 'badges admin')
    User.first.roles << Role.first
    login_with_oauth
  end

  scenario "User is able to view his module" do
    visit badges_engine.badges_path
    expect(page).to have_content 'Manage Badges'
  end

  scenario "User is not able to view other module" do
    visit badges_engine.badges_path
    visit workshops_engine.workshops_path
    expect(page).to have_content 'Manage Badges'
    expect(page).not_to have_content 'Manage Workshops'
  end
end
