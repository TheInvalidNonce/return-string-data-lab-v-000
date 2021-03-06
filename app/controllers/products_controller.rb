class ProductsController < ApplicationController
  
  def index
    @products = Product.all
  end
  
  def new
    @product = Product.new
  end

  
  def create
    @product = Product.create(product_params)
    if @product.save
      redirect_to products_path
    else 
      render :new
    end
  end
  
  def description
    product = Product.find(params[:id])
    render plain: product.description
  end
  
  def inventory
    product = Product.find(params[:id])
    inventory = product.inventory != 0 ? 'true' : 'false' # Dont compare with greater than, it breaks the jquery
    render plain: inventory
  end
  
  private
  
  def product_params
    params.require(:product).permit(:name,:price, :description, :inventory)
  end

end
