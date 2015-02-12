class FeedbookEngine::QuizUsersQuestion < ActiveRecord::Base
  self.table_name = 'feedbook_quiz_users_questions'

  belongs_to :question
  belongs_to :quiz_user
end
