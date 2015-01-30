class FeedbookEngine::Question < ActiveRecord::Base
  self.table_name = 'feedbook_questions'

  # belongs_to :level
  has_many :answers
  accepts_nested_attributes_for :answers, :reject_if => :all_blank, :allow_destroy => true
end
