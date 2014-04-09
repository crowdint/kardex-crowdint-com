CarrierWave.configure do |config|
  if Rails.env.production?
    config.storage :fog
    config.fog_credentials = {
      :provider               => 'AWS',                        # required
      :aws_access_key_id      => ENV['AMAZON_ACCESS_KEY'],
      :aws_secret_access_key  => ENV['AMAZON_SECRET']
    }
    config.fog_directory  = ENV['AMAZON_BUCKET']
    config.fog_public     = true
    config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
  else
    config.storage :file
  end
end
