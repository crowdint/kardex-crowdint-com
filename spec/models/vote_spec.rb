require 'spec_helper'

describe Vote do
  let!(:vote) { Fabricate.build(:vote) }

  it { expect(vote).to be_valid }

  describe 'relationships' do
    it { expect(vote).to belong_to :votation }
    it { expect(vote).to belong_to :user }
    it { expect(vote).to belong_to(:voted_user).class_name('User') }
  end

  describe 'validations' do
    it { expect(vote).to validate_presence_of :user_id }
    it { expect(vote).to validate_numericality_of :user_id }
    it { expect(vote).to validate_presence_of :voted_user_id }
    it { expect(vote).to validate_numericality_of :voted_user_id }
    it { expect(vote).to validate_presence_of :votation_id }
    it { expect(vote).to validate_numericality_of :votation_id }
  end
end
