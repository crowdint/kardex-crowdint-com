namespace :feedbook_engine do
  desc "Load minimum records needed"
  task :load_seeds => :environment do
    puts 'Cleaning old data...'
    FeedbookEngine::Skill.delete_all
    FeedbookEngine::Level.delete_all

    puts 'Loading levels...'
    [ ['None', 0],
      ['Basic', 3],
      ['Intermediate', 5],
      ['Advance', 8],
      ['Expert', 10]
    ].each do |level|
      FeedbookEngine::Level.create(name: level.first, value: level.last)
    end

    puts 'Loading Feedbook skills...'
    {
      rails: %w(rails active_record active_support action_view action_pack railties),
      css: %w(css sass less),
      js: %w(javascript)
    }.each_pair do |key, value|
      value.each do |skill|
        FeedbookEngine::Skill.create(name: skill, category: key, weight: rand(9) + 1, skill_type: 'Technical')
      end
    end

    puts 'Loading Feedbook sample questions...'
    [
      { name: 'Which of the following replaced the Prototype Javascript library in Ruby on Rails as the default javascript library?',
        duration: '60',
        type_question: 'simple',
        skill_id: FeedbookEngine::Skill.find_by_name('rails').id,
        level_id: FeedbookEngine::Level.first.id,
        answers_attributes: [
          { text: 'Jquery' },
          { text: 'Ajax' },
          { text: 'Script.aculo.us' },
          { text: 'ajax-li' }
        ]
      },
      { name: 'If a method #decoupage(n) is described as O(n^2), what does that mean?',
        duration: '60',
        type_question: 'simple',
        skill_id: FeedbookEngine::Skill.find_by_name('rails').id,
        level_id: FeedbookEngine::Level.first.id,
        answers_attributes: [
          { text: 'The fewer number of operations it will perform is n*n' },
          { text: 'The worst case run time is proportional to the size of the square of the method\'s input.' },
          { text: 'The method operates by squaring the input' },
          { text: 'The return value for the method will be the length of the input squared' }
        ]
      }
    ].each do |q|
      FeedbookEngine::Question.create(q)
    end
  end
end
