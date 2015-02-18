module BadgesEngine
  class Badge < ActiveRecord::Base
    mount_uploader :image, ImageUploader
  end
end
