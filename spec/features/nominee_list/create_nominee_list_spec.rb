require 'spec_helper'

feature 'Create a nominee list' do
  let!(:badge) { Fabricate(:badge) }

  background do
    login_with_oauth
    User.first.update_attributes(is_admin: true)
    login_with_oauth
  end

  xscenario 'creating a nominee list' do
    user = User.first
    visit admin_root_path
    click_link 'Create nominee list'
    select badge.name, from: 'Badge'
    check user.name
    click_button 'Create Nominee list'
    expect(page).to have_content 'Nominee list created successfully'
  end
end
