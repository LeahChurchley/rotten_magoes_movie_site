class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

   protected

   def restrict_access
      if !current_user
        flash[:alert] = "You must log in."
        redirect_to new_session_path
      end
    end

    def current_user
      # if session[:user_id]
      #   @current_user ||= User.find_by(id: session[:user_id])
      # end

      if session[:user_id]
        user = User.find_by(id: session[:user_id])
        if user
          @current_user = user
        end
      end
    end

    helper_method :current_user

end
