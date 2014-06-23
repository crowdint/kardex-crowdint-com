require 'spec_helper'

describe BadgeProposal do
  let!(:badge_proposal) { Fabricate.build(:badge_proposal) }

  it { expect(badge_proposal).to be_valid }

  describe 'relationships' do
    it { expect(badge_proposal).to belong_to(:user) }
    it { expect(badge_proposal).to belong_to(:badge) }
  end

  describe 'validations' do
    it { expect(badge_proposal).to validate_presence_of(:badge_id) }
    it { expect(badge_proposal).to validate_presence_of(:user_id) }
    it { expect(badge_proposal).to validate_presence_of(:why) }
  end
end
