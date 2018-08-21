class AddColumnToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :post_image_name, :string
  end
end
