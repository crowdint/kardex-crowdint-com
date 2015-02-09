class FeedbookEngine::Level < ActiveRecord::Base
  self.table_name = 'feedbook_levels'

  has_many :questions

  before_validation :lowercase_name

  scope :with_level, -> { where('feedbook_levels.value > 0') }
  scope :order_by_value, -> { order(:value) }

  private

  def lowercase_name
    self.name = name.downcase
  end
end
