class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  # include Pundit

  class ApplicationController < ActionController::Base
    # Prevent CSRF attacks by raising an exception.
    # For APIs, you may want to use :null_session instead.
    protect_from_forgery with: :exception
    before_action :current_user
    before_action :require_logged_in, except: [:new, :create, :home]

    def logged_in?
      !!session[:user_id]
    end


    def current_user
      if logged_in?
        User.find(session[:user_id])
      end
      # @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
    # helper_method :current_user

    # current_user.admin will basically equate to this: User.find(session[:user_id]).admin

    private
      def require_logged_in
        redirect_to root_path unless logged_in?
      end

  end

end
