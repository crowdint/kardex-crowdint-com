require 'spec_helper'

describe BadgesEngine::Badge do
  let(:badge) { build(:badge) }

  it { expect(badge).to be_valid }

  context 'validations' do
    it { expect(badge).to validate_presence_of(:name) }
    it { expect(badge).to validate_uniqueness_of(:name) }
  end

  context 'relationships' do
    it { expect(badge).to belong_to(:award) }
    it { expect(badge).to belong_to(:value) }
    it { expect(badge).to have_many(:levels) }
  end
end
