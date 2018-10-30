class Comment < ActiveRecord::Base
  validates :comment, :user_id, :post_id , presence: true
  validates :comment, length: { maximum: 140 }
  
end
