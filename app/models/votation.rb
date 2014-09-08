class Votation < ActiveRecord::Base
  belongs_to :badge, class_name: 'BadgesEngine::Badge'

  validates :badge_id, presence: true
  validate :current_votation?

  before_create :open_votation_process

  private

  def open_votation_process
    self.is_open = true
  end

  def current_votation?
    if Votation.where(created_at: self.created_at, badge_id: self.badge_id).any?
      errors.add(:created_at, 'You already create this votation')
    end
  end
end
