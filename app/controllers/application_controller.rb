class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def require_logout
    redirect_to root_path if session[:user_id]
  end

  def require_login
    redirect_to login_path unless session[:user_id]
  end
end
