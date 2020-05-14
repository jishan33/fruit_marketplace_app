class ProductsController < ApplicationController
  before_action :set_product, only: [:edit, :show, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  load_and_authorize_resource
  

  def index
    @products = Product.all.sort_by{|i| i.id}
  end

  def show
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.create(product_params.merge({farmer_id: current_user.farmer.id}))

    if @product.errors.any?
      render :new
    else
      flash[:success] = "Your product is added to the product page"
      redirect_to @product
    end
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to @product
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to products_path

  end


  private 

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:title, :rank, :quantity, :description, :price, :picture)
  end

end
