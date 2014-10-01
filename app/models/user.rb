class User < ActiveRecord::Base
  devise :database_authenticatable, :trackable, :omniauthable

  has_and_belongs_to_many :skills,
      join_table: 'skills_users'

  has_and_belongs_to_many :nominee_lists

  has_and_belongs_to_many :propose_badges

  has_many :presentations,
           class_name: 'ShowDontTellsEngine::Presentation'

  has_and_belongs_to_many :roles

  has_many :badge_users

  has_many :badges,
    through: :badge_users,
    class_name: 'BadgesEngine::Badge'

  has_many :nominee_users
  has_many :votes

  has_many :workshops,
           class_name: 'WorkshopsEngine::Workshop'

  scope :admins, -> { where(is_admin: true) }

  def to_param
    "#{id}-#{name.parameterize}"
  end

  def find_badge_assignment(badge)
    self.badge_users.find_by(user: self, badge: badge)
  end

  def admin_module?(current_module)
    roles.pluck(:name).include? "admin_#{current_module}"
  end
end
