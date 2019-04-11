class PostimageUploader < CarrierWave::Uploader::Base

  if Rails.env.production?
    include Cloudinary::CarrierWave::MiniMagick
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

  # process :tags => ["post_image"]
  process :resize_to_fit => [1000,1000]

end
