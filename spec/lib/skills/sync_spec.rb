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

  describe '.create_skill' do
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
end
