class NamesController < ApplicationController
  def index
    redirect_to new_name_path unless session[:gen_names]
    @names = session[:gen_names]
  end

  def new
  end

  def create
    input = params[:names].split(',').map { |n| n.strip }
    chain = Markov.new(input)
    session[:gen_names] = chain.gen_names(10)

    redirect_to names_path
  end
end
