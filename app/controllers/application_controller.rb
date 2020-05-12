class ApplicationController < ActionController::Base
  rescue_from CanCan::AccessDenied do |exception|
  flash[:authorization_error] = "No permit to perform that function ❌"
  redirect_to products_path
  end
end
