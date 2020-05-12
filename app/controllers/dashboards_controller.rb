class DashboardsController < ApplicationController
  def index
    if current_user.admin == true
      @products =Product.all.sort_by{|i| i.id}
    else
      @products = current_user.products.all.sort_by{|i| i.id}
    end
  end
end
