require 'spec_helper'

describe ProposeBadge do
  let!(:propose_badge) { Fabricate.build(:propose_badge) }

  it { expect(propose_badge).to be_valid }

  describe 'validations' do
    it { expect(propose_badge).to validate_presence_of(:name) }
  end

  describe 'relationships' do
    it { expect(propose_badge).to belong_to(:value) }
    it { expect(propose_badge).to have_and_belong_to_many(:users) }
  end
end
