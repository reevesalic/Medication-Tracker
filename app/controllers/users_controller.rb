class UsersController < ApplicationController
skip_before_action :require_login, only: [:new, :create]
  def new #loads the signup form
     @user = User.new
  end

  def create #signup
     @user = User.new(user_params)
     if @user.save
     session[:user_id] = @user.id
     redirect_to user_path(@user)
     else
     render :new
     end
  end

 def show
     @user = User.find_by_id(params[:id])
     redirect_to '/' if !@user
  end

     private
  def user_params
    params.require(:user).permit(:email, :password, :name)
  end
end
