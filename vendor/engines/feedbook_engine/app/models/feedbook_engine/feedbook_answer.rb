class FeedbookEngine::FeedbookAnswer < ActiveRecord::Base
  self.table_name = 'feedbook_answers'

  belongs_to :question, class_name: 'FeedbookQuestion'
end
