require 'spec_helper'

describe VoteEvent do
  let!(:vote_event) { Fabricate.build(:vote_event) }

  it { expect(vote_event).to be_valid }

  describe 'relationships' do
    it { expect(vote_event).to belong_to(:badge) }
    it { expect(vote_event).to have_many(:votes).dependent(:destroy) }
    it { expect(vote_event).to have_many(:users).through(:votes) }
  end

  describe 'validations' do
    it { expect(vote_event).to validate_presence_of :badge_id }
  end

  it { expect(vote_event).to accept_nested_attributes_for :candidate }

  context '#open_vote_event_process' do
    it 'opens the vote_event' do
      vote_event.save
      expect(vote_event.is_open).to be_true
    end
  end

  context '#current_vote_event?' do
    let!(:vote_event_2) { Fabricate.build(:vote_event) }

    context 'valid case' do
      it { expect(vote_event.save).to be_true }
    end

    context 'invalid case' do
      before { vote_event.save }

      it 'thows an error' do
        vote_event_2.save
        expect(vote_event_2.errors.full_messages).
          to include('Created at You already create this votation')
      end

      context 'if exists for this month' do
        it { expect(vote_event_2.save).to be_false }
      end

      context 'if exists for this badge' do
        it { expect(vote_event_2.save).to be_false }
      end

      context 'if exists for this month and badge' do
        it { expect(vote_event_2.save).to be_false }
      end
    end
  end
end
