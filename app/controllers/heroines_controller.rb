class HeroinesController < ApplicationController

  before_action :find_heroine, only:[:show]

  def index
    @heroines = Heroine.all
  end

  def new
    @heroine = Heroine.new
  end

  def create
    @heroine = Heroine.new(heroine_params)
    if @heroine.valid?
      @heroine.save
      redirect_to @heroine
    else
      redirect_to new_heroine_path
    end
  end

  #Couldnt get new instance to save to database for some reason.

  def show
  end


  private

    def heroine_params
      params.require(:heroine).permit(:name, :super_name)
    end

    def find_heroine
      @heroine = Heroine.find(params[:id])
    end

end





