class User < ActiveRecord::Base
  devise :database_authenticatable, :trackable, :omniauthable

  has_and_belongs_to_many :skills,
      join_table: 'skills_users'

  has_and_belongs_to_many :nominee_lists

  has_and_belongs_to_many :propose_badges

  has_and_belongs_to_many :roles

  has_many :badge_users

  has_many :badges,
    through: :badge_users,
    class_name: 'BadgesEngine::Badge'

  has_many :nominee_users

  scope :admins, -> { where(is_admin: true) }

  validate :check_skills_size

  def to_param
    "#{id}-#{name.parameterize}"
  end

  def find_badge_assignment(badge)
    self.badge_users.find_by(user: self, badge: badge)
  end

  def check_skills_size
    if self.skills.size > 3
      errors.add(:skills, 'You can\'t have more than 3 skills... Sorry')
    end
  end

  def admin_module?(current_module)
    self.roles.pluck(:name).include? "admin_#{current_module}"
  end

end
