class RemoveUserIdOldFromPosts < ActiveRecord::Migration
  def change
    remove_column :posts, :user_id_old
  end
end
