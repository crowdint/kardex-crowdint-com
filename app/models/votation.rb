class Votation < ActiveRecord::Base
  belongs_to :badge, class_name: 'BadgesEngine::Badge'
  has_many :votes
  has_many :users, through: :votes

  validates :badge_id, presence: true
  validate :current_votation?

  before_create :open_votation_process

  scope :current, -> { where(is_open: true) }

  private

  def open_votation_process
    self.is_open = true
  end

  def current_votation?
    if Votation.where(created_at: created_at, badge_id: badge_id).any?
      errors.add(:created_at, 'You already create this votation')
    end
  end
end
