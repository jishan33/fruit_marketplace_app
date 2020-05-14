# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  prepend_before_action :check_captcha, only: [:create]
  before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]
  

  # GET /resource/sign_up
  def new
    @is_farmer_registration = params[:user_type] == "farmer"
    super


  end

  # POST /resource
  def create
   
    super do |user|
      if user.id != nil && user.user_type == "farmer"
        farmer = params[:farmer]
        farmer[:user] = user
        farmer.permit!
        Farmer.create(farmer)
      end
    end
  end


  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute, :user_type])
  end
  

  protected

  def after_sign_up_path_for(resource)
    super(resource)
    dashboard_path
  end

  def check_captcha
    unless verify_recaptcha
      self.resource = resource_class.new configure_sign_up_params
      resource.validate
      set_minimum_password_length
      respond_with_navigational(resource) {render :new}
    end
  end


end
