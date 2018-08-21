class Post < ActiveRecord::Base
  belongs_to :user
  mount_uploader :post_image, PostimageUploader
  
  validates :content, {presence: true}
  # validates :user_id, {presence: true}
  validates :post_image, {
    file_size: {
      less_than_or_equal_to: 1.megabyte,
      message: 'image should be less than %{count}'},
    file_content_type: { 
      allow: ["image/jpeg", "image/jpg", "image/png", "image/gif"],
      mode: :strict,
      message: 'only %{types} are allowed'},
  }

  
  # def user
  #   return User.find_by(id: self.user_id)
  # end
  
end
