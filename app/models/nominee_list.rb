class NomineeList < ActiveRecord::Base
  validates :badge_id, presence: true

  belongs_to :badge, class_name: 'BadgesEngine::Badge',
    foreign_key: 'badge_id'

  has_and_belongs_to_many :users
end
