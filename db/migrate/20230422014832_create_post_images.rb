class CreatePostImages < ActiveRecord::Migration[6.1]
  def change
    create_table :post_images do |t|

      t.timestamps
      t.integer :user_id
      t.string :shop_name
      t.text :caption
    end
  end
end
