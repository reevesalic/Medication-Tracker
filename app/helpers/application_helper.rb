module ApplicationHelper

     def logged_in?
       !!current_user
     end

     def verify
       redirect_to login_path unless logged_in?
     end
end
