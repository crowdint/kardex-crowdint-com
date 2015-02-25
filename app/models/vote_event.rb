class VoteEvent < ActiveRecord::Base
  belongs_to :badge, class_name: 'BadgesEngine::Badge'
  has_many :votes, dependent: :destroy
  has_many :users, through: :votes
  has_one :candidate

  accepts_nested_attributes_for :candidate

  validates :badge_id, presence: true

  validate :current_vote_event?

  before_create :open_vote_event_process

  scope :active?, ->(value = true) { where(is_open: value) }

  private

  def open_vote_event_process
    self.is_open = true
  end

  def current_vote_event?
    if VoteEvent.where(date: date, badge_id: badge_id).any?
      errors.add(:created_at, 'You already create this votation')
    end
  end
end
