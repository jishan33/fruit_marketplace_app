class ProductsController < ApplicationController
  before_action :set_product, only: [:edit, :show, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  load_and_authorize_resource

  def search  
    if params[:search].blank?
      flash[:alert]= "Empty field"
      redirect_to(root_path)
    else
     
      @parameter = params[:search].downcase

      is_number = @parameter.match(/^[0-9]+$/)
      if(is_number)
        price_target = @parameter.to_i
        @results_product = Product.all.where("price <= :price_target", price_target: price_target)
      else
        @results_product = Product.all.where("lower(title) LIKE :search", search: "%#{@parameter}%")
      end

 

      @results_farmer = Farmer.all.where("lower(name) LIKE :search", search: "%#{@parameter}%") 
    end 
  end
  

  def index
    @products = Product.all
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
