class FeedbookEngine::FeedbookQuestion < ActiveRecord::Base
  self.table_name = 'feedbook_questions'

  # belongs_to :level
  has_many :answers, class_name: 'FeedbookAnswer'
  accepts_nested_attributes_for :answers
end
