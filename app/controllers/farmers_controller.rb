class FarmersController < ApplicationController
  before_action :set_farmer, only: [:edit, :update, :destroy, :show]
  
  def index
    @farmers = Farmer.all.sort_by{|i| i.id}
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
    params.require(:farmer).permit(:address, :introduction, :fruit_types, :picture)
  end

  def set_farmer
    @farmer = Farmer.find(params[:id])
  end

end
