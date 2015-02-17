class FeedbookEngine::QuestionUserAnswer < ActiveRecord::Base
  self.table_name = 'feedbook_question_user_answers'

  belongs_to :question
  belongs_to :quiz
  belongs_to :user
end
