class NamesController < ApplicationController
  before_action :require_login

  def index
    redirect_to new_name_path unless session[:gen_names]
    @names = session[:gen_names]
  end

  def new
  end

  def create
    if params[:names]
      input = params[:names].split(',').map { |n| n.strip }
      chain = Chain.create!(user_id: session[:user_id])
      chain.generate_table!(input)
      session[:gen_names] = chain.generate_names(10)

      redirect_to names_path
    else
      render :new
    end
  end
end
