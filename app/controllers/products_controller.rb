class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to @product, notice: 'Product was successfully created.'
    else
      render :new
    end
  end

  private
  
  def product_params
    params.require(:product).permit(:title, :author, :description, :isbn_13, :image_url, :price)
  end
end
