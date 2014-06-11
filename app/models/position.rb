# == Schema Information
#
# Table name: positions
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :string(255)
#  image_url   :string(255)
#  user_id     :integer
#

class Position < ActiveRecord::Base
  validates :name, presence: true

  has_and_belongs_to_many :users
end
