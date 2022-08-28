class StoresController < ApplicationController

 def show
  @store = Store.find(params[:id])
end
def index
 @stores = Store.all
end
def new
 @stores = Store.new
end

def edit 
 @store = Store.find(params[:id])
end

def create
 @stores = Store.new(params.require(:store).permit(:title))
   if @stores.save
    flash[:notice] = "Store created successfully"
    redirect_to stores_path
   else
    render 'new'
   end
end
def update
 @store = Store.find(params[:id])
 if @store.update(params.require(:store).permit(:title))
  flash[:notice] = "Store updated successfully"
  redirect_to stores_path
 else
  render "edit"
 end
end
def destroy 
 @store = Store.find(params[:id])
 @store.destroy
 redirect_to stores_path
end


end