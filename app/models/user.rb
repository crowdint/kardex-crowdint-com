class User < ActiveRecord::Base
  devise :database_authenticatable, :trackable, :omniauthable

  has_and_belongs_to_many :skills,
      join_table: 'skills_users'

  has_and_belongs_to_many :nominee_lists

  has_and_belongs_to_many :propose_badges

  has_and_belongs_to_many :badges,
    class_name: 'BadgesEngine::Badge',
    join_table: 'badges_users',
    foreign_key: 'user_id',
    association_foreign_key: 'badge_id'

  has_many :nominee_users

  scope :admins, -> { where(is_admin: true) }

  scope :admins, ->{ where(is_admin: true) }

  validate :check_skills_size

  def to_param
    "#{id}-#{name.parameterize}"
  end

  def check_skills_size
    if self.skills.size > 3
      errors.add(:skills, 'You can\'t have more than 3 skills... Sorry')
    end
  end
end
