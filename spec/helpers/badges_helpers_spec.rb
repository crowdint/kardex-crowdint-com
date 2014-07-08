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

  describe '#current_badge' do
    let(:badge_1) { Fabricate.build :badge, name: 'badge 1' }
    let(:badge_2) { Fabricate.build :badge, name: 'badge 2' }

    it 'returns current badge class if badges are equal' do
      @badge = badge_1
      expect(helper.current_badge(badge_1)).
        to eq 'row badge-sidebar-current-badge'
    end
    it 'returns normal badge class if badges are not equal' do
      @badge = badge_1
      expect(helper.current_badge(badge_2)).
        to eq 'row badge-sidebar-badge'
    end
  end
end
