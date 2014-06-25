class User < ActiveRecord::Base
  devise :database_authenticatable, :trackable, :omniauthable

  has_and_belongs_to_many :skills,
      join_table:              'skills_users'

  belongs_to :position

  has_and_belongs_to_many :achievables

  has_and_belongs_to_many :nominee_lists

  has_and_belongs_to_many :badges,
      association_foreign_key: 'achievable_id',
      join_table:              'achievables_users'

  has_and_belongs_to_many :workshops,
      association_foreign_key: 'achievable_id',
      join_table:              'achievables_users'

  has_many :badge_proposals

  def to_param
    "#{id}-#{name.parameterize}"
  end
end
