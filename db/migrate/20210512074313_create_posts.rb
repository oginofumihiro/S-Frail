class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.integer :genre_id
      t.string :name
      t.string :image_id
      t.text :introduction
      t.boolean :is_active
      

      t.timestamps
    end
  end
end
