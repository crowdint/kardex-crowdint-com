class Votation < ActiveRecord::Base
  belongs_to :badge, class_name: 'BadgesEngine::Badge'
  has_many :votes, dependent: :destroy
  has_many :users, through: :votes

  validates :badge_id, presence: true

  validate :current_votation?

  before_create :open_votation_process

  scope :active?, ->(value = true) { where(is_open: value) }

  private

  def open_votation_process
    self.is_open = true
  end

  def current_votation?
    if Votation.where(date: date, badge_id: badge_id).any?
      errors.add(:created_at, 'You already create this votation')
    end
  end
end
