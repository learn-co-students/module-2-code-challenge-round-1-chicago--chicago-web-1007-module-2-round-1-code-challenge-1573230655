class HeroinesController < ApplicationController
  # before_action :set_heroine, only: [:show]
  def index
    @heroines = Heroine.all
  end

  def show
    @heroine = Heroine.find(params[:id])
  end

  def new
    @heroine = Heroine.new
  end

  def create
    @heroine = Heroine.new(heroine_params)
    if @heroine.save
      redirect_to @heroine
    else
      redirect_to new_heroine_path
    end
  end

  def edit
    @heroine = Heroine.find(params[:id])
  end

  def update
    @heroine = Heroine.find(params[:id])
    @heroine.update(heroine_params)
    redirect_to @heroine
  end

  private

  # def set_heroine
  #   @heroine = Heroine.find(params[:id])
  # end

  def heroine_params
    params.require(:heroine).permit(:name, :super_name, :power_id)
  end
end
