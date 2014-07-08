require 'spec_helper'

describe BadgesHelper do
  let!(:current_user) { Fabricate :user }
  let!(:badge_1) { Fabricate :badge }
  let!(:badge_2) { Fabricate :badge, name: 'pump' }

  describe '#badge_totals' do
    it 'returns the proper amount of badge' do
      current_user.badges << badge_1
      @badges = BadgesEngine::Badge.all
      expect(helper.badge_totals current_user).to eq '1/2'
    end
  end

  describe '#current_badge' do
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

  describe '#owned_badge?' do
    it 'returns the class name if the badge belongs to the user' do
      current_user.badges << badge_1
      allow(helper).to receive(:current_user).and_return(current_user)
      expect(helper.owned_badge? badge_1).to eq 'search-earned-ico'
    end
    it 'returns nil if the badge belongs to the user' do
      allow(helper).to receive(:current_user).and_return(current_user)
      expect(helper.owned_badge? badge_1).to eq nil
    end
  end
end
