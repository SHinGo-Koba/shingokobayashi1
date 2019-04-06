class PostimageUploader < CarrierWave::Uploader::Base

  if Rails.env.production?
    include Cloudinary::CarrierWave
  else
    include CarrierWave::MiniMagick
    storage :file
  end

  # def filename
  #   "#{rand.to_s[2..8]}.#{file.extension}" if original_filename
  # end

  def store_dir
    "uploads/#{Rails.env}/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
  
  def cache_dir
    "uploads/#{Rails.env}/tmp"
  end

  # process :tags => ["post_image"]
  process :resize_to_fit => [1000,1000]


end
