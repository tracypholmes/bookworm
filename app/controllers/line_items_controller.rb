class LineItemsController < ApplicationController
  include CurrentCart # don't forget the CurrentCart module!
  
  before_action :set_cart, only: [:create]
  before_action :set_line_item, only: [:show, :edit, :update, :destroy]

  def index
    @line_items = LineItem.all
  end

  def show
  end

  def new
    @line_item = LineItem.new
  end

  def edit
  end

  def create
    product = Product.find(params[:product_id])
    @line_item = @cart.line_items.build(product: product)
    if @line_item.save
      redirect_to @line_item.cart,
        notice: 'Line item was successfully created.'
    else
      render :new 
    end
  end

  def update
    respond_to do |format|
      if @line_item.update(line_item_params)
        redirect_to @line_item, notice: 'Line item was successfully updated.'
      else
        render :edit
      end
    end
  end

  def destroy
    @line_item.destroy
    respond_to do |format|
      redirect_to line_items_url, notice: 'Line item was successfully destroyed.'
    end
  end

  private
    def set_line_item
      @line_item = LineItem.find(params[:id])
    end

    def line_item_params
      params.require(:line_item).permit(:product_id, :cart_id)
    end
end
