class SessionsController < ApplicationController
skip_before_action :require_login

    def welcome
    end

    def  destroy #deletes the user object
      session.delete(:user_id)
      redirect_to '/'
    end

    def new #login form
    end

    def create #log in
      #find user object
      @user = User.find_by(email: params[:user][:email])
      #if user exists, then authenticate
      if @user.try(:authenticate, params[:user][:password])
        session[:user_id] = @user.id
        redirect_to user_path(@user) 
      else
        flash[:error] = "Sorry, please try again."
        redirect_to login_path
      end
    end

    def omniauth
      useremail = request.env['omniauth.auth']['info']['email']
      name = request.env['omniauth.auth']['info']['name']
      #find or create a user using the email
      @user = User.find_or_create_by(email: useremail) do |user|
        user.name = name
        user.password = SecureRandom.hex(5)
        user.password_confirmation=user.password
      end
      #sets session
      session[:user_id] = @user.id
      redirect_to user_path(@user) 
    end
end