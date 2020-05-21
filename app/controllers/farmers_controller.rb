class FarmersController < ApplicationController
  before_action :set_farmer, only: [:edit, :update, :destroy, :show]
  before_action :authenticate_user!, only: [:edit, :update, :destroy]
  load_and_authorize_resource

  # GET/ this action shows all the farmers in the database and displayed on the index html view.
  # eager loading is added here to minimize database calls when fetching farmers attached pictures.
  def index
    @farmers = Farmer.with_attached_picture.all
  end

  # GET/ Firstly, using set_farmer method to find the farmer.id provides the route for showing the form to update the farmer
  def edit
  end

  # PUT/ Uses set_farmer before action to find the farmer, then updates the existing farmer with new filled in params from from edit html form. After the action, it will redirect to farmer show page.
  def update
    if @farmer.update(farmer_params)
      redirect_to @farmer
    else
      render :edit
    end
  end

  # GET/  use set_farmer before action to find the farmer and render the farmer view
  def show
  end

  # DELETE/ Before using this action to delete the farmer from the database, using set_farmer method to find the farmer. After the action, it will redirect to farmers page.
  def destroy
    @farmer.destroy
    redirect_to farmers_path
  end

  private

  # set the attributes in the farmers table to allow them to be updated.
  def farmer_params
    params.require(:farmer).permit(:name, :address, :introduction, :fruit_types, :picture)
  end

  # Use query parameter to find farmer's id
  def set_farmer
    @farmer = Farmer.find(params[:id])
  end
end
