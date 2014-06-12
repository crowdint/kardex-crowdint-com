require 'spec_helper'

feature 'Viewing info page' do
  let(:user) { Fabricate(:user) }

  background do
    visit root_path
    OmniAuth.config.mock_auth[:google] = {
      provider: 'google',
      uid: user.
    }
  end

  scenario 'Checking user info' do
  end
end
