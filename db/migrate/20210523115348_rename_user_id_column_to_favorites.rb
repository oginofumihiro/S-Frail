class RenameUserIdColumnToFavorites < ActiveRecord::Migration[5.2]
  def change
    rename_column :favorites, :user_id, :post_id
  end
end
