module WorkshopsEngine
  class Workshop < ActiveRecord::Base
    self.table_name = 'workshops_engine_workshops'

    belongs_to :user

    scope :active, -> { where('date_and_time >= ?', Time.now) }
    scope :published, -> { where(is_published: true) }
  end
end
