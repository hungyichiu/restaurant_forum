class UsersController < ApplicationController

  before_action :set_user, only: [:show, :edit, :update]

def show
     
end

def edit
  unless @user == current_user
    redirect_to user_path(@user)
  end
end

def update
  if @user.update(user_params)
    flash[:notice] = "successfuly update user profile"
    redirect_to user_path(@user) 
    

  else
    flash[:notice] = "Failed to update user profile"
    render :edit
    
  end

  
end

private
  def set_user
    @user = User.find(params[:id]) 
  end

  def user_params
    params.require(:user).permit(:name, :intro, :avatar)
  end


end
