class FarmersController < ApplicationController
  before_action :set_farmer, only: [:edit, :update, :destroy, :show]
  before_action :authenticate_user, only:[:edit, :update, :destroy]
  load_and_authorize_resource
 # this action shows all the farmers in the record and displayed from the index view 
  def index
    @farmers = Farmer.all
  end

# provide the route for rendering edit page
  def edit 
  end


#this action update the farmer which is found by its id, with the fill in params and redirect to show page to present.
  def update
    if @farmer.update(farmer_params)
      redirect_to  @farmer
    else
      render :edit
    end
  end

# provide the route for rendering show page
  def show 
  end

  
# this action delete the farmer from the record.
  def destroy
    @farmer.destroy
    redirect_to farmers_path
  end

  private 
# the attributes in framers table is allow to be updated and created.
  def farmer_params
    params.require(:farmer).permit(:name, :address, :introduction, :fruit_types, :picture)
  end

# find the farmer by its id and the id is found from the string inquery.
  def set_farmer
    @farmer = Farmer.find(params[:id])
  end

end
