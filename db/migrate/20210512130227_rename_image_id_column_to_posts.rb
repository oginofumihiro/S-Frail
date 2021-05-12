class RenameImageIdColumnToPosts < ActiveRecord::Migration[5.2]
  def change
    rename_column :posts, :image_id, :post_image_id
  end
end
