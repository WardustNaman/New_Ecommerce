class ReviewsController < ApplicationController
before_action :authenticate_user!, except: [:index, :show]
load_and_authorize_resource
def show 
	@review = Review.find(params[:id])
	@product = @review.product # Product.find(@review.product_id)
end
def edit
	@review = Review.find(params[:id])
end	
def create
	@review = Review.new(review_params)
	@review.user_id = current_user.id
	@review.save
end	
def update
	@review = Review.find(params[:id])
	@review.user_id = current_user.id
	if @review.update_attributes(review_params)
		redirect_to review_path(@review.id), notice: "The review was successfully updated"
	end
end
def destroy 
@review = Review.find(params[:id])
@review.destroy
     redirect_to product_path(@review.product_id), notice: "The review was successfully deleted"
end 

private
 def review_params
     params[:review].permit(:body, :rating, :product_id)
end
end


