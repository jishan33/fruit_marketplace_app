class FarmersController < ApplicationController
  before_action :set_farmer, only: [:edit, :update, :destroy, :show]
  
  def index
    @farmers = Farmer.all
  end

  def create 
    byebug
    @farmer = Farmer.create(farmer_params)

    if @product.errors.any?
      render :new
    else
      flash[:success] = "Your farmer account is created"
      redirect_to @farmer
    end
  end 


  def edit 
  end

  def update
    if @farmer.update(farmer_params)
      redirect_to  @farmer
    else
      render :edit
    end
  end

  def show 
  end

  

  def destroy
    @farmer.destroy
    redirect_to farmers_path
  end

  private 
  def farmer_params
    params.require(:farmer).permit(:name, :address, :introduction, :fruit_types, :picture)
  end

  def set_farmer
    @farmer = Farmer.find(params[:id])
  end

end
