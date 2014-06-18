# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  name                   :string(255)
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  provider               :string(255)
#  uid                    :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#  is_admin               :boolean
#  department             :string(255)
#  picture_url            :string(255)
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :trackable, :omniauthable

  has_and_belongs_to_many :skills,
      join_table:              'skills_users'

  belongs_to :position

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
