ShowDontTellsEngine::ShowDontTell.class_eval do
  scope :active, -> { where('date >= ?', Time.now) }

  def formated_date
    date.to_formatted_s(:long)
  end
end
