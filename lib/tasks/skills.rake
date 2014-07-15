require 'skills/sync'

namespace :skills do
  desc 'Get all skills'
  task create: :environment do
    Skills::Sync.create_skills
  end

  desc 'Destroy all skills'
  task destroy: :environment do
    Skill.destroy_all
    SkillType.destroy_all
  end
end
