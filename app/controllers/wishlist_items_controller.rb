class WishlistItemsController < ApplicationController
	def index
		@wishlist_items = current_user.wishlist_items
	end
	def create
		@wishlist_item = WishlistItem.new(wishlist_item_params)
		@wishlist_item.user_id = current_user.id
		if @wishlist_item.save		
		redirect_to wishlist_items_path, notice: "Successfully added the product to your wishlist"
		else
		redirect_to wishlist_items_path, notice: "Item already exist"
	end
	end
	def update
		@wishlist_item = WishlistItem.find(params[:id])
		@wishlist_item.move_to_cart
		redirect_to cart_line_items_path
	end
	def destroy 
	@wishlist_item = WishlistItem.find(params[:id])
	@wishlist_item.destroy
     redirect_to wishlist_items_path, notice: "The product was successfully destroyed"
	end

	private
	def wishlist_item_params
		params[:wishlist_item].permit(:product_id)
	end
end





