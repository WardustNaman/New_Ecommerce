class Product < ApplicationRecord
validates_presence_of :name, :description, :category_id, :price, :stock
validates_length_of :description, minimum: 5
belongs_to :category
has_many :reviews
has_many :order_line_items
has_many :cart_line_items
has_many :wishlist_items
end
