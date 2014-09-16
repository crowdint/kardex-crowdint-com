require 'spec_helper'

describe Role do
  let!(:role) { Fabricate.build(:role) }

  it { expect(role).to be_valid }

  describe 'relationships' do
    it { expect(role).to have_and_belong_to_many(:users) }
  end
end
