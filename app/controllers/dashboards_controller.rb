class DashboardsController < ApplicationController
  # GET/ this action presents all the products belongs to current farmer by finding the products' farmer_id from the record in the index html.
  # Admin can see all products from the record.
  # If the farmer has not add any product, his/her dashboard page will have no product.
  def index
    if current_user.admin == true
      @products = Product.all
    elsif current_user.user_type == "farmer"
      @products = current_user.farmer.products.all.sort_by { |i| i.id }
    else
      @products = []
    end
  end
end
