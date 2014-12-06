require 'spec_helper'

describe WorkshopsEngine::Workshop do
  let(:workshop) { Fabricate.build(:workshop) }

  it { expect(workshop).to be_valid }

  context 'validations' do
    it { expect(workshop).to validate_presence_of(:title) }
    it { expect(workshop).to validate_presence_of(:description) }
    it { expect(workshop).to validate_presence_of(:date_and_time) }
  end

  context 'relationships' do
    it { expect(workshop).to belong_to(:user) }
  end
end

