require 'spec_helper'

describe BadgeUser do
  let(:badge_user) { Fabricate.build(:badge_user) }

  describe 'relationships' do
    it { expect(badge_user).to belong_to(:user) }
    it { expect(badge_user).to belong_to(:badge) }
  end
end
