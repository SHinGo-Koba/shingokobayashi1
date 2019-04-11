class PostimageUploader < CarrierWave::Uploader::Base

  if Rails.env.production?
    include Cloudinary::CarrierWave
  else
    include CarrierWave::MiniMagick
    storage :file
  end

  # process :tags => ["post_image"]
  process :resize_to_fit => [1000,1000]

end
