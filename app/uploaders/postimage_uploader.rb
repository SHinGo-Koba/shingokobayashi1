class PostimageUploader < CarrierWave::Uploader::Base
  
  include Cloudinary::CarrierWave
  
  # process :convert => "png"
  process :tags => ["post_image"]
  
  version :post_ori do

  end

  # def extension_whitelist do
  #   %w(jpg jpeg gif png)
  # end
  
  # def content_type_whitelist do
  #   /image\//
  # end

end
