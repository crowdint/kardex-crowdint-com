class User < ActiveRecord::Base
  devise :database_authenticatable, :trackable, :omniauthable

  has_and_belongs_to_many :skills,
      join_table: 'skills_users'

  belongs_to :position

  has_and_belongs_to_many :nominee_lists

  has_and_belongs_to_many :propose_badges

  has_and_belongs_to_many :badges,
    class_name: 'BadgesEngine::Badge',
    join_table: 'badges_users',
    foreign_key: 'user_id',
    association_foreign_key: 'badge_id'

  has_many :nominee_users
  
  scope :admins, -> { where(is_admin: true) }

  delegate :name, to: :position, prefix:true, allow_nil: true

  scope :admins, ->{ where(is_admin: true) }

  def to_param
    "#{id}-#{name.parameterize}"
  end
end
