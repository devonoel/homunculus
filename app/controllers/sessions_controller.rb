class SessionsController < ApplicationController
  layout 'session'
  before_action :require_logout, except: [:destroy]
  before_action :require_login, only: [:destroy]

  def new
  end

  def create
    @user = User.find_by(name: params[:name])

    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path
  end
end
