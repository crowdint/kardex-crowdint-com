class BadgeProposal < ActiveRecord::Base
  validates :user_id, presence: true
  validates :badge_id, presence: true
  validates :why, presence: true

  belongs_to :user
  belongs_to :badge,
    class_name: 'BadgesEngine::Badge',
    foreign_key: 'badge_id'
end
