class GeneratorsController < ApplicationController
  before_action :require_login

  def index
    @generators = current_user.generators.order(:name)
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

    if @generator.save
      redirect_to generators_path
    else
      flash[:alert] = @generator.errors.full_messages
      redirect_to new_generator_path
    end
  end

  def edit
    @generator = Generator.find(params[:id])
    redirect_to generators_path unless @generator.user == current_user
    @generator.seed = @generator.seed.join(", ")
  end

  def update
    @generator = Generator.find(params[:id])
    redirect_to generators_path unless @generator.user == current_user

    @generator.name = generator_params[:name]
    @generator.seed = generator_params[:seed].split(',').map { |n| n.strip }
    if @generator.save
      redirect_to generators_path
    else
      flash[:alert] = @generator.errors.full_messages
      redirect_to edit_generator_path(@generator)
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
