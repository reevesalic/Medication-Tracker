class SessionsController < ApplicationController

    def welcome

    end

    def  destroy
      session.delete(:user_id)
      redirect_to '/'
    end

    def new
    
    end

    def create
      @user = User.find_by(email: params[:user][:email])
      if @user.try(:authenticate, params[:user][:password])
        session[:user_id] = @user.id
        redirect_to user_path(@user) #patients_path(@patient)
      else
        flash[:error] = "Sorry, please try again."
        redirect_to login_path
      end
    end

    def omniauth
      useremail = request.env['omniauth.auth']['info']['email']
      name = request.env['omniauth.auth']['info']['name']
      @user = User.find_or_create_by(email: useremail) do |user|
        user.name = name
        user.password = SecureRandom.hex(5)
        user.password_confirmation=user.password
      end
      session[:user_id] = @user.id
      redirect_to user_path(@user) #patients_path(@patient)
    end
end