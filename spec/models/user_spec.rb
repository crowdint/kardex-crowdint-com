require 'spec_helper'

describe User do
  let!(:user) { Fabricate.build(:user) }

  it { expect(user).to be_valid }

  describe 'relationships' do
    it { expect(user).to have_and_belong_to_many(:nominee_lists) }
    it { expect(user).to have_and_belong_to_many(:propose_badges) }
    it { expect(user).to have_and_belong_to_many(:badges) }
    it { expect(user).to have_and_belong_to_many(:skills) }
    it { expect(user).to have_and_belong_to_many(:roles) }
    it { expect(user).to have_many(:nominee_users) }
    it { expect(user).to have_many(:badge_users) }
  end

  describe 'validations' do
    it { expect(user).not_to validate_presence_of(:name) }
    it { expect(user).not_to validate_presence_of(:email) }
    it { expect(user).not_to validate_presence_of(:password) }
    it { expect(user).not_to validate_presence_of(:department) }
  end

  describe '#find_badge_assignment' do
    let!(:current_user) { Fabricate :user }
    let!(:badge) { Fabricate :badge }

    it 'returns a badge_user record that match with badge and user' do
      badge_user = Fabricate :badge_user, user: user, badge: badge
      expect(user.find_badge_assignment(badge)).to eq badge_user
    end

    it 'returns nil if badge_user does not match with badge and user' do
      badge_user = Fabricate :badge_user, user: user
      expect(user.find_badge_assignment(badge)).to eq nil
    end
  end

  describe '#admin_module?' do
    let!(:current_user) { Fabricate :user }
    let!(:role) { Fabricate :role }
    let!(:role2) { Fabricate :role }

    it 'returns true if the user is admin of the given module' do
      current_user.roles << role
      expect(current_user.admin_module?(role.name.sub!('admin_', ''))
            ).to eq true
    end

    it 'returns true if the user is admin of the given module' do
      expect(current_user.admin_module?(role2.name)).to eq false
    end
  end
end
