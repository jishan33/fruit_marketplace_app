class DashboardsController < ApplicationController
  def index
    if current_user.admin == true
      @products =Product.all.sort_by{|i| i.id}
    elsif current_user.user_type == "farmer"
      @products = current_user.farmer.products.all.sort_by{|i| i.id}
    else
      @products = []
    end
  end
end
