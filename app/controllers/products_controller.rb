class ProductsController < ApplicationController
 def show
  @product = Product.find(params[:id])
 end
 def index
  @product = Product.all
 end
 def new
  @product = Product.new
 end
 def edit 
  @product = Product.find(params[:id])
 end
 
 def create
  @product = Product.new(params.require(:product).permit(:title,:price))
    if @product.save
     flash[:notice] = "Product created successfully"
     redirect_to products_path
    else
     render 'new'
    end
 end
 def update
  @product = Product.find(params[:id])
  if @product.update(params.require(:product).permit(:title,:price))
   flash[:notice] = "Product updated successfully"
   redirect_to products_path
  else
   render "edit"
  end
 end
 def destroy 
  @product = Product.find(params[:id])
  @product.destroy
  redirect_to products_path
 end
end