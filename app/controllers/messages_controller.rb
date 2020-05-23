class MessagesController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!


  def create
    @farmer = Farmer.find(params[:farmer_id])
    @message = @farmer.messages.create(message_params)
    redirect_to farmer_path(@farmer)
  end

  def destroy
    @farmer = Farmer.find(params[:farmer_id])
    @message = @farmer.messages.find(params[:id])
    @message.destroy
    redirect_to farmer_path(@farmer)
  end 

private
  def message_params
    params.require(:message).permit(:sender, :body)
  end

end
