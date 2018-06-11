class WishlistItem < ApplicationRecord
	belongs_to :product
	belongs_to :user
	validates_presence_of :product_id, :user_id
	validates_uniqueness_of :user_id, scope: :product_id

	def move_to_cart
		CartLineItem.new(user_id: self.user_id, product_id: self.product_id, quantity: 1).save_or_update
		self.destroy
	end

end
