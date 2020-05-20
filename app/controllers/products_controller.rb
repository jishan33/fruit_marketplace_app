class ProductsController < ApplicationController
  before_action :set_product, only: [:edit, :show, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  load_and_authorize_resource


#searching engine algorithm will return the data in database  match to the search key words.
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
        @results_product = Product.all.where("lower(description) LIKE :search", search: "%#{@parameter}%")
      end

 

      @results_farmer = Farmer.all.where("lower(name) LIKE :search", search: "%#{@parameter}%") 
    end 
  end
  
# this acion return all the products in the products table records and send them to the index view 
  def index
    @products = Product.all
  end

  def show
  end

# instantiate a new product
  def new
    @product = Product.new
  end

#this action create a new product with the fill in params and redirect to show page to present, the new product is instantiated in the new action.
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


# this action update existed product with new params, the product is set by finding its id.
  def update
    if @product.update(product_params)
      redirect_to @product
    else
      render :edit
    end
  end

# the product is found by its id and this action deletes the product from the record. 
  def destroy
    @product.destroy
    redirect_to products_path

  end


private 

# find the product by its id and the id is found from the string inquery.
  def set_product
    @product = Product.find(params[:id])
  end

# allows product's attributes to be update and created. 
  def product_params
    params.require(:product).permit(:title, :rank, :quantity, :description, :price, :picture)
  end

end
