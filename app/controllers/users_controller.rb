class UsersController < ApplicationController

 def show
  @user = User.find(params[:id])
end
def index
 @user = User.all
end
def new
 @user = User.new
end

def edit 
 @user = User.find(params[:id])
end

def create
 @user = User.new(params.require(:user).permit(:username,:email,:password))
   if @user.save
    flash[:notice] = "User created successfully"
    redirect_to users_path
   else
    render 'new'
   end
end
def update
 @user = User.find(params[:id])
 if @user.update(params.require(:user).permit(:username,:email,:password))
  flash[:notice] = "User updated successfully"
  redirect_to users_path
 else
  render "edit"
 end
end
def destroy 
 @user = User.find(params[:id])
 @user.destroy
 redirect_to users_path
end

end