class FarmersController < ApplicationController
  before_action :set_farmer, only: [:edit, :update, :destroy, :show]
  before_action :authenticate_user!, only:[:edit, :update, :destroy]
  load_and_authorize_resource

 # GET/ this action shows all the farmers in the record and displayed on the index html view. 
 # eager loading is added here to minimize database calls.
  def index
    @farmers = Farmer.with_attached_picture.all
  end


# GET/  Before render the edit html in view, using set_farmer method to find the product 
  def edit 
  end


# PUT/ Before updates existed farmer with new filled in params form from edit html , using set_farmer method to find the farmer. After the action, it will redirect to farmer show page.
  def update
    if @farmer.update(farmer_params)
      redirect_to  @farmer
    else
      render :edit
    end
  end

# PATCH/ Firstly, using set_farmer method to find the farmer.it provides the route for rendering show page
  def show 
  end

  
# DELETE/ Before using this action to delete the farmer from the record, using set_farmer method to find the farmer. After the action, it will redirect to farmers page. 
  def destroy
    @farmer.destroy
    redirect_to farmers_path
  end

  private 
# the attributes in framers table is allowed to be updated.
  def farmer_params
    params.require(:farmer).permit(:name, :address, :introduction, :fruit_types, :picture)
  end

# Use query string parameter to find farmer's id 
  def set_farmer
    @farmer = Farmer.find(params[:id])
  end

end
