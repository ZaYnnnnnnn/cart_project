class CatagoriesController < ApplicationController

 def show
  @catagory = Catagory.find(params[:id])
 end 
 def index
  @catagories = Catagory.all
 end
 def new
  @catagories = Catagory.new
 end
 def edit 
  @catagory = Catagory.find(params[:id])
 end
 def create
  @catagories = Catagory.new(params.require(:catagory).permit(:title))
    if @catagories.save
     flash[:notice] = "Catagory created successfully"
     redirect_to catagories_path
    else
     render 'new'
    end
 end
 def update
  @catagory = Catagory.find(params[:id])
  if @catagory.update(params.require(:catagory).permit(:title))
   flash[:notice] = "Catagory updated successfully"
   redirect_to catagories_path
  else
   render "edit"
  end
 end
 def destroy 
  @catagory = Catagory.find(params[:id])
  @catagory.destroy
  redirect_to catagories_path
 end
end