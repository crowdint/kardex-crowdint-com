class Votation < ActiveRecord::Base
  belongs_to :badge, class_name: 'BadgesEngine::Badge'

  validates :badge_id, presence: true
  validate :current_month?

  before_create :set_is_open

  private

  def set_is_open
    self.is_open = true
  end

  def current_month?
    if Voting.where(created_at: self.created_at, badge_id: self.badge_id).any?
      errors.add(:created_at, 'You already create this votation')
    end
  end
end
