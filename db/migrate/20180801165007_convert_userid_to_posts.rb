class ConvertUseridToPosts < ActiveRecord::Migration[5.2]
  def change
    rename_column :posts, :user_id, :user_id_old
    add_column :posts, :user_id, :integer
  end
end
