# == Schema Information
#
# Table name: achievables
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :text
#  type        :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#  image       :string(255)
#

class Achievable < ActiveRecord::Base
  validates :name, presence: true

  mount_uploader :image, ImageUploader

  has_and_belongs_to_many :users
end
