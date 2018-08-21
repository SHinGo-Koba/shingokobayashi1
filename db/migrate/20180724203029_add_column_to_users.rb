class AddColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :user_image_name, :string
  end
end
