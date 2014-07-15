require 'csv'

module Skills
  class Sync
    CSV_FILE = 'lib/assets/skills.csv'

    def self.create_skills
      skills = init_skills
      skills.each do |info|
        create_skill(info)
      end
    end

    def self.create_skill(data)
      skill = Skill.new
      skill.name = data['name']
      skill.save
    end

    def self.init_skills
      csv_text = File.read(CSV_FILE)
      CSV.parse(csv_text, headers: true)
    end
  end
end
