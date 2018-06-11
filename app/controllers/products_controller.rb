class ProductsController < ApplicationController
before_action :authenticate_user!, except: [:index, :show]
load_and_authorize_resource
#url - hhtp://localhost:3000/products
#uri - /products
#path - product_path
#http method - GET
#roles & resposibility - to list all products
def index
	@products = Product.paginate(:page => params[:page], :per_page => 9)
    @product = Product.new
    @category = Category.new
end

#url - http://localhost:3000/products/new
#uri - /products/new
#path - new_product_path
#http method - GET
#roles & resposibility - is to setup a form for adding a new product
def new
	@product = Product.new
end

def create
	@product = Product.new(params[:product].permit(:name, :feature_image_url, :description, :price, :stock, :category_id))
	if @product.save
		redirect_to products_path
	else
		render action: 'new'
	end
end	

#url - http://localhost:3000/products/:id
#uri - /products/:id
#path - product_path(id)
#http method - GET
#roles & resposibility - to find the product from the database and display it on the show page , this page will be used to show all the data about the product and also associated information like all reviews, all q&a's, add product to cart  

def show
	@products = Product.all
	@product = Product.find(params[:id])
	@review = Review.new
end

#url - http://localhost:3000/products/:id/edit
#uri - /products/:id/edit
#path - edit_product_path(id)
#http method - GET
#roles & resposibility - to find the record the user is trying to edit , and display it on a form

def edit
	@product = Product.find(params[:id])
end

#url - http://localhost:3000/products/:id
#uri - /products/:id
#path - product_path(id)
#http method - PATCH
#roles & resposibility - find the record, the user just updated in the browser, and update its information by taking the data coming in from the form , validate the object, if the validations pass update the record to the db and redirect the user to a show page , alse display the errors on the form

def update 
@product = Product.find(params[:id])
if @product.update_attributes(params[:product].permit(:name, :feature_image_url, :description, :price, :stock, :category_id))
	redirect_to products_path(@product.id)
else
	render action: 'edit'
end
end

#url - http://localhost:3000/products/:id
#uri - /products/:id
#path - product_path(id)
#http method - PATCH
#roles & resposibility - find the record, the user just updated in the browser, and update its information by taking the data coming in from the form , validate the object, if the validations pass update the record to the db and redirect the user to a show page , alse display the errors on the form

def destroy 
@product = Product.find(params[:id])
@product.destroy
     redirect_to products_path, notice: "The product was successfully destroyed"
end 

private
 def product_params
     params[:product].permit(:name, :description, :feature_image_url, :price, :stock, :category_id)
end
end
