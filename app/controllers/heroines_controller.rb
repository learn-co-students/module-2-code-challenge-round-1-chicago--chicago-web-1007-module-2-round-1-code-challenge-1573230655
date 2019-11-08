class HeroinesController < ApplicationController
  before_action :find_heroine, only: [:show, :edit, :update, :destroy]
  def index
    @heroines = Heroine.search(params[:search])
  end

  def show
  end

  def new
    @heroine = Heroine.new
  end


  def create
    @heroine = Heroine.new(heroine_params)
    if @heroine.save
      redirect_to @heroine
    else
      flash[:notice] = "This Super Name is taken! Please choose another one!"
      render :new
    end
  end

  private

  def heroine_params
    params.require(:heroine).permit(:name, :super_name, :power_id, :searh)
  end

  def find_heroine
    @heroine = Heroine.find(params[:id])
  end

end
