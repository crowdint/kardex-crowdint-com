PresentationsEngine::Presentation.class_eval do
  belongs_to :user

  scope :next_wednesday, -> { where( 'date = ?',
	  Date.today.wday == 3 ? Date.today : Date.today + 1 + ( 2 - (Date.today.wday) ) % 7) }
  scope :active, -> { where('date >= ?', Date.today) }
end
