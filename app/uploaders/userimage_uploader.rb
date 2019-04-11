class UserimageUploader < CarrierWave::Uploader::Base

  if Rails.env.production?
    include Cloudinary::CarrierWave
  else
    include CarrierWave::MiniMagick
    storage :file

    def store_dir
      "uploads/#{Rails.env}/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
    end

    def cache_dir
      "uploads/#{Rails.env}/tmp"
    end
  end
  
  # process :resize_to_fit => [350, 350]

end
