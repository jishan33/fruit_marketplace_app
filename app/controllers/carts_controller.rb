class CartsController < ApplicationController
  # GET/ this action presents all the products that have been added to the current user's cart in the html view. If there are no products in the cart, it will be redirected to the products page.
  def index
    if user_signed_in? && current_user.cart
      @cart = current_user.cart
    else
      redirect_to products_path
    end
  end

  # POST/ If current user does not have a cart, the cart can be created and the complete status is set to false. When current user click on add product to his/her cart the product will be added to the cart and redirect to the cart page.
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

  # DELETE/ the action can delete products in the current user's cart and keep the newest record.

  def destroy
    cart = current_user.cart
    cart.cart_products.delete(params[:id])
    cart.save

    redirect_to carts_path
  end
end
