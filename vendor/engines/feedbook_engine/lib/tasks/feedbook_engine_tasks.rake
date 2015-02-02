namespace :feedbook_engine do
  desc "Load minimum records needed"
  task :load_seeds => :environment do
    FeedbookEngine::Skill.create(name: 'Ruby', category: 'Technical')
    FeedbookEngine::Skill.create(name: 'CSS', category: 'Technical')
    FeedbookEngine::Skill.create(name: 'JS', category: 'Technical')
  end
end

