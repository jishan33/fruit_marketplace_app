# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
 
  
  # GET /resource/sign_up
  def new
    @is_farmer_registration = params[:user_type] == "farmer"
    super


  end

  # POST /resource
  def create
    super
  end

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :user_type, farmer_attributes: [:name, :address, :introduction, :fruit_types, :picture]])
  end


  protected

  # The path used after sign up.
  def after_sign_up_path_for(resource)
    super(resource)
    products_path
  end
end
