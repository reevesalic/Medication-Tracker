class ApplicationController < ActionController::Base
  before_action :require_login

  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end

  def logged_in?
    !!session[:user_id]
  end

  def require_login
    redirect_to root_path if !logged_in?
  end 
  
end
