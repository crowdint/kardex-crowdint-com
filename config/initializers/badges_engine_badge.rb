BadgesEngine::Badge.class_eval do
  has_and_belongs_to_many :users,
    join_table: 'badges_users',
    foreign_key: 'badge_id',
    association_foreign_key: 'user_id'
end
