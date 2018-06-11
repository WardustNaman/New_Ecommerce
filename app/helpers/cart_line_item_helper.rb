module CartLineItemHelper
	def cart_line(cart_line_item)
		total = 0
		total += cart_line_item.product.price * cart_line_item.quantity
	end

end
