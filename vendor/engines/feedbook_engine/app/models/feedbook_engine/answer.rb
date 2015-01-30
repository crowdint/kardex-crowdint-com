class FeedbookEngine::Answer < ActiveRecord::Base
  self.table_name = 'feedbook_answers'

  belongs_to :question
end
