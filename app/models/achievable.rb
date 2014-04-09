class Achievable < ActiveRecord::Base
  validates :name, presence: true

  mount_uploader :image, ImageUploader

  has_and_belongs_to_many :users
end
