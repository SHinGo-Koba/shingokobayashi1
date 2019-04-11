class UserimageUploader < CarrierWave::Uploader::Base

  if Rails.env.production?
    include Cloudinary::CarrierWave
  else
    include CarrierWave::MiniMagick
    storage :file
  end
  
  process :resize_to_fit => [350, 350]

end
