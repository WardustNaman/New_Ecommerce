class AddColumnFeatureImageUrlToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :feature_image_url, :string
  end
end
