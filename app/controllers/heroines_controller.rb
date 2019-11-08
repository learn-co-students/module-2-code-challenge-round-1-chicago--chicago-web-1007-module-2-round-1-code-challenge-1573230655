class HeroinesController < ApplicationController
  before_action :find_heroine, only: [:show]
  
  
  def index
    @heroines = Heroine.all
  end

  def new
    @heroine = Heroine.new
  end

  def search
    @power = Power.find_by(name: params[:q])
    @heroines = Heroine.all.select{|h| h.power==@power}
    render :index
  end

  def create
    @heroine = Heroine.new(heroine_params)
    if @heroine.save
      redirect_to @heroine
    else
      flash[:errors] = @heroine.errors.full_messages
      redirect_to new_heroine_path
    end
  end

  def show
  end

  private

  def find_heroine
  @heroine = Heroine.find(params[:id])
  end

  def heroine_params
    params.require(:heroine).permit(:name, :super_name, :power_id)
  end
end
