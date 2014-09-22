require 'spec_helper'

describe Votation do
  let!(:votation) { Fabricate.build(:votation) }

  it { expect(votation).to be_valid }

  describe 'relationships' do
    it { expect(votation).to belong_to(:badge) }
    it { expect(votation).to have_many(:votes).dependent(:destroy) }
    it { expect(votation).to have_many(:users).through(:votes) }
  end

  describe 'validations' do
    it { expect(votation).to validate_presence_of :badge_id }
  end

  context '#open_votation_process' do
    it 'opens the votation' do
      votation.save
      expect(votation.is_open).to be_true
    end
  end

  context '#current_votation?' do
    let!(:votation_2) { Fabricate.build(:votation) }

    context 'valid case' do
      it { expect(votation.save).to be_true }
    end

    context 'invalid case' do
      before { votation.save }

      it 'thows an error' do
        votation_2.save
        expect(votation_2.errors.full_messages).
          to include('Created at You already create this votation')
      end

      context 'if exists for this month' do
        it { expect(votation_2.save).to be_false }
      end

      context 'if exists for this badge' do
        it { expect(votation_2.save).to be_false }
      end

      context 'if exists for this month and badge' do
        it { expect(votation_2.save).to be_false }
      end
    end
  end
end
