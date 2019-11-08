class HeroinesController < ApplicationController
  def index
    @heroines = Heroine.all
  end

  def show
    find_heroine
  end

  def new
    @heroine = Heroine.new
  end

  def create
    @heroine = Heroine.new(heroine_params)
    if @heroine.valid?
      @heroine.save
      redirect_to heroine_path(@heroine)
    else
      render :new
    end
  end

  def edit
    find_heroine
  end

def update

  def update
      find_heroine
        if @heroine.update(heroine_params)
        redirect_to heroines_path
        else
          render :edit
        end
  end
end

def destroy
    find_heroine.destroy
    redirect_to heroines_path
end


  private

  def find_heroine
    @heroine = Heroine.find(params[:id])
  end

  def heroine_params
    params.require(:heroine).permit(:name, :super_name, :power_id)
  end
end
