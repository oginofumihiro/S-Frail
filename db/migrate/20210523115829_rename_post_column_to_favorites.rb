class RenamePostColumnToFavorites < ActiveRecord::Migration[5.2]
  def change
    rename_column :favorites, :post, :post_id
  end
end
