class FeedbookEngine::Question < ActiveRecord::Base
  self.table_name = 'feedbook_questions'

  belongs_to :skill
  has_many :answers

  accepts_nested_attributes_for :answers, :reject_if => :all_blank, :allow_destroy => true

  LEVELS = [
    ['None', 0],
    ['Basic', 3],
    ['Intermediate', 5],
    ['Advance', 8],
    ['Expert', 10]
  ]

  TYPES = [
    ['Simple', 'simple'],
    ['Multiple', 'multiple'],
    ['Open text', 'open']
  ]

  state_machine :state, initial: nil do
    event :remove do
      transition any => :removed
    end

    event :approve do
      transition any => :approved
    end

    event :waiting_to_review do
      transition any => :waiting
    end
  end
end
