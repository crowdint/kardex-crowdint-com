class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :trackable, :omniauthable

  has_and_belongs_to_many :achievables

  has_and_belongs_to_many :badges,
      association_foreign_key: 'achievable_id',
      join_table:              'achievables_users'

  has_and_belongs_to_many :workshops,
      association_foreign_key: 'achievable_id',
      join_table:              'achievables_users'

  def to_param
    "#{id}-#{name.parameterize}"
  end
end
