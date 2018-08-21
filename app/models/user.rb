class User < ActiveRecord::Base
  has_secure_password
  has_many :posts
  mount_uploader :user_image, UserimageUploader
  
  validates :name,
    presence: {message: "Please fill out."},
    uniqueness: {message: "Someone has already used."}

  validates :email, 
    presence: {message: "Please fill in your email"},
    confirmation: true,
    format: { with: VALID_EMAIL_REGEX, message: " is invalid." }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :password,
    presence: { message: "Please fill out." }

  validates :email_confirmation, :password_confirmation,
    presence: true
    
  validates :user_image, {
    file_size: {
      less_than_or_equal_to: 1.megabyte,
      message: 'image should be less than %{count}'},
    file_content_type: { 
      allow: ["image/jpeg", "image/jpg", "image/png", "image/gif"],
      mode: :strict,
      message: 'only %{types} are allowed'},
  }


  def posts
    return Post.where(user_id: self.id)
  end
  
end
