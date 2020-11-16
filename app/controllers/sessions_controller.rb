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
      @user = User.find_by(username: params[:user][:username])
      if @user.try(:authenticate, params[:user][:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
      else
        flash[:error] = "Sorry, please try again."
        redirect_to login_path
      end
    
    end
     def omniauth
          @user = User.find_or_create_by(email: auth["info"]["email"]) do |user|
          user.username = auth["info"]["name"]
          user.email = auth['info']['email']
          user.password = SecureRandom.hex(10)
          redirect_to patients_path
        end
      
      end
        private
      
      def auth
        request.env['omniauth.auth']
      end
end