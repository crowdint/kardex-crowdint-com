class FeedbookEngine::Question < ActiveRecord::Base
  self.table_name = 'feedbook_questions'

  belongs_to :skill
  belongs_to :level
  has_many :answers

  accepts_nested_attributes_for :answers, :reject_if => :all_blank, :allow_destroy => true

  DURATIONS = [
    ['Half minute', '30'],
    ['1 minute', '60'],
    ['1 and half minute', '90'],
    ['2 minutes', '120'],
    ['3 minutes', '180'],
    ['5 minutes', '300']
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
