require 'spec_helper'

describe Candidate do
  let!(:vote_event) { Fabricate :vote_event }
  let!(:candidate) { Fabricate.build :candidate, vote_event_id: vote_event.id }

  it { expect(candidate).to be_valid }
  describe 'relationships' do
    it { expect(candidate).to belong_to :vote_event }
    it { expect(candidate).to have_and_belong_to_many :users }
  end

end
