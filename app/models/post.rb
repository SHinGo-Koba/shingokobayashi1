class Post < ActiveRecord::Base
  attr_accessor :post_image_cache
  belongs_to :user
  has_many :comments, dependent: :destroy
  mount_uploader :post_image, PostimageUploader
  
  validates :user_id, :content, presence: true
  validates :post_image, {
    file_size: {
      less_than_or_equal_to: 1.megabyte,
      message: 'should be less than %{count}'},
    file_content_type: { 
      allow: ["image/jpeg", "image/jpg", "image/png", "image/gif"],
      # mode: :strict,
      message: 'only %{types} are allowed'},
  }

end