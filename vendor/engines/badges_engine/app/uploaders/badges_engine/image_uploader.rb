module BadgesEngine
  class ImageUploader < CarrierWave::Uploader::Base
    include CarrierWave::MiniMagick

    storage :fog

    def default_url
      ActionController::Base.helpers.asset_path('no-image.svg')
    end

    def extension_white_list
      %w(svg png)
    end
  end
end
