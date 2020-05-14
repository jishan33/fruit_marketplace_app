class CartsController < ApplicationController
  def index
    if user_signed_in? && current_user.cart
      @cart = current_user.cart
    else
      redirect_to products_path
    end
  end

  def create
    if !current_user.cart
      cart = Cart.create(completed: false, user_id: current_user.id)
    else
      cart = current_user.cart
    end 

    product = Product.find(params[:product_id])
    cart.products << product 
    redirect_to carts_path
  end

  def destroy
    cart = current_user.cart
    cart.cart_products.delete(params[:id])
    cart.save

    redirect_to carts_path
  end 

  
end
