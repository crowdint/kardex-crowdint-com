class User < ActiveRecord::Base
  devise :database_authenticatable, :trackable, :omniauthable

  has_and_belongs_to_many :skills,
      join_table:              'skills_users'

  belongs_to :position

  has_and_belongs_to_many :nominee_lists

  has_many :nominee_users

  def to_param
    "#{id}-#{name.parameterize}"
  end
end
