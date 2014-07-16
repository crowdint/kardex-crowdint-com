require 'spec_helper'
require 'skills/sync'

describe Skills::Sync do
  it { expect(Skills::Sync::CSV_FILE).to eq 'lib/assets/skills.csv' }

  describe '.init_skills' do
    let(:skills) { skills = Skills::Sync.init_skills }

    it 'returns a csv table object' do
      expect(skills).to be_a CSV::Table
    end
    it 'returns a csv table with 45 rows' do
      expect(skills.length).to eq 45
    end
  end

  describe '.create_skill_types' do
    before { Skills::Sync.create_skill_types }

    it 'Creates 3 SkillType objects' do
      expect(SkillType.count).to eq 3
    end
    it 'Creates a Skilltype with \'developer\' name' do
      expect(SkillType.find_by name: 'developer').to eq SkillType.first
    end
    it 'Creates a Skilltype with \'design\' name' do
      expect(SkillType.find_by name: 'design').to eq SkillType.all[1]
    end
    it 'Creates a Skilltype with \'admin\' name' do
      expect(SkillType.find_by name: 'admin').to eq SkillType.last
    end
  end

  describe '.create_skill' do
    let!(:skill_type) { Fabricate :skill_type, id: 1 }
    let!(:data) { CSV::Row.new(
      ['name', 'type'], ['Pascal', 'developer'], header_row: false) }

    it 'creates a saved instance of Skill' do
      expect(Skills::Sync.create_skill(data)).to eq true
    end
    it 'has the correct name' do
      Skills::Sync.create_skill(data)
      skill = Skill.last
      expect(skill.name).to eq 'Pascal'
    end
  end

  describe '.get_type' do
    let!(:skill_type) { Fabricate :skill_type, id: 1 }
    let(:skill) { Fabricate.build :skill }

    it 'assigns the correct skill_type to skill' do
      Skills::Sync.get_type(skill, 'developer')
      expect(skill.skill_type).to eq skill_type
    end
  end
end
