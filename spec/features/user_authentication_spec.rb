require 'spec_helper'

feature "User Authentication" do
  background do
    login_with_oauth
  end

  scenario "User is able to signing successfully" do
    expect(page).to have_content 'Users'
  end
end
