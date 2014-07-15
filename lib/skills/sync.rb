require 'csv'

module Skills
  class Sync
    CSV_FILE = 'lib/assets/skills.csv'

    def self.create_skills
      create_skill_types
      skills = init_skills
      skills.each do |info|
        create_skill(info)
      end
    end

    def self.create_skill_types
      %w(developer design admin).each do |type|
        SkillType.create!(name: type)
      end
    end

    def self.create_skill(data)
      skill = Skill.new
      skill.name = data['name']
      get_type(skill, data['type'])
      skill.save
    end

    def self.get_type(skill, type)
      case type
      when 'developer'
        skill.skill_type = SkillType.find(1)
      when 'design'
        skill.skill_type = SkillType.find(2)
      else
        skill.skill_type = SkillType.find(3)
      end
    end

    def self.init_skills
      csv_text = File.read(CSV_FILE)
      CSV.parse(csv_text, headers: true)
    end
  end
end
