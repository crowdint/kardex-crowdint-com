require 'spec_helper'

describe UsersHelper do
  describe '#get_skills' do
    before do
      %w(admin design developer).each do |name|
        Fabricate(:skill_type, name: name)
      end
      Fabricate.
        times(1, :skill, skill_type: SkillType.find_by(name: 'developer'))
      Fabricate.
        times(2, :skill, skill_type: SkillType.find_by(name: 'design'))
      Fabricate.
        times(3, :skill, skill_type: SkillType.find_by(name: 'admin'))
    end

    context 'filter by Development' do
      it 'returns all the related skills' do
        expect(helper.get_skills('Development')).to eq(Skill.filter_by_name('developer'))
      end
      it 'returns an array with 1 element' do
        expect(helper.get_skills('Development').size).to eq 1
      end
    end

    context 'filter by Design' do
      it 'returns all the related skills' do
        expect(helper.get_skills('Design')).to eq(Skill.filter_by_name('design'))
      end
      it 'returns an array with 2 elements' do
        expect(helper.get_skills('Design').size).to eq 2
      end
    end

    context 'filter does not match' do
      it 'returns all skills no related with Development and Design' do
        expect(helper.get_skills('admin')).to eq(Skill.filter_by_name('admin'))
      end
      it 'returns an array with 3 element' do
        expect(helper.get_skills('admin').size).to eq 3
      end
    end
  end
end
