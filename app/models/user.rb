class User < ActiveRecord::Base
  devise :database_authenticatable, :trackable, :omniauthable,
    omniauth_providers: [:google_oauth2]

  has_and_belongs_to_many :skills,
      join_table: 'skills_users'

  has_and_belongs_to_many :nominee_lists

  has_and_belongs_to_many :propose_badges

  has_many :presentations,
    class_name: 'PresentationsEngine::Presentation'

  has_and_belongs_to_many :roles

  has_many :badge_users

  has_many :badges,
    through: :badge_users,
    class_name: 'BadgesEngine::Badge'

  has_many :nominee_users
  has_many :votes

  scope :admins, -> { where(is_admin: true) }
  scope :ordered, -> { order('name ASC') }
  scope :order_by_votes, -> (votes) {
    order_ids = order_ids_by_votes(votes, :desc)
    where(id: order_ids).order(build_sentence(order_ids))
  }

  def to_param
    "#{id}-#{name.parameterize}"
  end

  def find_badge_assignment(badge)
    self.badge_users.find_by(user: self, badge: badge)
  end

  def admin_module?(current_module)
    roles.pluck(:name).include? "admin_#{current_module}"
  end

  def self.order_ids_by_votes(votes, order)
    if order == :desc
      votes.sort_by { |_k, v| v }.reverse.to_h.keys
    else
      votes.sort_by { |_k, v| v }.to_h.keys
    end
  end

  def self.build_sentence(order_ids)
    sentence = order_ids.each_with_index.map do |id, index|
      "WHEN #{id} THEN #{index}"
    end.join(' ')
    "CASE id #{sentence} END"
  end
end
