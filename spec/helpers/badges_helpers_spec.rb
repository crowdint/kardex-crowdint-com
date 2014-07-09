require 'spec_helper'

describe BadgesHelper do
  let!(:current_user) { Fabricate :user }
  let!(:badge1) { Fabricate :badge }
  let!(:badge2) { Fabricate :badge, name: 'pump' }

  describe '#badge_totals' do
    it 'returns the proper amount of badge' do
      current_user.badges << badge1
      @badges = BadgesEngine::Badge.all
      expect(helper.badge_totals current_user).to eq '1/2'
    end
  end
end
