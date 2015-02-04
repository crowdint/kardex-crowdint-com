namespace :feedbook_engine do
  desc "Load minimum records needed"
  task :load_seeds => :environment do
    puts 'Cleaning old data...'
    FeedbookEngine::Skill.delete_all

    puts 'Loading Feedbook skills...'
    FeedbookEngine::Skill.create(name: 'Ruby', category: 'Technical')
    rails = FeedbookEngine::Skill.create(name: 'Rails', category: 'Technical')
    FeedbookEngine::Skill.create(name: 'CSS', category: 'Technical')
    FeedbookEngine::Skill.create(name: 'JS', category: 'Technical')

    questions = [
      { name: 'Which of the following replaced the Prototype Javascript library in Ruby on Rails as the default javascript library?',
        duration: '00:01',
        type_question: 'simple',
        skill_id: rails.id,
        level_id: 0,
        answers_attributes: [
          { text: 'Jquery' },
          { text: 'Ajax' },
          { text: 'Script.aculo.us' },
          { text: 'ajax-li' }
        ]
      },
      { name: 'If a method #decoupage(n) is described as O(n^2), what does that mean?',
        duration: '00:01',
        type_question: 'simple',
        skill_id: rails.id,
        level_id: 0,
        answers_attributes: [
          { text: 'The fewer number of operations it will perform is n*n' },
          { text: 'The worst case run time is proportional to the size of the square of the method\'s input.' },
          { text: 'The method operates by squaring the input' },
          { text: 'The return value for the method will be the length of the input squared' }
        ]
      }
    ]

    questions.each do |q|
      FeedbookEngine::Question.create(q)
    end
  end
end

