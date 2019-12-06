class User::OrdersController < ApplicationController

  def index
    
  end

  def new
    @product = Product.find(params[:product_id])
    @images = @product.product_images

    @order = @product.build_order
  end

  def create
    
  end

  def show
    
  end

end
