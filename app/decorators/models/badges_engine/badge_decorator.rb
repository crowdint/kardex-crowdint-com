BadgesEngine::Badge.class_eval do
  has_many :badge_users
  has_many :users, through: :badge_users
  has_many :vote_events
end
