require 'spec_helper'

describe User do
  let!(:user) { Fabricate.build(:user) }

  it { expect(user).to be_valid }

  describe 'relationships' do
    it { expect(user).to have_and_belong_to_many(:nominee_lists) }
    it { expect(user).to have_and_belong_to_many(:propose_badges) }
    it { expect(user).to have_and_belong_to_many(:badges) }
    it { expect(user).to belong_to(:position) }
    it { expect(user).to have_and_belong_to_many(:skills) }
    it { expect(user).to have_many(:nominee_users) }
  end

  describe 'validations' do
    it { expect(user).not_to validate_presence_of(:name) }
    it { expect(user).not_to validate_presence_of(:email) }
    it { expect(user).not_to validate_presence_of(:password) }
    it { expect(user).not_to validate_presence_of(:department) }
  end
end
