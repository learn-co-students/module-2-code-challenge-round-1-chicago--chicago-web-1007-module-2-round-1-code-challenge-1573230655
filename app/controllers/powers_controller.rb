class PowersController < ApplicationController
  before_action :find_power, only: [:show, :edit, :update, :destroy ]

  def index
    @powers = Power.all
  end
  def new
  end 
  def create
    @power = Power.new(power_params)
    if @power.valid?
      @power.save
      redirect_to powers_path
    else
      redirect_to new_power_path
    end 
  end 
  def show 
  end 
  def edit
  end 
  def update
    if @power.update(power_params)
      redirect_to powers_path
    else
      redirect_to edit_power_path
    end 
  end 
  def destroy
    @power.destroy
    redirect_to power_path
  end
  private
  def power_params
    params.require(:power).permit(:name, :description)
  end  
  def find_power
    @power = Power.find(params[:id])
  end 
end
