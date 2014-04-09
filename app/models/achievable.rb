class Achievable < ActiveRecord::Base
  validates :name, presence: true

  mount_uploader :image

  has_and_belongs_to_many :users
end
