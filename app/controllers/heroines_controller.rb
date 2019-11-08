class HeroinesController < ApplicationController
  before_action :find_heroine, only: [:show, :edit, :update, :destroy ]
  
  def index
    @heroines = Heroine.all
  end
  def show
  end 
  def new
  end 
  def create
    @heroine = Heroine.new(heroine_params)
    if @heroine.valid?
      @heroine.save
      redirect_to heroines_path
    else 
      redirect_to new_heroine_path
    end 
    def edit
    end 
    def update
    end 
  end 
  private
  def heroine_params
    params.require(:heroine).permit(:name, :super_name, :power_name)
  end 
  def find_heroine
    @heroine = Heroine.find(params[:id])
  end 
 
end
