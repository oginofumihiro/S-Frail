class CreatePostComments < ActiveRecord::Migration[5.2]
  def change
    create_table :post_comments do |t|
      t.text :comment
      t.integer :customer_id
      t.integer :post_image_id
      t.integer :post_id

      t.timestamps
    end
  end
end
