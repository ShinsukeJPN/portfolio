class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    case resource
  	  when User
        user_path(current_user)
   	  when Admin
		    admin_users_path
    end
  end

  def after_sign_out_path_for(resource)
    root_path
  end

end
