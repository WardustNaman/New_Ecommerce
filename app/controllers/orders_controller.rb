class OrdersController < ApplicationController
	def index
		@orders = current_user.orders
	end

	def create
		@order = Order.new(order_params)
		@order.user_id = current_user.id
		# @order.set_number_date_total
		@order.save
		NotificationMailer.order_confirmation(@order).deliver!
		# @order.move_to_order_line_items
		# @order.empty_cart_line_items
		redirect_to orders_path, notice: "Order successfully created"
	end

	private
	def order_params
		params[:order].permit(:address_id)
	end
end
