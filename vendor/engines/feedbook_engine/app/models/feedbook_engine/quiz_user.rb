class FeedbookEngine::QuizUser < ActiveRecord::Base
  self.table_name = 'feedbook_quiz_users'

  belongs_to :quiz

  def self.generate_user_quiz user_id, quiz_id
    quiz = self.new
    quiz.user_id = user_id
    quiz.quiz_id = quiz_id
    quiz.uuid = SecureRandom.urlsafe_base64

    # create_table "feedbook_quiz_users", force: true do |t|
    #   t.integer  "user_id"
    #   t.integer  "quiz_id"
    #   t.text     "feedback"
    #   t.string   "state"
    #   t.string   "uuid"
    #   t.integer  "attempt"
    #   t.integer  "time_limit"
    #   t.integer  "time_used"
    #   t.datetime "started_at"
    #   t.datetime "ended_at"
    #   t.text     "questions_pool"
    #   t.datetime "created_at"
    #   t.datetime "updated_at"
      # end
  end

  def self.build_question_pool(quiz_id)
    user_quiz = self.new
    user_quiz.quiz_id = quiz_id
    user_quiz.uuid = SecureRandom.urlsafe_base64

    questions = user_quiz.send :questions_generator

    binding.pry

    # skills: rails(active_record, active_support, action_view, action_pack, railties)
    # skills_wighted: 3, 1, 2, 3, 1
    # distribution: 20-60-20-0
    # duration: 1200   (20 minutes)

    # 1. define time for each skill
    # 2. define questions pool from distribution
    # 3. use exact coing algorithm to choose questions
    # 4. build quiz
  end

  private

  # Build the rules for the quiz
  def generate_distribution
    skill_names = quiz.distribution_skills.split(',').map(&:downcase)
    skills = FeedbookEngine::Skill.with_tag(skill_names)
    skills_accumulative = skills.sum(:weight)
    {
      skills: skills_distributions(skills, skills_accumulative),
      levels: levels_distribution(quiz.distribution_rules)
    }
  end

  # Return the distribution of skills weighted and the time the quiz should take on each section
  def skills_distributions(skills, skills_accumulative)
    skills.map do |skill|
      time = (skill.weight * quiz.duration) / skills_accumulative
      {
        skill: skill,
        questions_pool: skill.questions.group_by(&:level_id),
        weight: (skill.weight * 100) / skills_accumulative,
        duration: time,
        remaining_duration: time
      }
    end
  end

  # Return the levels and time the quiz should take on certain questions
  def levels_distribution(distribution_rules)
    levels = distribution_rules.split('-')
    FeedbookEngine::Level.with_level.order_by_value.map.with_index do |level, index|
      time = quiz.duration * (levels[index].to_i/100.0)
      {
        id: level.id,
        name: level.name,
        value: levels[index].to_i,
        duration: time,
        remaining_duration: time
      }
    end
  end

  # Iterate on levels and skills to get random questions that match the criterial
  # TOOD: Make it more modular
  def questions_generator
    questions = []
    rules = generate_distribution
    rules[:levels].each do |level|
      no_changes = 0
      time_limit = 30
      skills_shuffled = rules[:skills].shuffle

      puts "Starting level: #{level[:name]} [#{level[:duration]}]"
      loop do
        # Mix skills to start picking questions
        skills_shuffled.each do |skill|
          puts "  - Looking questions for: #{skill[:skill].name} within #{skill[:remaining_duration]} seconds"
          if level[:remaining_duration] >= time_limit && skill[:remaining_duration] >= time_limit
            # Look for all the questions that match the time available and are not selected already
            pool = skill[:questions_pool][level[:id]]
            pool_filtered = pool && pool.select{|q| q.duration <= skill[:remaining_duration] && q.duration <= level[:remaining_duration] && !questions.map(&:id).include?(q.id) }

            puts "    + filtering questions with #{pool_filtered.count} matches from #{pool.count}" if pool.present?
            if pool_filtered.present?
              puts "    + question found"
              # Pick a random question
              question = pool_filtered.sample
              questions.push(question)

              # Substract duration from remaining time
              no_changes = 0
              level[:remaining_duration] -= question.duration
              skill[:remaining_duration] -= question.duration
            end
          end
        end

        break if level[:remaining_duration] < 30
        break if no_changes == 1
        no_changes += 1
        puts "  ** Next Iteration **"
      end
    end
    questions
  end


end
