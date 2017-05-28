class GeneratorsController < ApplicationController
  before_action :require_login

  def index
    @generators = current_user.generators
  end

  def show
    @generator = Generator.find(params[:id])
    @num = params[:num].to_i > 0 ? params[:num].to_i : 10
    @names = @generator.generate_names(@num)
  end

  def new
    @generator = Generator.new
  end

  def create
    @generator = Generator.new(generator_params)
    @generator.seed = generator_params[:seed].split(',').map { |n| n.strip }
    @generator.user = current_user

    if @generator.save!
      redirect_to generators_path
    else
      render :new
    end
  end

  def destroy
    @generator = Generator.find(params[:id])
    @generator.destroy
    redirect_to generators_path
  end

  private
  def generator_params
    params.require(:generator).permit(:name, :seed)
  end
end
