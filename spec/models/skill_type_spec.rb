require 'spec_helper'

describe SkillType do
  let(:skill_type) { Fabricate.build :skill_type }

  it { expect(skill_type).to be_valid }

  describe 'relationships' do
    it { expect(skill_type).to have_many(:skills) }
  end
end
