class Comment < ActiveRecord::Base
  belongs_to :post
  
  validates :comment, :user_id, :post_id , presence: true
  validates :comment, length: { maximum: 140 }
  
end
