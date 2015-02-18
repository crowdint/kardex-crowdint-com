module BadgesEngine
  class Badge < ActiveRecord::Base
    belongs_to :award
    belongs_to :value
    has_many :levels

    validates :name, presence: true, uniqueness: true

    accepts_nested_attributes_for :levels, allow_destroy: true

    mount_uploader :image, ImageUploader
  end
end
