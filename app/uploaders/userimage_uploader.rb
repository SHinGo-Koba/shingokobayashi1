class UserimageUploader < CarrierWave::Uploader::Base

  include Cloudinary::CarrierWave
  
  # process :convert => 'png'
  process :tags => ['user_image']
  
  version :standard do
    process :resize_to_fit => [300, 300, :north]
  end
  
  version :thumbnail do
    process :resize_to_fit => [50,50]
  end
  
  # def extension_whitelist do
  #   %w(jpg jpeg gif png)
  # end
  
  # def content_type_whitelist do
  #   /image\//
  # end

end
