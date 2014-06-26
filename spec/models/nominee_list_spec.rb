require 'spec_helper'

describe NomineeList do
  let(:nominee_list) { Fabricate(:nominee_list) }

  it { expect(nominee_list).to be_valid }

  describe 'relationships' do
    it { expect(nominee_list).to have_and_belong_to_many(:users) }
  end

  describe 'validations' do
    it { expect(nominee_list).to validate_presence_of(:badge_id) }
  end
end
