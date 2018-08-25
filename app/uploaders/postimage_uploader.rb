class PostimageUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave
    
  process :tags => ["post_image"]
  process :resize_to_fit => [1000,1000]

  version :post_ori do
  end


  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

end
