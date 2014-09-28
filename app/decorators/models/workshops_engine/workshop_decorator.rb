WorkshopsEngine::Workshop.class_eval do
  belongs_to :user
  scope :active, -> { where('date_and_time >= ?', Time.now) }
  scope :published, -> { where(is_published: true) }
end
