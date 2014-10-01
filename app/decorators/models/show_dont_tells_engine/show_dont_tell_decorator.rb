ShowDontTellsEngine::ShowDontTell.class_eval do
  scope :active, -> { where('date >= ?', Time.now) }
end
