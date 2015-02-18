module BadgesEngine
  class Badge < ActiveRecord::Base
    belongs_to :award
    belongs_to :value

    mount_uploader :image, ImageUploader
  end
end
