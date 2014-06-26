require 'spec_helper'

describe NomineeUser do
  let!(:nominee_user) { Fabricate.build(:nominee_user) }

  it { expect(nominee_user).to be_valid }

  describe 'relationships' do
    it { expect(nominee_user).to belong_to(:user) }
    it { expect(nominee_user).to belong_to(:badge) }
  end

  describe 'validations' do
    it { expect(nominee_user).to validate_presence_of(:badge_id) }
    it { expect(nominee_user).to validate_presence_of(:user_id) }
    it { expect(nominee_user).to validate_presence_of(:why) }
  end
end
