# User answers to Questions linked on UserQuiz
class FeedbookEngine::UserAnswer < ActiveRecord::Base
  self.table_name = 'feedbook_question_user_answers'

  belongs_to :user_quiz
  belongs_to :users_question, primary_key: :question_id
  belongs_to :answer
end
