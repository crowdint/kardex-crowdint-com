require 'spec_helper'

describe NomineeUsersHelper do
  describe '#user_name' do
    context 'user is not nil' do
      let(:user) { Fabricate.build :user }

      it { expect(helper.user_name user).to eq user.name }
    end

    context 'user is nil' do
      it { expect(helper.user_name nil).to eq nil }
    end
  end

  describe '#badge_name' do
    context 'badge is not nil' do
      let(:badge) { Fabricate.build :badge }

      it { expect(helper.badge_name badge).to eq badge.name }
    end

    context 'badge is nil' do
      it { expect(helper.badge_name nil).to eq nil }
    end
  end
end
