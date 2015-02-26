# User quiz, from a Quiz relation
class FeedbookEngine::UserQuiz < ActiveRecord::Base
  self.table_name = 'feedbook_quiz_users'

  belongs_to :quiz
  belongs_to :user
  has_many :users_questions, foreign_key: :quiz_user_id
  has_many :questions, through: :users_questions
  has_many :user_answers

  def self.generate_user_quiz(user_id, quiz_id)
    user_quiz = self.new
    user_quiz.quiz_id = quiz_id
    user_quiz.user_id = user_id
    user_quiz.uuid = SecureRandom.urlsafe_base64
    user_quiz.state = 'active'

    questions = user_quiz.send :questions_generator
    user_quiz.question_ids = questions.map(&:id)
    user_quiz.save
    user_quiz
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
