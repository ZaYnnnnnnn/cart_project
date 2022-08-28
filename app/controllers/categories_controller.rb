class CategoriesController < ApplicationController

 def show
  @category = Category.find(params[:id])
 end 
 def index
  @categories = Category.all
 end
 def new
  @categories = Category.new
 end
 def edit 
  @category = Category.find(params[:id])
 end
 def create
  @categories = Category.new(params.require(:category).permit(:title))
    if @categories.save
     flash[:notice] = "Category created successfully"
     redirect_to categories_path
    else
     render 'new'
    end
 end
 def update
  @category = Category.find(params[:id])
  if @category.update(params.require(:category).permit(:title))
   flash[:notice] = "Category updated successfully"
   redirect_to categories_path
  else
   render "edit"
  end
 end
 def destroy 
  @category = Category.find(params[:id])
  @category.destroy
  redirect_to categories_path
 end
end