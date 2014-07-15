require 'spec_helper'

describe UsersHelper do
  describe '#get_skills' do
    before do
      Fabricate.times(3, :skill_type)
      Fabricate.times(1, :skill, skill_type: SkillType.all[0])
      Fabricate.times(2, :skill, skill_type: SkillType.all[1])
      Fabricate.times(3, :skill, skill_type: SkillType.all[2])
    end

    context 'filter by Development' do
      it 'returns all the related skills' do
        @user = Fabricate.build(:user, department: 'Development')
        expect(helper.get_skills).to eq(
          Skill.where skill_type: SkillType.all[0])
      end
      it 'returns an array with 1 element' do
        @user = Fabricate.build(:user, department: 'Development')
        expect(helper.get_skills.size).to eq 1
      end
    end

    context 'filter by Design' do
      it 'returns all the related skills' do
        @user = Fabricate.build(:user, department: 'Design')
        expect(helper.get_skills).to eq(
          Skill.where skill_type: SkillType.all[1])
      end
      it 'returns an array with 2 elements' do
        @user = Fabricate.build(:user, department: 'Design')
        expect(helper.get_skills.size).to eq 2
      end
    end

    context 'filter does not match' do
      it 'returns all skills no related with Development and Design' do
        @user = Fabricate.build(:user, department: 'XXX')
        expect(helper.get_skills).to eq(
          Skill.where skill_type: SkillType.all[2])
      end
      it 'returns an array with 3 element' do
        @user = Fabricate.build(:user, department: 'XXX')
        expect(helper.get_skills.size).to eq 3
      end
    end
  end
end
