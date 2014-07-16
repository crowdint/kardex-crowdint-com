require 'spec_helper'

describe Skill do
  let(:skill) { Fabricate.build :skill }

  describe 'relationships' do
    it { expect(skill).to have_and_belong_to_many(:users) }
    it { expect(skill).to belong_to(:skill_type) }
  end

  it { expect(skill).not_to validate_presence_of(:name) }
end
