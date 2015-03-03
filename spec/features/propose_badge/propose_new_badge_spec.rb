require 'spec_helper'

feature 'Propose a badge' do
  let(:user) { User.first }
  let!(:admin) { Fabricate :admin }

  background { login_with_oauth }

  scenario 'proposing a new badge' do
    visit badges_engine.badges_path
    click_link('Propose a badge', match: :first)
    fill_in 'Name', with: 'new badge'
    fill_in 'Description', with: 'This is a new badge'
    click_button 'Create'
    expect(page).to have_content 'Badge proposal sent successfully'
  end
end
