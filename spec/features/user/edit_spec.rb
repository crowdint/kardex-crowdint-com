require 'spec_helper'

feature "Edit profile information" do
  before do
    %w(admin design developer).each do
      |name| Fabricate(:skill_type, name: name)
    end
  end

  context 'User path' do
    background do
      visit root_path
      login_with_oauth
      click_link 'Sign in'
      click_link 'Account'
    end

    scenario "Users can edit profile information" do
      expect(page).to have_content 'Edit user info'
      fill_in 'Bio', with: 'Lorem ipsum arkham city'
      click_button 'Save'
      expect(page).to have_content 'Summary'
      expect(page).to have_content 'Lorem ipsum arkham city'
    end


    scenario "Users can back to Users show from edit profile section" do
      click_link 'Back to Dashboard'
      expect(page).to have_content 'Account'
    end
  end

  context 'Admin path' do
    background do
      login_with_oauth
      User.first.update_attributes(is_admin: true)
      click_link 'Sign in'
      click_link 'Account'
    end

    scenario "User admin can back to Admin section" do
      User.first.update_attributes(is_admin: true)
      click_link 'Back to Admin'
      expect(page).to have_content 'Manage Users'
    end
  end
end
