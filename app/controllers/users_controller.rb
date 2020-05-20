class UsersController < ApplicationController
before_action :authenticate_user!
load_and_authorize_resource

# provide the route for presenting the users' index view and show all the users in the record followed by its id order. 
  def index
    @users= User.all.sort_by{|i| i.id}
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_table_path
  end
end
