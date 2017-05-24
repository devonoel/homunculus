class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def require_logout
    redirect_to root_path if current_user
  end

  def require_login
    redirect_to login_path unless current_user
  end
end
