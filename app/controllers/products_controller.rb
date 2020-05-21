class ProductsController < ApplicationController
  before_action :set_product, only: [:edit, :show, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  load_and_authorize_resource

  # searching algorithm will return the records in database which match to the search key words.
  # Also provides some additionally functionality around price searching if the user entered a number only.
  def search
    if params[:search].blank?
      flash[:alert] = "Empty field"
      redirect_to(root_path)
    else

      @parameter = params[:search].downcase

      is_number = @parameter.match(/^[0-9]+$/)
      if (is_number)
        price_target = @parameter.to_i
        @results_product = Product.all.where("price <= :price_target", price_target: price_target)
      else
        @results_product = Product.all.where("lower(title) LIKE :search", search: "%#{@parameter}%")
        @results_product = Product.all.where("lower(description) LIKE :search", search: "%#{@parameter}%")
      end

      @results_farmer = Farmer.all.where("lower(name) LIKE :search", search: "%#{@parameter}%")
    end
  end

  # GET/ this acion returns all the products in the products table and sends data to the index view
  # eager loading is added here to minimize database calls.
  def index
    @products = Product.with_attached_picture.all
  end

  # GET/ Firstly, using set_product method to find the product. It provides the route for rendering show page
  def show
  end

  # POST/ render the form for the creation of a new product
  def new
    @product = Product.new
  end

  # POST/ this action creates a new product with the filled in html form, because the farmer id is assigned directedly from the current farmer id, the merge method is added.
  def create
    @product = Product.create(product_params.merge({ farmer_id: current_user.farmer.id }))

    # If the filled in has any validation errors, the new form will be rendered and if the product is added successfully, it will redirected to the product show page.
    if @product.errors.any?
      render :new
    else
      flash[:success] = "Your product is added to the product page"
      redirect_to @product
    end
  end

  # GET/  Before render the edit html in view, using set_product method to find the product
  def edit
  end

  # PUT/ Updates the existing product with new filled in params form from edit html , uses set_product method to find the product. After the action, it will redirect to product show page.
  def update
    if @product.update(product_params)
      redirect_to @product
    else
      render :edit
    end
  end

  # DELETE/ Before using this action to delete the product from the record, the set_product method is used to find the product. After the action, it will redirect to products page.
  def destroy
    @product.destroy
    redirect_to dashboard_path
  end

  private

  # Use query string parameter to find product's id
  def set_product
    @product = Product.find(params[:id])
  end

  # allows product's attributes to be update and created.
  def product_params
    params.require(:product).permit(:title, :rank, :quantity, :description, :price, :picture)
  end
end
