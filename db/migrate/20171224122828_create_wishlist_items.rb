class CreateWishlistItems < ActiveRecord::Migration[5.1]
  def change
    create_table :wishlist_items do |t|
      t.integer :product_id
      t.integer :user_id

      t.timestamps
    end
  end
end
