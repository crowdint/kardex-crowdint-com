module WorkshopsEngine
  class Workshop < ActiveRecord::Base
    self.table_name = 'workshops_engine_workshops'

    belongs_to :user

    validates :title, presence: true, uniqueness: true
    validates :description, presence: true
    validates :date_and_time, presence: true

    scope :active, -> { where('date_and_time >= ?', Time.now) }
    scope :published, -> { where(is_published: true) }
  end
end
