namespace :feedbook_engine do
  desc "Load minimum records needed"
  task :load_seeds => :environment do
    puts 'Cleaning old data...'
    FeedbookEngine::Skill.delete_all
    FeedbookEngine::Level.delete_all

    levels = JSON.parse(File.read("#{Rails.root}/vendor/engines/feedbook_engine/db/seeds/levels.json"))
    puts 'Loading levels...'
    levels.each do |level|
      FeedbookEngine::Level.create(level)
    end

    skills = JSON.parse(File.read("#{Rails.root}/vendor/engines/feedbook_engine/db/seeds/skills.json"))
    puts 'Loading Feedbook skills...'
    skills.each do |skill|
      FeedbookEngine::Skill.create(skill)
    end

    questions = JSON.parse(File.read("#{Rails.root}/vendor/engines/feedbook_engine/db/seeds/questions/rails.json"))
    puts 'Loading Feedbook sample questions...'
    questions.each do |question|
      FeedbookEngine::Question.create(question)
    end
  end
end
