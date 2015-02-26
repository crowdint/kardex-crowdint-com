# Join table for link Questions to UserQuiz
class FeedbookEngine::UsersQuestion < ActiveRecord::Base
  self.table_name = 'feedbook_quiz_users_questions'

  belongs_to :question
  belongs_to :user_quiz
  has_many :user_answers

  accepts_nested_attributes_for :user_answers

  scope :answered, -> { where(answered: true) }
  scope :not_answered, -> { where(answered: false) }
end
